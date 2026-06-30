import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/debug/debug_log.dart';
import '../../../../core/errors/app_failure.dart';
import '../../../../core/storage/local_storage_service.dart';
import '../../../../core/providers/storage_provider.dart';
import '../../domain/entities/translation_job.dart';
import '../../domain/entities/ai_provider.dart';
import '../../domain/entities/glossary.dart';
import '../../data/repositories/translation_repository.dart';
import '../../data/sources/translation_data_source.dart';
import 'ai_providers_provider.dart';

const _uuid = Uuid();

class TranslationJobNotifier extends StateNotifier<TranslationJob?> {
  final TranslationRepository _repository;
  final LocalStorageService _storage;
  final Ref _ref;
  final Logger _logger = Logger(printer: PrettyPrinter(methodCount: 0));
  CancelToken? _cancelToken;
  bool _cancelled = false;

  TranslationJobNotifier(
    this._repository,
    this._storage,
    this._ref,
  ) : super(null);

  /// Start a new translation job for a text string.
  Future<void> startTranslation({
    required String text,
    required String sourceLanguage,
    required String targetLanguage,
    required TranslationProfile profile,
    String customPrompt = '',
    String? providerId,
    List<GlossaryEntry> glossary = const [],
    int chunkSize = 2000,
    double temperature = 0.3,
  }) async {
    dlog('JOB', '=== startTranslation() ENTRY ===');

    // Wrap the ENTIRE method body in a top-level try-catch so that
    // no exception can ever escape silently into an unhandled Future.
    try {
      dlog('JOB', '  text: ${text.length} chars');
      dlog('JOB', '  source=$sourceLanguage target=$targetLanguage');
      dlog('JOB', '  profile=${profile.name} providerId=$providerId');

      _cancelled = false;
      _cancelToken = CancelToken();

      // ── Step 1: Read providers ──
      dlog('JOB', '  [step 1] reading activeProvidersProvider...');
      final activeProviders = _ref.read(activeProvidersProvider);
      dlog('JOB', '  [step 1] got ${activeProviders.length} active providers');

      // Pick provider
      AiProvider? provider;
      if (providerId != null) {
        provider = activeProviders.where((p) => p.id == providerId).firstOrNull;
      }
      provider ??= activeProviders.isNotEmpty ? activeProviders.first : null;

      if (provider == null) {
        dlog('JOB', '  ABORT: no provider');
        _setFailed('No active AI provider configured. Please add an API key in Settings.');
        return;
      }

      dlog('JOB', '  provider: ${provider.name} (${provider.type.name})');
      dlog('JOB', '  baseUrl: ${provider.baseUrl}');
      dlog('JOB', '  model: ${provider.selectedModel}');
      dlog('JOB', '  apiKey set: ${provider.apiKey.isNotEmpty}');

      // ── Step 2: Chunk text ──
      dlog('JOB', '  [step 2] chunking text (chunkSize=$chunkSize)...');
      final chunks = _repository.chunkText(text, chunkSize);
      dlog('JOB', '  [step 2] got ${chunks.length} chunk(s)');

      final translatedChunks = <TranslatedChunk>[
        for (int i = 0; i < chunks.length; i++)
          TranslatedChunk(id: _uuid.v4(), index: i, originalText: chunks[i]),
      ];

      // ── Step 3: Create job ──
      dlog('JOB', '  [step 3] creating job...');
      final job = TranslationJob(
        id: _uuid.v4(),
        documentId: '',
        documentName: 'Text Input',
        sourceLanguage: sourceLanguage,
        targetLanguage: targetLanguage,
        profile: profile,
        customPrompt: customPrompt,
        providerId: provider.id,
        status: TranslationStatus.inProgress,
        createdAt: DateTime.now(),
        chunks: translatedChunks,
        useGlossary: glossary.isNotEmpty,
      );
      dlog('JOB', '  [step 3] job created: ${job.id}');

      // ── Step 4: Set state ──
      dlog('JOB', '  [step 4] setting state = inProgress...');
      state = job;
      dlog('JOB', '  [step 4] state set OK');

      // ── Step 5: Save to storage (with timeout) ──
      dlog('JOB', '  [step 5] saving job to storage...');
      try {
        await _storage.saveJob(job)
            .timeout(const Duration(seconds: 5), onTimeout: () {
          dlog('JOB', '  [step 5] TIMEOUT after 5s — continuing without save');
          throw TimeoutException('Storage save timed out');
        });
        dlog('JOB', '  [step 5] save OK');
      } catch (saveErr) {
        dlog('JOB', '  [step 5] save FAILED: $saveErr — continuing anyway');
        // Do NOT return here. Translation can work without persistence.
      }

      // ── Step 6: Translate chunks ──
      dlog('JOB', '  [step 6] entering chunk loop (${chunks.length} chunks)');
      String previousContext = '';

      for (int i = 0; i < chunks.length; i++) {
        dlog('JOB', '  --- chunk ${i + 1}/${chunks.length} ---');

        if (_cancelled) {
          dlog('JOB', '  cancelled before chunk ${i + 1}');
          _setCancelled();
          return;
        }

        state = job.copyWith(
          chunks: List<TranslatedChunk>.from(state!.chunks),
          progress: i / chunks.length,
        );

        try {
          dlog('JOB', '  [chunk ${i + 1}] calling repository.translateChunk...');
          final translated = await _repository.translateChunk(
            text: chunks[i],
            sourceLanguage: sourceLanguage,
            targetLanguage: targetLanguage,
            profile: profile,
            provider: provider,
            customPrompt: customPrompt,
            glossary: glossary,
            previousContext: previousContext,
            cancelToken: _cancelToken,
          );

          dlog('JOB', '  [chunk ${i + 1}] OK: ${translated.length} chars');

          if (_cancelled) {
            _setCancelled();
            return;
          }

          final updatedChunks = List<TranslatedChunk>.from(state!.chunks);
          updatedChunks[i] = updatedChunks[i].copyWith(
            translatedText: translated,
            isComplete: true,
          );

          final progress = (i + 1) / chunks.length;
          state = job.copyWith(chunks: updatedChunks, progress: progress);

          // Fire-and-forget persistence — don't block the next chunk.
          _storage.saveJob(state!).catchError((e) {
            dlog('JOB', '  saveJob after chunk failed: $e');
          });

          previousContext = translated;
        } catch (e, stackTrace) {
          final errorMsg = _extractErrorMessage(e);
          dlog('JOB', '  *** chunk ${i + 1} EXCEPTION ***');
          dlog('JOB', '  type: ${e.runtimeType}');
          dlog('JOB', '  message: $errorMsg');
          dlog('JOB', '  stack: ${stackTrace.toString().split('\n').take(5).join(' | ')}');

          _logger.e('Translation FAILED chunk ${i + 1}: $errorMsg',
              error: e, stackTrace: stackTrace);

          _setFailed('Chunk ${i + 1} failed: $errorMsg');
          return;
        }
      }

      // ── Step 7: Completed ──
      dlog('JOB', '=== TRANSLATION COMPLETED ===');
      final completed = job.copyWith(
        chunks: state!.chunks,
        status: TranslationStatus.completed,
        progress: 1.0,
        completedAt: DateTime.now(),
      );
      state = completed;
      _storage.saveJob(completed).catchError((e) {
        dlog('JOB', '  saveJob completed failed: $e');
      });

    } catch (e, stackTrace) {
      // Top-level safety net: NO exception can escape from startTranslation.
      dlog('JOB', '=== UNHANDLED EXCEPTION in startTranslation ===');
      dlog('JOB', '  type: ${e.runtimeType}');
      dlog('JOB', '  error: $e');
      dlog('JOB', '  stack: ${stackTrace.toString().split('\n').take(8).join('\n  ')}');

      _logger.e('startTranslation unhandled error',
          error: e, stackTrace: stackTrace);

      // Try to set Failed state so the UI is never stuck in Loading.
      try {
        _setFailed('Unexpected error: $e');
      } catch (_) {
        dlog('JOB', '  COULD NOT set Failed state — UI may be stuck');
      }
    }
  }

  void _setFailed(String message) {
    final current = state;
    if (current != null) {
      state = current.copyWith(
        status: TranslationStatus.failed,
        errorMessage: message,
      );
    } else {
      state = TranslationJob(
        id: _uuid.v4(),
        documentId: '',
        documentName: 'Text Input',
        sourceLanguage: '',
        targetLanguage: '',
        profile: TranslationProfile.balanced,
        status: TranslationStatus.failed,
        errorMessage: message,
        createdAt: DateTime.now(),
      );
    }
    dlog('JOB', '  state -> FAILED: $message');
  }

  void _setCancelled() {
    final current = state;
    if (current != null) {
      state = current.copyWith(status: TranslationStatus.cancelled);
    }
    dlog('JOB', '  state -> CANCELLED');
  }

  /// Cancel the running translation.
  void cancel() {
    dlog('JOB', 'cancel() called');
    _cancelled = true;
    _cancelToken?.cancel('Translation cancelled by user');
    dlog('JOB', '  _cancelled=$_cancelled, token cancelled=${_cancelToken?.isCancelled}');
  }

  String getTranslatedText() {
    if (state == null) return '';
    return state!.chunks
        .where((c) => c.isComplete)
        .map((c) => c.translatedText)
        .join('\n\n');
  }

  static String _extractErrorMessage(Object error) {
    if (error is AppFailure) {
      return error.when(
        server: (message, statusCode) =>
            statusCode != null ? '$message (HTTP $statusCode)' : message,
        network: (message) => message,
        cache: (message) => message,
        parsing: (message) => message,
        fileNotFound: (path) => 'File not found: $path',
        unsupportedFormat: (format) => 'Unsupported format: $format',
        apiKeyMissing: (provider) => 'API key missing for $provider',
        quotaExceeded: (message) => message,
        translation: (message) => message,
        unknown: (message) => message,
      );
    }
    if (error is DioException) {
      final statusCode = error.response?.statusCode;
      final statusMsg = error.response?.statusMessage;
      final uri = error.requestOptions.uri;
      if (statusCode != null) {
        return 'HTTP $statusCode${statusMsg != null ? " ($statusMsg)" : ""} at $uri';
      }
      return '${error.message ?? error.type.name} at $uri';
    }
    return error.toString();
  }

  @override
  void dispose() {
    dlog('JOB', 'TranslationJobNotifier.dispose()');
    _cancelToken?.cancel('Provider disposed');
    super.dispose();
  }
}

final translationJobProvider =
    StateNotifierProvider<TranslationJobNotifier, TranslationJob?>((ref) {
  final storage = ref.watch(localStorageServiceProvider);
  final dataSource = TranslationDataSourceImpl();
  final repository = TranslationRepository(dataSource);
  return TranslationJobNotifier(repository, storage, ref);
});

/// Direct access to the translation repository for non-job operations (e.g. image OCR).
final translationRepositoryProvider = Provider<TranslationRepository>((ref) {
  return TranslationRepository(TranslationDataSourceImpl());
});

/// List of past translation jobs.
final pastJobsProvider = Provider<List<TranslationJob>>((ref) {
  final storage = ref.watch(localStorageServiceProvider);
  final jobs = storage.getJobs();
  jobs.sort((a, b) => b.createdAt.compareTo(a.createdAt));
  return jobs;
});

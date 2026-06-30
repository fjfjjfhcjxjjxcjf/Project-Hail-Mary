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
    dlog('JOB', '=== startTranslation() called ===');
    dlog('JOB', '  text length: ${text.length}');
    dlog('JOB', '  source: $sourceLanguage, target: $targetLanguage');
    dlog('JOB', '  profile: ${profile.name}');
    dlog('JOB', '  providerId param: $providerId');

    _cancelled = false;
    _cancelToken = CancelToken();
    dlog('JOB', '  CancelToken created: ${_cancelToken.hashCode}');

    // Read active providers on-demand (not watched) to avoid
    // provider recreation mid-translation.
    final activeProviders = _ref.read(activeProvidersProvider);
    dlog('JOB', '  active providers: ${activeProviders.length}');
    for (final p in activeProviders) {
      dlog('JOB', '    - ${p.id}: ${p.name} (${p.type.name}), '
          'model=${p.selectedModel}, keyLen=${p.apiKey.length}');
    }

    // Pick provider
    AiProvider? provider;
    if (providerId != null) {
      provider = activeProviders.where((p) => p.id == providerId).firstOrNull;
      dlog('JOB', '  picked by id "$providerId": ${provider?.name ?? "NOT FOUND"}');
    }
    provider ??= activeProviders.isNotEmpty ? activeProviders.first : null;

    if (provider == null) {
      dlog('JOB', '  FAIL: no provider available');
      state = TranslationJob(
        id: _uuid.v4(),
        documentId: '',
        documentName: 'Text Input',
        sourceLanguage: sourceLanguage,
        targetLanguage: targetLanguage,
        profile: profile,
        status: TranslationStatus.failed,
        errorMessage: 'No active AI provider configured. Please add an API key in Settings.',
        createdAt: DateTime.now(),
      );
      return;
    }

    dlog('JOB', '  USING provider: ${provider.name} (${provider.type.name})');
    dlog('JOB', '  baseUrl: ${provider.baseUrl}');
    dlog('JOB', '  model: ${provider.selectedModel}');

    // Chunk the text
    final chunks = _repository.chunkText(text, chunkSize);
    dlog('JOB', '  chunks: ${chunks.length}');
    for (int i = 0; i < chunks.length; i++) {
      dlog('JOB', '    chunk[$i]: ${chunks[i].length} chars');
    }

    final translatedChunks = <TranslatedChunk>[
      for (int i = 0; i < chunks.length; i++)
        TranslatedChunk(id: _uuid.v4(), index: i, originalText: chunks[i]),
    ];

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

    dlog('JOB', '  job created, id: ${job.id}');
    dlog('JOB', '  setting state to inProgress...');

    state = job;
    dlog('JOB', '  state set. Saving to storage...');

    await _storage.saveJob(job);
    dlog('JOB', '  job saved. Starting chunk loop...');

    _logger.i('Translation started: ${chunks.length} chunk(s), '
        'provider=${provider.name}, model=${provider.selectedModel}, '
        '$sourceLanguage -> $targetLanguage');

    // Translate chunks sequentially
    String previousContext = '';
    for (int i = 0; i < chunks.length; i++) {
      dlog('JOB', '--- chunk ${i + 1}/${chunks.length} ---');

      if (_cancelled) {
        dlog('JOB', '  CANCELLED before chunk ${i + 1}');
        final cancelled = job.copyWith(
          status: TranslationStatus.cancelled,
          chunks: state!.chunks,
        );
        state = cancelled;
        await _storage.saveJob(cancelled);
        return;
      }

      // Update chunk status to show progress
      final progressChunks = List<TranslatedChunk>.from(state!.chunks);
      state = job.copyWith(
        chunks: progressChunks,
        progress: i / chunks.length,
      );
      dlog('JOB', '  state updated, progress: ${(i / chunks.length * 100).toStringAsFixed(0)}%');

      try {
        dlog('JOB', '  calling _repository.translateChunk...');
        dlog('JOB', '  cancelToken attached: ${_cancelToken != null}');

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

        dlog('JOB', '  translateChunk returned: ${translated.length} chars');

        if (_cancelled) {
          dlog('JOB', '  CANCELLED after chunk ${i + 1}');
          final cancelled = job.copyWith(
            status: TranslationStatus.cancelled,
            chunks: state!.chunks,
          );
          state = cancelled;
          await _storage.saveJob(cancelled);
          return;
        }

        final updatedChunks = List<TranslatedChunk>.from(state!.chunks);
        updatedChunks[i] = updatedChunks[i].copyWith(
          translatedText: translated,
          isComplete: true,
        );

        final progress = (i + 1) / chunks.length;
        final updated = job.copyWith(
          chunks: updatedChunks,
          progress: progress,
        );
        state = updated;
        await _storage.saveJob(updated);

        dlog('JOB', '  chunk ${i + 1} complete. progress: ${(progress * 100).toStringAsFixed(0)}%');

        previousContext = translated;
      } catch (e, stackTrace) {
        final errorMsg = _extractErrorMessage(e);

        dlog('JOB', '  *** EXCEPTION on chunk ${i + 1} ***');
        dlog('JOB', '  type: ${e.runtimeType}');
        dlog('JOB', '  message: $errorMsg');
        dlog('JOB', '  toString: ${e.toString()}');
        dlog('JOB', '  stackTrace: ${stackTrace.toString().split('\n').take(5).join(' | ')}');

        _logger.e(
          'Translation FAILED on chunk ${i + 1}/${chunks.length}: $errorMsg',
          error: e,
          stackTrace: stackTrace,
        );

        dlog('JOB', '  transitioning state to FAILED...');

        // Transition UI to Failed state with the real error message.
        try {
          final updatedChunks = List<TranslatedChunk>.from(state!.chunks);
          updatedChunks[i] = updatedChunks[i].copyWith(
            errorMessage: errorMsg,
          );
          final updated = job.copyWith(
            chunks: updatedChunks,
            status: TranslationStatus.failed,
            errorMessage: 'Chunk ${i + 1} failed: $errorMsg',
          );
          state = updated;
          dlog('JOB', '  state set to FAILED: $errorMsg');
          await _storage.saveJob(updated);
          dlog('JOB', '  failed state saved to storage');
        } catch (saveError) {
          dlog('JOB', '  saveJob ALSO FAILED: $saveError');
          _logger.e('Failed to persist error state: $saveError');
          state = job.copyWith(
            status: TranslationStatus.failed,
            errorMessage: 'Chunk ${i + 1} failed: $errorMsg',
          );
          dlog('JOB', '  state set to FAILED (in-memory only)');
        }
        return;
      }
    }

    // Completed
    dlog('JOB', '=== Translation COMPLETED ===');
    _logger.i('Translation completed: ${chunks.length} chunk(s)');
    final completed = job.copyWith(
      chunks: state!.chunks,
      status: TranslationStatus.completed,
      progress: 1.0,
      completedAt: DateTime.now(),
    );
    state = completed;
    await _storage.saveJob(completed);
    dlog('JOB', '  completed state saved');
  }

  /// Cancel the running translation.
  void cancel() {
    dlog('JOB', 'cancel() called, _cancelled=$_cancelled');
    dlog('JOB', '  _cancelToken: ${_cancelToken?.hashCode}');
    dlog('JOB', '  _cancelToken.isCancelled: ${_cancelToken?.isCancelled}');
    _cancelled = true;
    _cancelToken?.cancel('Translation cancelled by user');
    dlog('JOB', '  cancelToken.cancel() called');
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

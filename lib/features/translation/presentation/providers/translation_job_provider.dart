import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:uuid/uuid.dart';
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
    _cancelled = false;
    _cancelToken = CancelToken();

    // Read active providers on-demand (not watched) to avoid
    // provider recreation mid-translation.
    final activeProviders = _ref.read(activeProvidersProvider);

    // Pick provider
    AiProvider? provider;
    if (providerId != null) {
      provider = activeProviders.where((p) => p.id == providerId).firstOrNull;
    }
    provider ??= activeProviders.isNotEmpty ? activeProviders.first : null;
    if (provider == null) {
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

    // Chunk the text
    final chunks = _repository.chunkText(text, chunkSize);
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

    state = job;
    await _storage.saveJob(job);

    _logger.i('Translation started: ${chunks.length} chunk(s), '
        'provider=${provider.name}, model=${provider.selectedModel}, '
        '$sourceLanguage -> $targetLanguage');

    // Translate chunks sequentially
    String previousContext = '';
    for (int i = 0; i < chunks.length; i++) {
      if (_cancelled) {
        _logger.i('Translation cancelled before chunk ${i + 1}/${chunks.length}');
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

      try {
        _logger.d('Translating chunk ${i + 1}/${chunks.length} '
            '(${chunks[i].length} chars)');

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

        if (_cancelled) {
          _logger.i('Translation cancelled after chunk ${i + 1}/${chunks.length}');
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

        _logger.d('Chunk ${i + 1}/${chunks.length} complete '
            '(${translated.length} chars translated)');

        previousContext = translated;
      } catch (e, stackTrace) {
        // Extract the real, human-readable error message.
        // AppFailure variants all carry a `message` field; for DioException
        // the statusCode and endpoint are useful context.
        final errorMsg = _extractErrorMessage(e);

        _logger.e(
          'Translation FAILED on chunk ${i + 1}/${chunks.length}: $errorMsg',
          error: e,
          stackTrace: stackTrace,
        );

        // Transition UI to Failed state with the real error message.
        // This MUST happen in a try/catch so a storage write failure
        // doesn't mask the original translation error.
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
          await _storage.saveJob(updated);
        } catch (saveError) {
          // Storage write failed — at minimum update the in-memory state
          // so the UI doesn't stay stuck in Loading.
          _logger.e('Failed to persist error state: $saveError');
          state = job.copyWith(
            status: TranslationStatus.failed,
            errorMessage: 'Chunk ${i + 1} failed: $errorMsg',
          );
        }
        return;
      }
    }

    // Completed
    _logger.i('Translation completed: ${chunks.length} chunk(s)');
    final completed = job.copyWith(
      chunks: state!.chunks,
      status: TranslationStatus.completed,
      progress: 1.0,
      completedAt: DateTime.now(),
    );
    state = completed;
    await _storage.saveJob(completed);
  }

  /// Cancel the running translation.
  /// Immediately cancels the in-flight HTTP request via CancelToken,
  /// and sets a flag to prevent any subsequent chunk processing.
  void cancel() {
    _logger.i('Translation cancel requested');
    _cancelled = true;
    _cancelToken?.cancel('Translation cancelled by user');
  }

  /// Get the full translated text.
  String getTranslatedText() {
    if (state == null) return '';
    return state!.chunks
        .where((c) => c.isComplete)
        .map((c) => c.translatedText)
        .join('\n\n');
  }

  /// Extract a clean, human-readable error message from any exception type.
  /// Preserves the real error — never replaces it with a generic string.
  static String _extractErrorMessage(Object error) {
    if (error is AppFailure) {
      // Freezed union: use when() to extract the message from every variant.
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
    _cancelToken?.cancel('Provider disposed');
    super.dispose();
  }
}

final translationJobProvider =
    StateNotifierProvider<TranslationJobNotifier, TranslationJob?>((ref) {
  final storage = ref.watch(localStorageServiceProvider);
  final dataSource = TranslationDataSourceImpl();
  final repository = TranslationRepository(dataSource);
  // NOTE: We pass `ref` and READ activeProvidersProvider inside
  // startTranslation() instead of WATCHing it here. This prevents
  // the notifier from being destroyed and recreated when providers
  // change, which would orphan an in-progress translation.
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

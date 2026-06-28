import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
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
  final List<AiProvider> _activeProviders;
  StreamSubscription<String>? _streamSub;
  bool _cancelled = false;

  TranslationJobNotifier(
    this._repository,
    this._storage,
    this._activeProviders,
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

    // Pick provider
    AiProvider? provider;
    if (providerId != null) {
      provider = _activeProviders.where((p) => p.id == providerId).firstOrNull;
    }
    provider ??= _activeProviders.isNotEmpty ? _activeProviders.first : null;
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

    // Translate chunks sequentially
    String previousContext = '';
    for (int i = 0; i < chunks.length; i++) {
      if (_cancelled) {
        final cancelled = job.copyWith(
          status: TranslationStatus.cancelled,
          chunks: state!.chunks,
        );
        state = cancelled;
        await _storage.saveJob(cancelled);
        return;
      }

      try {
        final translated = await _repository.translateChunk(
          text: chunks[i],
          sourceLanguage: sourceLanguage,
          targetLanguage: targetLanguage,
          profile: profile,
          provider: provider!,
          customPrompt: customPrompt,
          glossary: glossary,
          previousContext: previousContext,
        );

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

        previousContext = translated;
      } catch (e) {
        final updatedChunks = List<TranslatedChunk>.from(state!.chunks);
        updatedChunks[i] = updatedChunks[i].copyWith(
          errorMessage: e.toString(),
        );
        final updated = job.copyWith(
          chunks: updatedChunks,
          status: TranslationStatus.failed,
          errorMessage: 'Chunk ${i + 1} failed: $e',
        );
        state = updated;
        await _storage.saveJob(updated);
        return;
      }
    }

    // Completed
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
  void cancel() {
    _cancelled = true;
  }

  /// Get the full translated text.
  String getTranslatedText() {
    if (state == null) return '';
    return state!.chunks
        .where((c) => c.isComplete)
        .map((c) => c.translatedText)
        .join('\n\n');
  }

  @override
  void dispose() {
    _streamSub?.cancel();
    super.dispose();
  }
}

final translationJobProvider =
    StateNotifierProvider<TranslationJobNotifier, TranslationJob?>((ref) {
  final storage = ref.watch(localStorageServiceProvider);
  final dataSource = TranslationDataSourceImpl();
  final repository = TranslationRepository(dataSource);
  final activeProviders = ref.watch(activeProvidersProvider);
  return TranslationJobNotifier(repository, storage, activeProviders);
});

/// List of past translation jobs.
final pastJobsProvider = Provider<List<TranslationJob>>((ref) {
  final storage = ref.watch(localStorageServiceProvider);
  final jobs = storage.getJobs();
  jobs.sort((a, b) => b.createdAt.compareTo(a.createdAt));
  return jobs;
});

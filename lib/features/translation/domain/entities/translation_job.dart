import 'package:freezed_annotation/freezed_annotation.dart';

part 'translation_job.freezed.dart';
part 'translation_job.g.dart';

enum TranslationStatus { pending, inProgress, paused, completed, failed, cancelled }

enum TranslationProfile {
  literal, balanced, literary, academic, technical,
  children, poetry, novel, manga, custom;

  String get displayName {
    switch (this) {
      case TranslationProfile.literal: return 'Literal';
      case TranslationProfile.balanced: return 'Balanced';
      case TranslationProfile.literary: return 'Literary';
      case TranslationProfile.academic: return 'Academic';
      case TranslationProfile.technical: return 'Technical';
      case TranslationProfile.children: return 'Children';
      case TranslationProfile.poetry: return 'Poetry';
      case TranslationProfile.novel: return 'Novel';
      case TranslationProfile.manga: return 'Manga';
      case TranslationProfile.custom: return 'Custom';
    }
  }

  String get systemPrompt {
    switch (this) {
      case TranslationProfile.literal: return _literalPrompt;
      case TranslationProfile.balanced: return _balancedPrompt;
      case TranslationProfile.literary: return _literaryPrompt;
      case TranslationProfile.academic: return _academicPrompt;
      case TranslationProfile.technical: return _technicalPrompt;
      case TranslationProfile.children: return _childrenPrompt;
      case TranslationProfile.poetry: return _poetryPrompt;
      case TranslationProfile.novel: return _novelPrompt;
      case TranslationProfile.manga: return _mangaPrompt;
      case TranslationProfile.custom: return '';
    }
  }

  static const _literalPrompt = 'Translate the following text with maximum accuracy, preserving the original meaning word-for-word where possible. Maintain all formatting, paragraph breaks, and structure exactly as the source.';
  static const _balancedPrompt = 'Translate the following text naturally while staying faithful to the original meaning. Balance accuracy with readability. Preserve formatting and structure.';
  static const _literaryPrompt = 'Translate the following text with literary quality. Focus on beautiful, flowing prose that reads as if originally written in the target language. Preserve tone, style, and emotional impact. Maintain chapter and paragraph structure.';
  static const _academicPrompt = 'Translate the following academic/technical text with precision. Maintain technical terminology accuracy. Use formal register appropriate for academic publications. Preserve citations, footnotes, and section numbering.';
  static const _technicalPrompt = 'Translate the following technical text. Preserve all code blocks, URLs, and technical terms exactly. Translate explanatory text naturally. Maintain document structure including headings, lists, and tables.';
  static const _childrenPrompt = 'Translate the following text for a young audience. Use simple, clear language appropriate for children. Maintain the playful and engaging tone. Preserve illustrations references and formatting.';
  static const _poetryPrompt = 'Translate the following poetry with attention to rhythm, rhyme, and poetic beauty. Capture the spirit and emotion of the original rather than literal meaning. Preserve line breaks and stanza structure.';
  static const _novelPrompt = 'Translate the following novel/fiction text. Focus on natural dialogue, character voice consistency, and narrative flow. Preserve chapter structure, paragraph breaks, and formatting. Make it read as if originally written in the target language.';
  static const _mangaPrompt = 'Translate the following manga/comic text. Keep dialogue natural and character-appropriate. Preserve sound effects format. Maintain panel reading order markers if present.';
}

@freezed
class TranslationJob with _$TranslationJob {
  @JsonSerializable(explicitToJson: true)
  const factory TranslationJob({
    required String id,
    required String documentId,
    required String documentName,
    required String sourceLanguage,
    required String targetLanguage,
    required TranslationProfile profile,
    @Default(TranslationStatus.pending) TranslationStatus status,
    @Default(0.0) double progress,
    @Default('') String customPrompt,
    @Default('') String providerId,
    required DateTime createdAt,
    DateTime? completedAt,
    @Default([]) List<TranslatedChunk> chunks,
    String? errorMessage,
    @Default(false) bool useGlossary,
    @Default(false) bool useContextAware,
  }) = _TranslationJob;

  factory TranslationJob.fromJson(Map<String, dynamic> json) => _$TranslationJobFromJson(json);
}

@freezed
class TranslatedChunk with _$TranslatedChunk {
  const factory TranslatedChunk({
    required String id,
    required int index,
    required String originalText,
    @Default('') String translatedText,
    @Default(false) bool isComplete,
    @Default(false) bool isReviewed,
    String? errorMessage,
  }) = _TranslatedChunk;

  factory TranslatedChunk.fromJson(Map<String, dynamic> json) => _$TranslatedChunkFromJson(json);
}

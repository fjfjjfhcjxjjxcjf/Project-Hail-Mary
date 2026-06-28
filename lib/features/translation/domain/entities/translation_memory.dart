import 'package:freezed_annotation/freezed_annotation.dart';

part 'translation_memory.freezed.dart';
part 'translation_memory.g.dart';

enum MemoryScope { project, series, universe, global }

@freezed
class TranslationMemoryEntry with _$TranslationMemoryEntry {
  const factory TranslationMemoryEntry({
    required String id,
    required String sourceText,
    required String translatedText,
    required String sourceLanguage,
    required String targetLanguage,
    @Default('') String profileId,
    @Default('') String providerId,
    @Default(MemoryScope.project) MemoryScope scope,
    @Default('') String projectId,
    @Default('') String seriesId,
    @Default(0) int hitCount,
    @Default(0.0) double qualityScore,
    required DateTime createdAt,
    DateTime? lastUsedAt,
    @Default({}) Map<String, String> metadata,
  }) = _TranslationMemoryEntry;

  factory TranslationMemoryEntry.fromJson(Map<String, dynamic> json) => _$TranslationMemoryEntryFromJson(json);
}

@freezed
class TranslationMemory with _$TranslationMemory {
  const factory TranslationMemory({
    required String id,
    required String name,
    @Default(MemoryScope.project) MemoryScope scope,
    @Default('') String projectId,
    @Default('') String seriesId,
    @Default([]) List<TranslationMemoryEntry> entries,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _TranslationMemory;

  factory TranslationMemory.fromJson(Map<String, dynamic> json) => _$TranslationMemoryFromJson(json);
}

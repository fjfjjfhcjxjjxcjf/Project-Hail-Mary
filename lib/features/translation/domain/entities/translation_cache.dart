import 'package:freezed_annotation/freezed_annotation.dart';

part 'translation_cache.freezed.dart';
part 'translation_cache.g.dart';

@freezed
class CacheEntry with _$CacheEntry {
  const factory CacheEntry({
    required String id,
    required String sourceHash,
    required String sourceText,
    required String translatedText,
    required String sourceLanguage,
    required String targetLanguage,
    @Default('') String profileId,
    @Default('') String providerId,
    @Default('') String modelId,
    @Default(0) int hitCount,
    @Default(0.0) double qualityScore,
    required DateTime createdAt,
    DateTime? lastUsedAt,
  }) = _CacheEntry;

  factory CacheEntry.fromJson(Map<String, dynamic> json) => _$CacheEntryFromJson(json);
}

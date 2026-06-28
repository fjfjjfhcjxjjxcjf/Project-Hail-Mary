import 'package:freezed_annotation/freezed_annotation.dart';

part 'comparison_result.freezed.dart';
part 'comparison_result.g.dart';

@freezed
class ComparisonResult with _$ComparisonResult {
  const factory ComparisonResult({
    required String id,
    required String sourceText,
    @Default([]) List<TranslationCandidate> candidates,
    @Default(-1) int selectedIndex,
    required DateTime createdAt,
  }) = _ComparisonResult;

  factory ComparisonResult.fromJson(Map<String, dynamic> json) => _$ComparisonResultFromJson(json);
}

@freezed
class TranslationCandidate with _$TranslationCandidate {
  const factory TranslationCandidate({
    required String providerId,
    required String providerName,
    required String modelName,
    required String translatedText,
    @Default(0.0) double qualityScore,
    @Default(0) int tokenCount,
    @Default(0.0) double costUsd,
    @Default(0) int durationMs,
    @Default(false) bool isSelected,
  }) = _TranslationCandidate;

  factory TranslationCandidate.fromJson(Map<String, dynamic> json) => _$TranslationCandidateFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_analysis.freezed.dart';
part 'book_analysis.g.dart';

enum AnalysisStatus { pending, inProgress, completed, failed }

@freezed
class BookAnalysis with _$BookAnalysis {
  const factory BookAnalysis({
    required String id,
    required String documentId,
    @Default(AnalysisStatus.pending) AnalysisStatus status,
    @Default(0) int totalChapters,
    @Default(0) int totalWords,
    @Default(0) int totalCharacters,
    @Default(0) int totalParagraphs,
    @Default('') String detectedLanguage,
    @Default(0) int imageCount,
    @Default(0) int ocrPageCount,
    @Default([]) List<ExtractedEntity> extractedEntities,
    @Default([]) List<ExtractedTerm> extractedTerms,
    @Default([]) List<ChapterSummary> chapterSummaries,
    @Default(0.0) double estimatedCostUsd,
    @Default(0) int estimatedTokens,
    @Default(0) int estimatedMinutes,
    @Default(0) int tableCount,
    @Default(0) int codeBlockCount,
    @Default([]) List<String> detectedFormats,
    @Default('') String summary,
    required DateTime createdAt,
    DateTime? completedAt,
    String? errorMessage,
  }) = _BookAnalysis;

  factory BookAnalysis.fromJson(Map<String, dynamic> json) => _$BookAnalysisFromJson(json);
}

@freezed
class ExtractedEntity with _$ExtractedEntity {
  const factory ExtractedEntity({
    required String name,
    required String type, // character, place, org, etc.
    @Default(0) int occurrences,
    @Default([]) List<String> aliases,
    @Default('') String context,
  }) = _ExtractedEntity;

  factory ExtractedEntity.fromJson(Map<String, dynamic> json) => _$ExtractedEntityFromJson(json);
}

@freezed
class ExtractedTerm with _$ExtractedTerm {
  const factory ExtractedTerm({
    required String term,
    @Default('') String category,
    @Default(0) int occurrences,
    @Default('') String context,
  }) = _ExtractedTerm;

  factory ExtractedTerm.fromJson(Map<String, dynamic> json) => _$ExtractedTermFromJson(json);
}

@freezed
class ChapterSummary with _$ChapterSummary {
  const factory ChapterSummary({
    required String title,
    @Default(0) int index,
    @Default(0) int wordCount,
    @Default('') String preview,
    @Default(0) int imageCount,
  }) = _ChapterSummary;

  factory ChapterSummary.fromJson(Map<String, dynamic> json) => _$ChapterSummaryFromJson(json);
}

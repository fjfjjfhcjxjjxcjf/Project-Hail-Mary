import 'package:freezed_annotation/freezed_annotation.dart';

part 'document.freezed.dart';
part 'document.g.dart';

enum DocumentFormat {
  pdf, epub, mobi, azw3, docx, doc,
  txt, rtf, md, markdown, html, htm,
  csv, odt, image, unknown;

  static DocumentFormat fromExtension(String ext) {
    final e = ext.toLowerCase().replaceAll('.', '');
    return DocumentFormat.values.firstWhere(
      (f) => f.name == e,
      orElse: () => DocumentFormat.unknown,
    );
  }
}

@freezed
class Document with _$Document {
  const factory Document({
    required String id,
    required String name,
    required String path,
    required DocumentFormat format,
    required int sizeBytes,
    required DateTime addedAt,
    @Default(0) int pageCount,
    @Default('') String extractedText,
    @Default([]) List<DocumentChapter> chapters,
    TranslationProgress? translationProgress,
  }) = _Document;

  factory Document.fromJson(Map<String, dynamic> json) => _$DocumentFromJson(json);
}

@freezed
class DocumentChapter with _$DocumentChapter {
  const factory DocumentChapter({
    required String id,
    required String title,
    required String content,
    @Default(0) int index,
    @Default(0) int wordCount,
  }) = _DocumentChapter;

  factory DocumentChapter.fromJson(Map<String, dynamic> json) => _$DocumentChapterFromJson(json);
}

@freezed
class TranslationProgress with _$TranslationProgress {
  const factory TranslationProgress({
    @Default(0) int totalChunks,
    @Default(0) int completedChunks,
    @Default('') String currentStatus,
    @Default(false) bool isComplete,
    @Default(false) bool isFailed,
    String? errorMessage,
  }) = _TranslationProgress;

  factory TranslationProgress.fromJson(Map<String, dynamic> json) => _$TranslationProgressFromJson(json);
}

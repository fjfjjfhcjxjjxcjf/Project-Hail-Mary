import 'package:freezed_annotation/freezed_annotation.dart';

part 'quality_report.freezed.dart';
part 'quality_report.g.dart';

enum QualityCheckType { aiReview, aiEdit, aiProofread, consistencyCheck, overall }

@freezed
class QualityReport with _$QualityReport {
  const factory QualityReport({
    required String id,
    required String jobId,
    @Default(0.0) double overallScore, // 0-100
    @Default([]) List<QualityCheck> checks,
    @Default([]) List<QualityIssue> issues,
    @Default('') String summary,
    required DateTime createdAt,
  }) = _QualityReport;

  factory QualityReport.fromJson(Map<String, dynamic> json) => _$QualityReportFromJson(json);
}

@freezed
class QualityCheck with _$QualityCheck {
  const factory QualityCheck({
    required QualityCheckType type,
    @Default(0.0) double score,
    @Default('') String feedback,
    @Default(0) int issueCount,
  }) = _QualityCheck;

  factory QualityCheck.fromJson(Map<String, dynamic> json) => _$QualityCheckFromJson(json);
}

enum IssueSeverity { low, medium, high, critical }

@freezed
class QualityIssue with _$QualityIssue {
  const factory QualityIssue({
    required String message,
    @Default(IssueSeverity.medium) IssueSeverity severity,
    @Default('') String chunkId,
    @Default('') String suggestion,
    @Default('') String context,
  }) = _QualityIssue;

  factory QualityIssue.fromJson(Map<String, dynamic> json) => _$QualityIssueFromJson(json);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quality_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QualityReportImpl _$$QualityReportImplFromJson(Map<String, dynamic> json) =>
    _$QualityReportImpl(
      id: json['id'] as String,
      jobId: json['jobId'] as String,
      overallScore: (json['overallScore'] as num?)?.toDouble() ?? 0.0,
      checks:
          (json['checks'] as List<dynamic>?)
              ?.map((e) => QualityCheck.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      issues:
          (json['issues'] as List<dynamic>?)
              ?.map((e) => QualityIssue.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      summary: json['summary'] as String? ?? '',
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$QualityReportImplToJson(_$QualityReportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jobId': instance.jobId,
      'overallScore': instance.overallScore,
      'checks': instance.checks,
      'issues': instance.issues,
      'summary': instance.summary,
      'createdAt': instance.createdAt.toIso8601String(),
    };

_$QualityCheckImpl _$$QualityCheckImplFromJson(Map<String, dynamic> json) =>
    _$QualityCheckImpl(
      type: $enumDecode(_$QualityCheckTypeEnumMap, json['type']),
      score: (json['score'] as num?)?.toDouble() ?? 0.0,
      feedback: json['feedback'] as String? ?? '',
      issueCount: (json['issueCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$QualityCheckImplToJson(_$QualityCheckImpl instance) =>
    <String, dynamic>{
      'type': _$QualityCheckTypeEnumMap[instance.type]!,
      'score': instance.score,
      'feedback': instance.feedback,
      'issueCount': instance.issueCount,
    };

const _$QualityCheckTypeEnumMap = {
  QualityCheckType.aiReview: 'aiReview',
  QualityCheckType.aiEdit: 'aiEdit',
  QualityCheckType.aiProofread: 'aiProofread',
  QualityCheckType.consistencyCheck: 'consistencyCheck',
  QualityCheckType.overall: 'overall',
};

_$QualityIssueImpl _$$QualityIssueImplFromJson(Map<String, dynamic> json) =>
    _$QualityIssueImpl(
      message: json['message'] as String,
      severity:
          $enumDecodeNullable(_$IssueSeverityEnumMap, json['severity']) ??
          IssueSeverity.medium,
      chunkId: json['chunkId'] as String? ?? '',
      suggestion: json['suggestion'] as String? ?? '',
      context: json['context'] as String? ?? '',
    );

Map<String, dynamic> _$$QualityIssueImplToJson(_$QualityIssueImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'severity': _$IssueSeverityEnumMap[instance.severity]!,
      'chunkId': instance.chunkId,
      'suggestion': instance.suggestion,
      'context': instance.context,
    };

const _$IssueSeverityEnumMap = {
  IssueSeverity.low: 'low',
  IssueSeverity.medium: 'medium',
  IssueSeverity.high: 'high',
  IssueSeverity.critical: 'critical',
};

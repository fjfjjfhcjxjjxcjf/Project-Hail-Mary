// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comparison_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ComparisonResultImpl _$$ComparisonResultImplFromJson(
  Map<String, dynamic> json,
) => _$ComparisonResultImpl(
  id: json['id'] as String,
  sourceText: json['sourceText'] as String,
  candidates:
      (json['candidates'] as List<dynamic>?)
          ?.map((e) => TranslationCandidate.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  selectedIndex: (json['selectedIndex'] as num?)?.toInt() ?? -1,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$$ComparisonResultImplToJson(
  _$ComparisonResultImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'sourceText': instance.sourceText,
  'candidates': instance.candidates,
  'selectedIndex': instance.selectedIndex,
  'createdAt': instance.createdAt.toIso8601String(),
};

_$TranslationCandidateImpl _$$TranslationCandidateImplFromJson(
  Map<String, dynamic> json,
) => _$TranslationCandidateImpl(
  providerId: json['providerId'] as String,
  providerName: json['providerName'] as String,
  modelName: json['modelName'] as String,
  translatedText: json['translatedText'] as String,
  qualityScore: (json['qualityScore'] as num?)?.toDouble() ?? 0.0,
  tokenCount: (json['tokenCount'] as num?)?.toInt() ?? 0,
  costUsd: (json['costUsd'] as num?)?.toDouble() ?? 0.0,
  durationMs: (json['durationMs'] as num?)?.toInt() ?? 0,
  isSelected: json['isSelected'] as bool? ?? false,
);

Map<String, dynamic> _$$TranslationCandidateImplToJson(
  _$TranslationCandidateImpl instance,
) => <String, dynamic>{
  'providerId': instance.providerId,
  'providerName': instance.providerName,
  'modelName': instance.modelName,
  'translatedText': instance.translatedText,
  'qualityScore': instance.qualityScore,
  'tokenCount': instance.tokenCount,
  'costUsd': instance.costUsd,
  'durationMs': instance.durationMs,
  'isSelected': instance.isSelected,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation_job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TranslationJobImpl _$$TranslationJobImplFromJson(Map<String, dynamic> json) =>
    _$TranslationJobImpl(
      id: json['id'] as String,
      documentId: json['documentId'] as String,
      documentName: json['documentName'] as String,
      sourceLanguage: json['sourceLanguage'] as String,
      targetLanguage: json['targetLanguage'] as String,
      profile: $enumDecode(_$TranslationProfileEnumMap, json['profile']),
      status:
          $enumDecodeNullable(_$TranslationStatusEnumMap, json['status']) ??
          TranslationStatus.pending,
      progress: (json['progress'] as num?)?.toDouble() ?? 0.0,
      customPrompt: json['customPrompt'] as String? ?? '',
      providerId: json['providerId'] as String? ?? '',
      createdAt: DateTime.parse(json['createdAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      chunks:
          (json['chunks'] as List<dynamic>?)
              ?.map((e) => TranslatedChunk.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      errorMessage: json['errorMessage'] as String?,
      useGlossary: json['useGlossary'] as bool? ?? false,
      useContextAware: json['useContextAware'] as bool? ?? false,
    );

Map<String, dynamic> _$$TranslationJobImplToJson(
  _$TranslationJobImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'documentId': instance.documentId,
  'documentName': instance.documentName,
  'sourceLanguage': instance.sourceLanguage,
  'targetLanguage': instance.targetLanguage,
  'profile': _$TranslationProfileEnumMap[instance.profile]!,
  'status': _$TranslationStatusEnumMap[instance.status]!,
  'progress': instance.progress,
  'customPrompt': instance.customPrompt,
  'providerId': instance.providerId,
  'createdAt': instance.createdAt.toIso8601String(),
  'completedAt': instance.completedAt?.toIso8601String(),
  'chunks': instance.chunks,
  'errorMessage': instance.errorMessage,
  'useGlossary': instance.useGlossary,
  'useContextAware': instance.useContextAware,
};

const _$TranslationProfileEnumMap = {
  TranslationProfile.literal: 'literal',
  TranslationProfile.balanced: 'balanced',
  TranslationProfile.literary: 'literary',
  TranslationProfile.academic: 'academic',
  TranslationProfile.technical: 'technical',
  TranslationProfile.children: 'children',
  TranslationProfile.poetry: 'poetry',
  TranslationProfile.novel: 'novel',
  TranslationProfile.manga: 'manga',
  TranslationProfile.custom: 'custom',
};

const _$TranslationStatusEnumMap = {
  TranslationStatus.pending: 'pending',
  TranslationStatus.inProgress: 'inProgress',
  TranslationStatus.paused: 'paused',
  TranslationStatus.completed: 'completed',
  TranslationStatus.failed: 'failed',
  TranslationStatus.cancelled: 'cancelled',
};

_$TranslatedChunkImpl _$$TranslatedChunkImplFromJson(
  Map<String, dynamic> json,
) => _$TranslatedChunkImpl(
  id: json['id'] as String,
  index: (json['index'] as num).toInt(),
  originalText: json['originalText'] as String,
  translatedText: json['translatedText'] as String? ?? '',
  isComplete: json['isComplete'] as bool? ?? false,
  isReviewed: json['isReviewed'] as bool? ?? false,
  errorMessage: json['errorMessage'] as String?,
);

Map<String, dynamic> _$$TranslatedChunkImplToJson(
  _$TranslatedChunkImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'index': instance.index,
  'originalText': instance.originalText,
  'translatedText': instance.translatedText,
  'isComplete': instance.isComplete,
  'isReviewed': instance.isReviewed,
  'errorMessage': instance.errorMessage,
};

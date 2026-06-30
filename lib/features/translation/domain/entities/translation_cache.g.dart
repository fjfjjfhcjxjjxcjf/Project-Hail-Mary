// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation_cache.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CacheEntryImpl _$$CacheEntryImplFromJson(Map<String, dynamic> json) =>
    _$CacheEntryImpl(
      id: json['id'] as String,
      sourceHash: json['sourceHash'] as String,
      sourceText: json['sourceText'] as String,
      translatedText: json['translatedText'] as String,
      sourceLanguage: json['sourceLanguage'] as String,
      targetLanguage: json['targetLanguage'] as String,
      profileId: json['profileId'] as String? ?? '',
      providerId: json['providerId'] as String? ?? '',
      modelId: json['modelId'] as String? ?? '',
      hitCount: (json['hitCount'] as num?)?.toInt() ?? 0,
      qualityScore: (json['qualityScore'] as num?)?.toDouble() ?? 0.0,
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastUsedAt: json['lastUsedAt'] == null
          ? null
          : DateTime.parse(json['lastUsedAt'] as String),
    );

Map<String, dynamic> _$$CacheEntryImplToJson(_$CacheEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sourceHash': instance.sourceHash,
      'sourceText': instance.sourceText,
      'translatedText': instance.translatedText,
      'sourceLanguage': instance.sourceLanguage,
      'targetLanguage': instance.targetLanguage,
      'profileId': instance.profileId,
      'providerId': instance.providerId,
      'modelId': instance.modelId,
      'hitCount': instance.hitCount,
      'qualityScore': instance.qualityScore,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastUsedAt': instance.lastUsedAt?.toIso8601String(),
    };

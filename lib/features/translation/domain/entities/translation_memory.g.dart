// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation_memory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TranslationMemoryEntryImpl _$$TranslationMemoryEntryImplFromJson(
  Map<String, dynamic> json,
) => _$TranslationMemoryEntryImpl(
  id: json['id'] as String,
  sourceText: json['sourceText'] as String,
  translatedText: json['translatedText'] as String,
  sourceLanguage: json['sourceLanguage'] as String,
  targetLanguage: json['targetLanguage'] as String,
  profileId: json['profileId'] as String? ?? '',
  providerId: json['providerId'] as String? ?? '',
  scope:
      $enumDecodeNullable(_$MemoryScopeEnumMap, json['scope']) ??
      MemoryScope.project,
  projectId: json['projectId'] as String? ?? '',
  seriesId: json['seriesId'] as String? ?? '',
  hitCount: (json['hitCount'] as num?)?.toInt() ?? 0,
  qualityScore: (json['qualityScore'] as num?)?.toDouble() ?? 0.0,
  createdAt: DateTime.parse(json['createdAt'] as String),
  lastUsedAt: json['lastUsedAt'] == null
      ? null
      : DateTime.parse(json['lastUsedAt'] as String),
  metadata:
      (json['metadata'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ) ??
      const {},
);

Map<String, dynamic> _$$TranslationMemoryEntryImplToJson(
  _$TranslationMemoryEntryImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'sourceText': instance.sourceText,
  'translatedText': instance.translatedText,
  'sourceLanguage': instance.sourceLanguage,
  'targetLanguage': instance.targetLanguage,
  'profileId': instance.profileId,
  'providerId': instance.providerId,
  'scope': _$MemoryScopeEnumMap[instance.scope]!,
  'projectId': instance.projectId,
  'seriesId': instance.seriesId,
  'hitCount': instance.hitCount,
  'qualityScore': instance.qualityScore,
  'createdAt': instance.createdAt.toIso8601String(),
  'lastUsedAt': instance.lastUsedAt?.toIso8601String(),
  'metadata': instance.metadata,
};

const _$MemoryScopeEnumMap = {
  MemoryScope.project: 'project',
  MemoryScope.series: 'series',
  MemoryScope.universe: 'universe',
  MemoryScope.global: 'global',
};

_$TranslationMemoryImpl _$$TranslationMemoryImplFromJson(
  Map<String, dynamic> json,
) => _$TranslationMemoryImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  scope:
      $enumDecodeNullable(_$MemoryScopeEnumMap, json['scope']) ??
      MemoryScope.project,
  projectId: json['projectId'] as String? ?? '',
  seriesId: json['seriesId'] as String? ?? '',
  entries:
      (json['entries'] as List<dynamic>?)
          ?.map(
            (e) => TranslationMemoryEntry.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$TranslationMemoryImplToJson(
  _$TranslationMemoryImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'scope': _$MemoryScopeEnumMap[instance.scope]!,
  'projectId': instance.projectId,
  'seriesId': instance.seriesId,
  'entries': instance.entries,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TranslationProjectImpl _$$TranslationProjectImplFromJson(
  Map<String, dynamic> json,
) => _$TranslationProjectImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String? ?? '',
  sourceLanguage: json['sourceLanguage'] as String,
  targetLanguage: json['targetLanguage'] as String,
  profileId: json['profileId'] as String? ?? 'balanced',
  status:
      $enumDecodeNullable(_$ProjectStatusEnumMap, json['status']) ??
      ProjectStatus.active,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  documentIds:
      (json['documentIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  glossaryIds:
      (json['glossaryIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  defaultProviderId: json['defaultProviderId'] as String? ?? '',
  knownEntities:
      (json['knownEntities'] as List<dynamic>?)
          ?.map((e) => KnownEntity.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  translationMemoryIds:
      (json['translationMemoryIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  stylePreferences:
      (json['stylePreferences'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ) ??
      const {},
  metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
);

Map<String, dynamic> _$$TranslationProjectImplToJson(
  _$TranslationProjectImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'sourceLanguage': instance.sourceLanguage,
  'targetLanguage': instance.targetLanguage,
  'profileId': instance.profileId,
  'status': _$ProjectStatusEnumMap[instance.status]!,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'documentIds': instance.documentIds,
  'glossaryIds': instance.glossaryIds,
  'defaultProviderId': instance.defaultProviderId,
  'knownEntities': instance.knownEntities,
  'translationMemoryIds': instance.translationMemoryIds,
  'stylePreferences': instance.stylePreferences,
  'metadata': instance.metadata,
};

const _$ProjectStatusEnumMap = {
  ProjectStatus.active: 'active',
  ProjectStatus.archived: 'archived',
  ProjectStatus.translating: 'translating',
  ProjectStatus.paused: 'paused',
};

_$KnownEntityImpl _$$KnownEntityImplFromJson(Map<String, dynamic> json) =>
    _$KnownEntityImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$EntityTypeEnumMap, json['type']),
      translatedName: json['translatedName'] as String? ?? '',
      description: json['description'] as String? ?? '',
      translationPolicy: json['translationPolicy'] as String? ?? 'always',
      occurrenceCount: (json['occurrenceCount'] as num?)?.toInt() ?? 0,
      aliases:
          (json['aliases'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$KnownEntityImplToJson(_$KnownEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$EntityTypeEnumMap[instance.type]!,
      'translatedName': instance.translatedName,
      'description': instance.description,
      'translationPolicy': instance.translationPolicy,
      'occurrenceCount': instance.occurrenceCount,
      'aliases': instance.aliases,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$EntityTypeEnumMap = {
  EntityType.character: 'character',
  EntityType.place: 'place',
  EntityType.organization: 'organization',
  EntityType.skill: 'skill',
  EntityType.item: 'item',
  EntityType.magicSystem: 'magicSystem',
  EntityType.terminology: 'terminology',
  EntityType.other: 'other',
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plugin_manifest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PluginManifestImpl _$$PluginManifestImplFromJson(Map<String, dynamic> json) =>
    _$PluginManifestImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      version: json['version'] as String,
      type: $enumDecode(_$PluginTypeEnumMap, json['type']),
      description: json['description'] as String? ?? '',
      author: json['author'] as String? ?? '',
      status:
          $enumDecodeNullable(_$PluginStatusEnumMap, json['status']) ??
          PluginStatus.installed,
      supportedFormats:
          (json['supportedFormats'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      config: json['config'] as Map<String, dynamic>? ?? const {},
      configSchema:
          (json['configSchema'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
      installedAt: DateTime.parse(json['installedAt'] as String),
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$PluginManifestImplToJson(
  _$PluginManifestImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'version': instance.version,
  'type': _$PluginTypeEnumMap[instance.type]!,
  'description': instance.description,
  'author': instance.author,
  'status': _$PluginStatusEnumMap[instance.status]!,
  'supportedFormats': instance.supportedFormats,
  'config': instance.config,
  'configSchema': instance.configSchema,
  'installedAt': instance.installedAt.toIso8601String(),
  'lastUpdated': instance.lastUpdated?.toIso8601String(),
};

const _$PluginTypeEnumMap = {
  PluginType.aiProvider: 'aiProvider',
  PluginType.ocr: 'ocr',
  PluginType.translationEngine: 'translationEngine',
  PluginType.parser: 'parser',
  PluginType.exporter: 'exporter',
  PluginType.imageProcessor: 'imageProcessor',
};

const _$PluginStatusEnumMap = {
  PluginStatus.installed: 'installed',
  PluginStatus.active: 'active',
  PluginStatus.disabled: 'disabled',
  PluginStatus.error: 'error',
};

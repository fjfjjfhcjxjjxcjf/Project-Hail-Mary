// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prompt_template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PromptTemplateImpl _$$PromptTemplateImplFromJson(Map<String, dynamic> json) =>
    _$PromptTemplateImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      systemPrompt: json['systemPrompt'] as String,
      userPromptTemplate: json['userPromptTemplate'] as String? ?? '',
      profileId: json['profileId'] as String? ?? 'balanced',
      isBuiltIn: json['isBuiltIn'] as bool? ?? false,
      temperature: (json['temperature'] as num?)?.toDouble() ?? 0.3,
      category: json['category'] as String? ?? '',
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$PromptTemplateImplToJson(
  _$PromptTemplateImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'systemPrompt': instance.systemPrompt,
  'userPromptTemplate': instance.userPromptTemplate,
  'profileId': instance.profileId,
  'isBuiltIn': instance.isBuiltIn,
  'temperature': instance.temperature,
  'category': instance.category,
  'tags': instance.tags,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};

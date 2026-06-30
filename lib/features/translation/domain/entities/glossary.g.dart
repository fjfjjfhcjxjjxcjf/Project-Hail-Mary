// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'glossary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GlossaryEntryImpl _$$GlossaryEntryImplFromJson(Map<String, dynamic> json) =>
    _$GlossaryEntryImpl(
      id: json['id'] as String,
      sourceTerm: json['sourceTerm'] as String,
      targetTerm: json['targetTerm'] as String,
      context: json['context'] as String? ?? '',
      notes: json['notes'] as String? ?? '',
      caseSensitive: json['caseSensitive'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$GlossaryEntryImplToJson(_$GlossaryEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sourceTerm': instance.sourceTerm,
      'targetTerm': instance.targetTerm,
      'context': instance.context,
      'notes': instance.notes,
      'caseSensitive': instance.caseSensitive,
      'createdAt': instance.createdAt.toIso8601String(),
    };

_$GlossaryImpl _$$GlossaryImplFromJson(Map<String, dynamic> json) =>
    _$GlossaryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      sourceLanguage: json['sourceLanguage'] as String,
      targetLanguage: json['targetLanguage'] as String,
      entries:
          (json['entries'] as List<dynamic>?)
              ?.map((e) => GlossaryEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$GlossaryImplToJson(_$GlossaryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sourceLanguage': instance.sourceLanguage,
      'targetLanguage': instance.targetLanguage,
      'entries': instance.entries,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

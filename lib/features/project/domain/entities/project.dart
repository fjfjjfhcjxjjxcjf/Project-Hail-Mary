import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

enum ProjectStatus { active, archived, translating, paused }

@freezed
class TranslationProject with _$TranslationProject {
  const factory TranslationProject({
    required String id,
    required String name,
    @Default('') String description,
    required String sourceLanguage,
    required String targetLanguage,
    @Default('balanced') String profileId,
    @Default(ProjectStatus.active) ProjectStatus status,
    required DateTime createdAt,
    DateTime? updatedAt,
    @Default([]) List<String> documentIds,
    @Default([]) List<String> glossaryIds,
    @Default('') String defaultProviderId,
    // Memory fields
    @Default([]) List<KnownEntity> knownEntities,
    @Default([]) List<String> translationMemoryIds,
    @Default({}) Map<String, String> stylePreferences,
    @Default({}) Map<String, dynamic> metadata,
  }) = _TranslationProject;

  factory TranslationProject.fromJson(Map<String, dynamic> json) => _$TranslationProjectFromJson(json);
}

enum EntityType { character, place, organization, skill, item, magicSystem, terminology, other }

@freezed
class KnownEntity with _$KnownEntity {
  const factory KnownEntity({
    required String id,
    required String name,
    required EntityType type,
    @Default('') String translatedName,
    @Default('') String description,
    @Default('always') String translationPolicy, // always, never, custom
    @Default(0) int occurrenceCount,
    @Default([]) List<String> aliases,
    required DateTime createdAt,
  }) = _KnownEntity;

  factory KnownEntity.fromJson(Map<String, dynamic> json) => _$KnownEntityFromJson(json);
}

import 'package:uuid/uuid.dart';
import '../../../project/domain/entities/project.dart';
import '../entities/translation_memory.dart';
import '../entities/glossary.dart';
import '../../../../core/storage/local_storage_service.dart';

const _uuid = Uuid();

/// Character Consistency Engine - ensures names/terms stay consistent.
class ConsistencyEngine {
  final LocalStorageService _storage;

  ConsistencyEngine(this._storage);

  /// Extract entity names from known entities for prompt injection.
  Map<String, String> buildEntityNameMap(TranslationProject project) {
    final map = <String, String>{};
    for (final entity in project.knownEntities) {
      if (entity.translatedName.isNotEmpty && entity.translationPolicy != 'never') {
        map[entity.name] = entity.translatedName;
        for (final alias in entity.aliases) {
          map[alias] = entity.translatedName;
        }
      }
    }
    return map;
  }

  /// Merge newly extracted entities into a project's known entities.
  List<KnownEntity> mergeEntities(
    List<KnownEntity> existing,
    List<ExtractedEntityInput> extracted,
  ) {
    final merged = List<KnownEntity>.from(existing);
    final existingNames = existing.map((e) => e.name.toLowerCase()).toSet();

    for (final ext in extracted) {
      if (!existingNames.contains(ext.name.toLowerCase())) {
        merged.add(KnownEntity(
          id: _uuid.v4(),
          name: ext.name,
          type: _parseEntityType(ext.type),
          translatedName: '',
          description: ext.context,
          occurrenceCount: ext.occurrences,
          aliases: ext.aliases,
          createdAt: DateTime.now(),
        ));
      } else {
        // Update occurrence count
        final idx = merged.indexWhere(
          (e) => e.name.toLowerCase() == ext.name.toLowerCase(),
        );
        if (idx >= 0) {
          merged[idx] = merged[idx].copyWith(
            occurrenceCount: merged[idx].occurrenceCount + ext.occurrences,
          );
        }
      }
    }

    // Sort by occurrence count descending
    merged.sort((a, b) => b.occurrenceCount.compareTo(a.occurrenceCount));
    return merged;
  }

  /// Look up a translation in memory for a given source text.
  TranslationMemoryEntry? lookupMemory({
    required String sourceText,
    required String sourceLanguage,
    required String targetLanguage,
    required String projectId,
  }) {
    final memories = _storage.getTranslationMemories();
    for (final memory in memories) {
      for (final entry in memory.entries) {
        if (entry.sourceLanguage == sourceLanguage &&
            entry.targetLanguage == targetLanguage &&
            entry.sourceText == sourceText) {
          return entry;
        }
      }
    }
    return null;
  }

  /// Save a translation to memory.
  Future<void> saveToMemory({
    required String sourceText,
    required String translatedText,
    required String sourceLanguage,
    required String targetLanguage,
    required String projectId,
    String profileId = '',
    String providerId = '',
    double qualityScore = 0.0,
    MemoryScope scope = MemoryScope.project,
  }) async {
    final entry = TranslationMemoryEntry(
      id: _uuid.v4(),
      sourceText: sourceText,
      translatedText: translatedText,
      sourceLanguage: sourceLanguage,
      targetLanguage: targetLanguage,
      profileId: profileId,
      providerId: providerId,
      scope: scope,
      projectId: projectId,
      qualityScore: qualityScore,
      createdAt: DateTime.now(),
      lastUsedAt: DateTime.now(),
    );

    // Find or create memory for this project
    final memories = _storage.getTranslationMemories();
    TranslationMemory? targetMemory;
    for (final m in memories) {
      if (m.projectId == projectId) {
        targetMemory = m;
        break;
      }
    }

    if (targetMemory != null) {
      final updated = targetMemory.copyWith(
        entries: [...targetMemory.entries, entry],
        updatedAt: DateTime.now(),
      );
      await _storage.saveTranslationMemory(updated);
    } else {
      final newMemory = TranslationMemory(
        id: _uuid.v4(),
        name: 'Project Memory',
        scope: scope,
        projectId: projectId,
        entries: [entry],
        createdAt: DateTime.now(),
      );
      await _storage.saveTranslationMemory(newMemory);
    }
  }

  EntityType _parseEntityType(String type) {
    switch (type.toLowerCase()) {
      case 'character': return EntityType.character;
      case 'place': return EntityType.place;
      case 'organization': return EntityType.organization;
      case 'skill': return EntityType.skill;
      case 'item': return EntityType.item;
      case 'magic_system': return EntityType.magicSystem;
      case 'terminology': return EntityType.terminology;
      default: return EntityType.other;
    }
  }
}

class ExtractedEntityInput {
  final String name;
  final String type;
  final int occurrences;
  final List<String> aliases;
  final String context;

  const ExtractedEntityInput({
    required this.name,
    this.type = 'other',
    this.occurrences = 0,
    this.aliases = const [],
    this.context = '',
  });
}

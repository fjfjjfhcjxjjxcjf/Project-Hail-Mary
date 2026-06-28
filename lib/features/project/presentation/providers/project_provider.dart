import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/storage/local_storage_service.dart';
import '../../../../core/providers/storage_provider.dart';
import '../../domain/entities/project.dart';

const _uuid = Uuid();

class ProjectsNotifier extends StateNotifier<List<TranslationProject>> {
  final LocalStorageService _storage;

  ProjectsNotifier(this._storage) : super([]) {
    state = _storage.getProjects();
  }

  Future<TranslationProject> create({
    required String name,
    required String sourceLanguage,
    required String targetLanguage,
    String description = '',
    String profileId = 'balanced',
  }) async {
    final project = TranslationProject(
      id: _uuid.v4(),
      name: name,
      description: description,
      sourceLanguage: sourceLanguage,
      targetLanguage: targetLanguage,
      profileId: profileId,
      createdAt: DateTime.now(),
    );
    state = [...state, project];
    await _storage.saveProject(project);
    return project;
  }

  Future<void> update(TranslationProject project) async {
    final updated = project.copyWith(updatedAt: DateTime.now());
    state = [for (final p in state) if (p.id == updated.id) updated else p];
    await _storage.saveProject(updated);
  }

  Future<void> remove(String id) async {
    state = state.where((p) => p.id != id).toList();
    await _storage.deleteProject(id);
  }

  Future<void> addEntity(String projectId, KnownEntity entity) async {
    final project = state.firstWhere((p) => p.id == projectId);
    final newEntity = entity.id.isEmpty ? entity.copyWith(id: _uuid.v4()) : entity;
    final updated = project.copyWith(
      knownEntities: [...project.knownEntities, newEntity],
      updatedAt: DateTime.now(),
    );
    await update(updated);
  }

  Future<void> updateEntity(String projectId, KnownEntity entity) async {
    final project = state.firstWhere((p) => p.id == projectId);
    final updated = project.copyWith(
      knownEntities: [
        for (final e in project.knownEntities)
          if (e.id == entity.id) entity else e,
      ],
      updatedAt: DateTime.now(),
    );
    await update(updated);
  }

  Future<void> removeEntity(String projectId, String entityId) async {
    final project = state.firstWhere((p) => p.id == projectId);
    final updated = project.copyWith(
      knownEntities: project.knownEntities.where((e) => e.id != entityId).toList(),
      updatedAt: DateTime.now(),
    );
    await update(updated);
  }

  Future<void> addDocument(String projectId, String documentId) async {
    final project = state.firstWhere((p) => p.id == projectId);
    if (!project.documentIds.contains(documentId)) {
      final updated = project.copyWith(
        documentIds: [...project.documentIds, documentId],
        updatedAt: DateTime.now(),
      );
      await update(updated);
    }
  }

  TranslationProject? getById(String id) {
    try {
      return state.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }
}

final projectsProvider =
    StateNotifierProvider<ProjectsNotifier, List<TranslationProject>>((ref) {
  final storage = ref.watch(localStorageServiceProvider);
  return ProjectsNotifier(storage);
});

final activeProjectProvider = StateProvider<TranslationProject?>((ref) => null);

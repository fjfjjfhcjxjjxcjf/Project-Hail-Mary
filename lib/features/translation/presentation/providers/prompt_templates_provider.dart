import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/storage/local_storage_service.dart';
import '../../../../core/providers/storage_provider.dart';
import '../../domain/entities/prompt_template.dart';

const _uuid = Uuid();

class PromptTemplatesNotifier extends StateNotifier<List<PromptTemplate>> {
  final LocalStorageService _storage;

  PromptTemplatesNotifier(this._storage) : super([]) {
    state = _storage.getPromptTemplates();
    if (state.isEmpty) {
      _seedDefaults();
    }
  }

  void _seedDefaults() {
    final defaults = [
      const PromptTemplate(
        id: 'default-novel',
        name: 'Novel Translation',
        description: 'Standard novel translation prompt',
        systemPrompt: 'You are a professional literary translator. Translate the following text maintaining character voices, narrative flow, and literary quality.',
        profileId: 'novel',
        isBuiltIn: true,
        category: 'Literature',
      ),
      const PromptTemplate(
        id: 'default-technical',
        name: 'Technical Documentation',
        description: 'Technical docs with code preservation',
        systemPrompt: 'You are a technical translator. Preserve all code blocks, URLs, and technical terms. Translate explanatory text naturally.',
        profileId: 'technical',
        isBuiltIn: true,
        category: 'Technical',
      ),
      const PromptTemplate(
        id: 'default-academic',
        name: 'Academic Paper',
        description: 'Academic/scientific paper translation',
        systemPrompt: 'You are an academic translator. Maintain precise terminology, formal register, and citation format.',
        profileId: 'academic',
        isBuiltIn: true,
        category: 'Academic',
      ),
    ];
    state = defaults;
    for (final t in defaults) {
      _storage.savePromptTemplate(t);
    }
  }

  Future<void> add(PromptTemplate template) async {
    final newTemplate = template.id.isEmpty
        ? template.copyWith(id: _uuid.v4())
        : template;
    state = [...state, newTemplate];
    await _storage.savePromptTemplate(newTemplate);
  }

  Future<void> update(PromptTemplate template) async {
    state = [for (final t in state) if (t.id == template.id) template else t];
    await _storage.savePromptTemplate(template);
  }

  Future<void> remove(String id) async {
    final template = state.firstWhere((t) => t.id == id);
    if (template.isBuiltIn) return; // Don't delete built-in templates
    state = state.where((t) => t.id != id).toList();
    await _storage.deletePromptTemplate(id);
  }

  List<PromptTemplate> getByCategory(String category) {
    return state.where((t) => t.category == category).toList();
  }
}

final promptTemplatesProvider =
    StateNotifierProvider<PromptTemplatesNotifier, List<PromptTemplate>>((ref) {
  final storage = ref.watch(localStorageServiceProvider);
  return PromptTemplatesNotifier(storage);
});

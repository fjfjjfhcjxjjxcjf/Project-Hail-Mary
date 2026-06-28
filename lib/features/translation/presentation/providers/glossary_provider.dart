import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/storage/local_storage_service.dart';
import '../../../../core/providers/storage_provider.dart';
import '../../domain/entities/glossary.dart';

const _uuid = Uuid();

class GlossariesNotifier extends StateNotifier<List<Glossary>> {
  final LocalStorageService _storage;

  GlossariesNotifier(this._storage) : super([]) {
    state = _storage.getGlossaries();
  }

  Future<void> add(Glossary glossary) async {
    final newGlossary = glossary.id.isEmpty
        ? glossary.copyWith(id: _uuid.v4())
        : glossary;
    state = [...state, newGlossary];
    await _storage.saveGlossary(newGlossary);
  }

  Future<void> update(Glossary glossary) async {
    state = [for (final g in state) if (g.id == glossary.id) glossary else g];
    await _storage.saveGlossary(glossary);
  }

  Future<void> remove(String id) async {
    state = state.where((g) => g.id != id).toList();
    await _storage.deleteGlossary(id);
  }

  Future<void> addEntry(String glossaryId, GlossaryEntry entry) async {
    final glossary = state.firstWhere((g) => g.id == glossaryId);
    final newEntry = entry.id.isEmpty ? entry.copyWith(id: _uuid.v4()) : entry;
    final updated = glossary.copyWith(
      entries: [...glossary.entries, newEntry],
      updatedAt: DateTime.now(),
    );
    await update(updated);
  }

  Future<void> removeEntry(String glossaryId, String entryId) async {
    final glossary = state.firstWhere((g) => g.id == glossaryId);
    final updated = glossary.copyWith(
      entries: glossary.entries.where((e) => e.id != entryId).toList(),
      updatedAt: DateTime.now(),
    );
    await update(updated);
  }

  Glossary? getById(String id) {
    try {
      return state.firstWhere((g) => g.id == id);
    } catch (_) {
      return null;
    }
  }
}

final glossariesProvider =
    StateNotifierProvider<GlossariesNotifier, List<Glossary>>((ref) {
  final storage = ref.watch(localStorageServiceProvider);
  return GlossariesNotifier(storage);
});

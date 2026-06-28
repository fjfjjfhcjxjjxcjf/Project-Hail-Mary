import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../storage/local_storage_service.dart';
import '../providers/storage_provider.dart';
import 'plugin_manifest.dart';

const _uuid = Uuid();

/// Plugin Manager - manages extensible plugins for the app.
class PluginManager {
  final LocalStorageService _storage;

  PluginManager(this._storage);

  List<PluginManifest> getAll() => _storage.getPlugins();

  List<PluginManifest> getByType(PluginType type) {
    return _storage.getPlugins().where((p) => p.type == type).toList();
  }

  List<PluginManifest> getActive() {
    return _storage.getPlugins().where((p) => p.status == PluginStatus.active).toList();
  }

  Future<void> install(PluginManifest plugin) async {
    final newPlugin = plugin.copyWith(
      id: plugin.id.isEmpty ? _uuid.v4() : plugin.id,
      status: PluginStatus.installed,
      installedAt: DateTime.now(),
    );
    await _storage.savePlugin(newPlugin);
  }

  Future<void> activate(String id) async {
    final plugin = _storage.getPlugins().firstWhere((p) => p.id == id);
    await _storage.savePlugin(plugin.copyWith(status: PluginStatus.active));
  }

  Future<void> deactivate(String id) async {
    final plugin = _storage.getPlugins().firstWhere((p) => p.id == id);
    await _storage.savePlugin(plugin.copyWith(status: PluginStatus.disabled));
  }

  Future<void> uninstall(String id) async {
    await _storage.deletePlugin(id);
  }

  Future<void> updateConfig(String id, Map<String, dynamic> config) async {
    final plugin = _storage.getPlugins().firstWhere((p) => p.id == id);
    await _storage.savePlugin(plugin.copyWith(config: config));
  }
}

final pluginManagerProvider = Provider<PluginManager>((ref) {
  final storage = ref.watch(localStorageServiceProvider);
  return PluginManager(storage);
});

final pluginsProvider = Provider<List<PluginManifest>>((ref) {
  final manager = ref.watch(pluginManagerProvider);
  return manager.getAll();
});

import 'package:hive_flutter/hive_flutter.dart';
import '../../features/translation/domain/entities/ai_provider.dart';
import '../../features/translation/domain/entities/translation_job.dart';
import '../../features/translation/domain/entities/glossary.dart';
import '../../features/translation/domain/entities/translation_memory.dart';
import '../../features/translation/domain/entities/prompt_template.dart';
import '../../features/settings/domain/entities/app_settings.dart';
import '../../features/document_picker/domain/entities/document.dart';
import '../../features/project/domain/entities/project.dart';
import '../plugins/plugin_manifest.dart';

class LocalStorageService {
  static const _providersBox = 'providers';
  static const _settingsBox = 'settings';
  static const _glossariesBox = 'glossaries';
  static const _jobsBox = 'jobs';
  static const _documentsBox = 'documents';
  static const _projectsBox = 'projects';
  static const _memoriesBox = 'memories';
  static const _promptsBox = 'prompts';
  static const _pluginsBox = 'plugins';

  late Box<Map> _providers;
  late Box<String> _settings;
  late Box<Map> _glossaries;
  late Box<Map> _jobs;
  late Box<Map> _documents;
  late Box<Map> _projects;
  late Box<Map> _memories;
  late Box<Map> _prompts;
  late Box<Map> _plugins;

  Future<void> init() async {
    _providers = await Hive.openBox<Map>(_providersBox);
    _settings = await Hive.openBox<String>(_settingsBox);
    _glossaries = await Hive.openBox<Map>(_glossariesBox);
    _jobs = await Hive.openBox<Map>(_jobsBox);
    _documents = await Hive.openBox<Map>(_documentsBox);
    _projects = await Hive.openBox<Map>(_projectsBox);
    _memories = await Hive.openBox<Map>(_memoriesBox);
    _prompts = await Hive.openBox<Map>(_promptsBox);
    _plugins = await Hive.openBox<Map>(_pluginsBox);
  }

  // ── AI Providers ──────────────────────────────────────────────

  List<AiProvider> getProviders() {
    return _providers.values
        .map((json) => AiProvider.fromJson(Map<String, dynamic>.from(json)))
        .toList();
  }

  AiProvider? getProvider(String id) {
    final json = _providers.get(id);
    if (json == null) return null;
    return AiProvider.fromJson(Map<String, dynamic>.from(json));
  }

  Future<void> saveProvider(AiProvider provider) async {
    await _providers.put(provider.id, provider.toJson());
  }

  Future<void> deleteProvider(String id) async {
    await _providers.delete(id);
  }

  // ── Settings ──────────────────────────────────────────────────

  AppSettings getSettings() {
    final Map<String, dynamic> data = {};
    for (final key in _settings.keys) {
      final raw = _settings.get(key);
      data[key.toString()] = _coerceSettingValue(key.toString(), raw);
    }
    if (data.isEmpty) return const AppSettings();
    return AppSettings.fromJson(data);
  }

  /// Coerce string values stored in Hive back to their proper JSON types.
  /// Hive Box<String> stores everything as String, but fromJson expects
  /// int, double, bool, List, etc. This prevents the
  /// "type 'String' is not a subtype of type 'num?'" crash on restart.
  static dynamic _coerceSettingValue(String key, String? value) {
    if (value == null) return null;

    // Known int fields
    const intKeys = {'chunkSize'};
    // Known double fields
    const doubleKeys = {'temperature'};
    // Known bool fields
    const boolKeys = {'offlineMode', 'autoSave', 'backgroundTranslation', 'notifications'};
    // Known list fields
    const listKeys = {'providerPriority'};

    if (intKeys.contains(key)) {
      return int.tryParse(value) ?? 0;
    }
    if (doubleKeys.contains(key)) {
      return double.tryParse(value) ?? 0.0;
    }
    if (boolKeys.contains(key)) {
      return value.toLowerCase() == 'true';
    }
    if (listKeys.contains(key)) {
      // Stored as "[a, b, c]" via toString() on List<String>
      if (value == '[]') return <String>[];
      final inner = value.substring(1, value.length - 1);
      if (inner.trim().isEmpty) return <String>[];
      return inner.split(',').map((e) => e.trim()).toList();
    }

    return value; // String fields pass through as-is
  }

  Future<void> saveSettings(AppSettings settings) async {
    final json = settings.toJson();
    for (final entry in json.entries) {
      await _settings.put(entry.key, entry.value.toString());
    }
  }

  String? getString(String key) => _settings.get(key);

  Future<void> setString(String key, String value) async {
    await _settings.put(key, value);
  }

  // ── Glossaries ────────────────────────────────────────────────

  List<Glossary> getGlossaries() {
    return _glossaries.values
        .map((json) => Glossary.fromJson(Map<String, dynamic>.from(json)))
        .toList();
  }

  Glossary? getGlossary(String id) {
    final json = _glossaries.get(id);
    if (json == null) return null;
    return Glossary.fromJson(Map<String, dynamic>.from(json));
  }

  Future<void> saveGlossary(Glossary glossary) async {
    await _glossaries.put(glossary.id, glossary.toJson());
  }

  Future<void> deleteGlossary(String id) async {
    await _glossaries.delete(id);
  }

  // ── Translation Jobs ──────────────────────────────────────────

  List<TranslationJob> getJobs() {
    return _jobs.values
        .map((json) => TranslationJob.fromJson(Map<String, dynamic>.from(json)))
        .toList();
  }

  TranslationJob? getJob(String id) {
    final json = _jobs.get(id);
    if (json == null) return null;
    return TranslationJob.fromJson(Map<String, dynamic>.from(json));
  }

  Future<void> saveJob(TranslationJob job) async {
    final json = job.toJson();
    // Explicitly serialize nested Freezed objects — toJson() may leave
    // them as raw instances that Hive cannot write.
    if (json['chunks'] is List) {
      json['chunks'] = (json['chunks'] as List).map((e) {
        if (e is TranslatedChunk) return e.toJson();
        return e;
      }).toList();
    }
    await _jobs.put(job.id, json);
  }

  Future<void> deleteJob(String id) async {
    await _jobs.delete(id);
  }

  // ── Documents ─────────────────────────────────────────────────

  List<Document> getDocuments() {
    return _documents.values
        .map((json) => Document.fromJson(Map<String, dynamic>.from(json)))
        .toList();
  }

  Document? getDocument(String id) {
    final json = _documents.get(id);
    if (json == null) return null;
    return Document.fromJson(Map<String, dynamic>.from(json));
  }

  Future<void> saveDocument(Document doc) async {
    await _documents.put(doc.id, doc.toJson());
  }

  Future<void> deleteDocument(String id) async {
    await _documents.delete(id);
  }

  // ── Projects ────────────────────────────────────────────────

  List<TranslationProject> getProjects() {
    return _projects.values
        .map((json) => TranslationProject.fromJson(Map<String, dynamic>.from(json)))
        .toList();
  }

  TranslationProject? getProject(String id) {
    final json = _projects.get(id);
    if (json == null) return null;
    return TranslationProject.fromJson(Map<String, dynamic>.from(json));
  }

  Future<void> saveProject(TranslationProject project) async {
    await _projects.put(project.id, project.toJson());
  }

  Future<void> deleteProject(String id) async {
    await _projects.delete(id);
  }

  // ── Translation Memories ────────────────────────────────────

  List<TranslationMemory> getTranslationMemories() {
    return _memories.values
        .map((json) => TranslationMemory.fromJson(Map<String, dynamic>.from(json)))
        .toList();
  }

  Future<void> saveTranslationMemory(TranslationMemory memory) async {
    await _memories.put(memory.id, memory.toJson());
  }

  Future<void> deleteTranslationMemory(String id) async {
    await _memories.delete(id);
  }

  // ── Prompt Templates ────────────────────────────────────────

  List<PromptTemplate> getPromptTemplates() {
    return _prompts.values
        .map((json) => PromptTemplate.fromJson(Map<String, dynamic>.from(json)))
        .toList();
  }

  Future<void> savePromptTemplate(PromptTemplate template) async {
    await _prompts.put(template.id, template.toJson());
  }

  Future<void> deletePromptTemplate(String id) async {
    await _prompts.delete(id);
  }

  // ── Plugins ─────────────────────────────────────────────────

  List<PluginManifest> getPlugins() {
    return _plugins.values
        .map((json) => PluginManifest.fromJson(Map<String, dynamic>.from(json)))
        .toList();
  }

  Future<void> savePlugin(PluginManifest plugin) async {
    await _plugins.put(plugin.id, plugin.toJson());
  }

  Future<void> deletePlugin(String id) async {
    await _plugins.delete(id);
  }

  // ── Utility ───────────────────────────────────────────────────

  Future<void> clearAll() async {
    await _providers.clear();
    await _settings.clear();
    await _glossaries.clear();
    await _jobs.clear();
    await _documents.clear();
    await _projects.clear();
    await _memories.clear();
    await _prompts.clear();
    await _plugins.clear();
  }
}

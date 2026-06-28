import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/storage/local_storage_service.dart';
import '../../../../core/providers/storage_provider.dart';
import '../../domain/entities/app_settings.dart';

class SettingsNotifier extends StateNotifier<AppSettings> {
  final LocalStorageService _storage;

  SettingsNotifier(this._storage) : super(_storage.getSettings());

  Future<void> updateTheme(AppThemeMode mode) async {
    state = state.copyWith(themeMode: mode);
    await _storage.saveSettings(state);
  }

  Future<void> updateLocale(String locale) async {
    state = state.copyWith(locale: locale);
    await _storage.saveSettings(state);
  }

  Future<void> updateTranslationProfile(String profile) async {
    state = state.copyWith(translationProfile: profile);
    await _storage.saveSettings(state);
  }

  Future<void> updateChunkSize(int size) async {
    state = state.copyWith(chunkSize: size);
    await _storage.saveSettings(state);
  }

  Future<void> updateTemperature(double temp) async {
    state = state.copyWith(temperature: temp);
    await _storage.saveSettings(state);
  }

  Future<void> updateProviderPriority(List<String> priority) async {
    state = state.copyWith(providerPriority: priority);
    await _storage.saveSettings(state);
  }

  Future<void> toggleAutoSave(bool value) async {
    state = state.copyWith(autoSave: value);
    await _storage.saveSettings(state);
  }

  Future<void> toggleNotifications(bool value) async {
    state = state.copyWith(notifications: value);
    await _storage.saveSettings(state);
  }

  Future<void> toggleBackgroundTranslation(bool value) async {
    state = state.copyWith(backgroundTranslation: value);
    await _storage.saveSettings(state);
  }

  Future<void> updateDefaultExportFormat(String format) async {
    state = state.copyWith(defaultExportFormat: format);
    await _storage.saveSettings(state);
  }

  Future<void> reset() async {
    const defaults = AppSettings();
    state = defaults;
    await _storage.saveSettings(defaults);
  }
}

final settingsProvider = StateNotifierProvider<SettingsNotifier, AppSettings>((ref) {
  final storage = ref.watch(localStorageServiceProvider);
  return SettingsNotifier(storage);
});

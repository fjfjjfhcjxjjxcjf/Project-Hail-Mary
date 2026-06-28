import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

enum AppThemeMode { system, light, dark }

@freezed
class AppSettings with _$AppSettings {
  const factory AppSettings({
    @Default(AppThemeMode.system) AppThemeMode themeMode,
    @Default('en') String locale,
    @Default('balanced') String translationProfile,
    @Default(2000) int chunkSize,
    @Default(0.3) double temperature,
    @Default([]) List<String> providerPriority,
    @Default(false) bool offlineMode,
    @Default(true) bool autoSave,
    @Default(true) bool backgroundTranslation,
    @Default(true) bool notifications,
    @Default('pdf') String defaultExportFormat,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) => _$AppSettingsFromJson(json);
}

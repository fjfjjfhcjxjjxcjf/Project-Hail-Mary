// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppSettingsImpl _$$AppSettingsImplFromJson(Map<String, dynamic> json) =>
    _$AppSettingsImpl(
      themeMode:
          $enumDecodeNullable(_$AppThemeModeEnumMap, json['themeMode']) ??
          AppThemeMode.system,
      locale: json['locale'] as String? ?? 'en',
      translationProfile: json['translationProfile'] as String? ?? 'balanced',
      chunkSize: (json['chunkSize'] as num?)?.toInt() ?? 2000,
      temperature: (json['temperature'] as num?)?.toDouble() ?? 0.3,
      providerPriority:
          (json['providerPriority'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      offlineMode: json['offlineMode'] as bool? ?? false,
      autoSave: json['autoSave'] as bool? ?? true,
      backgroundTranslation: json['backgroundTranslation'] as bool? ?? true,
      notifications: json['notifications'] as bool? ?? true,
      defaultExportFormat: json['defaultExportFormat'] as String? ?? 'pdf',
    );

Map<String, dynamic> _$$AppSettingsImplToJson(_$AppSettingsImpl instance) =>
    <String, dynamic>{
      'themeMode': _$AppThemeModeEnumMap[instance.themeMode]!,
      'locale': instance.locale,
      'translationProfile': instance.translationProfile,
      'chunkSize': instance.chunkSize,
      'temperature': instance.temperature,
      'providerPriority': instance.providerPriority,
      'offlineMode': instance.offlineMode,
      'autoSave': instance.autoSave,
      'backgroundTranslation': instance.backgroundTranslation,
      'notifications': instance.notifications,
      'defaultExportFormat': instance.defaultExportFormat,
    };

const _$AppThemeModeEnumMap = {
  AppThemeMode.system: 'system',
  AppThemeMode.light: 'light',
  AppThemeMode.dark: 'dark',
};

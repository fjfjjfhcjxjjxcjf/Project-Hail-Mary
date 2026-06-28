import 'package:freezed_annotation/freezed_annotation.dart';

part 'plugin_manifest.freezed.dart';
part 'plugin_manifest.g.dart';

enum PluginType { aiProvider, ocr, translationEngine, parser, exporter, imageProcessor }

enum PluginStatus { installed, active, disabled, error }

@freezed
class PluginManifest with _$PluginManifest {
  const factory PluginManifest({
    required String id,
    required String name,
    required String version,
    required PluginType type,
    @Default('') String description,
    @Default('') String author,
    @Default(PluginStatus.installed) PluginStatus status,
    @Default([]) List<String> supportedFormats,
    @Default({}) Map<String, dynamic> config,
    @Default({}) Map<String, String> configSchema,
    required DateTime installedAt,
    DateTime? lastUpdated,
  }) = _PluginManifest;

  factory PluginManifest.fromJson(Map<String, dynamic> json) => _$PluginManifestFromJson(json);
}

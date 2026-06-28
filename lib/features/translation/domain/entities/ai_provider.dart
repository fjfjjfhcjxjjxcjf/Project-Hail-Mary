import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_provider.freezed.dart';
part 'ai_provider.g.dart';

enum ProviderType {
  openai, gemini, openrouter, deepseek, claude,
  ollama, lmStudio, custom;
}

@freezed
class AiProvider with _$AiProvider {
  const factory AiProvider({
    required String id,
    required String name,
    required ProviderType type,
    required String baseUrl,
    @Default('') String apiKey,
    @Default([]) List<String> models,
    @Default('') String selectedModel,
    @Default(true) bool isActive,
    @Default(false) bool supportsStreaming,
    @Default(false) bool supportsVision,
    @Default(4096) int maxContextLength,
    Map<String, dynamic>? metadata,
  }) = _AiProvider;

  factory AiProvider.fromJson(Map<String, dynamic> json) => _$AiProviderFromJson(json);
}

@freezed
class AiModel with _$AiModel {
  const factory AiModel({
    required String id,
    required String name,
    required String providerId,
    @Default(4096) int contextWindow,
    @Default(false) bool supportsVision,
    @Default(false) bool supportsStreaming,
    double? inputCostPer1k,
    double? outputCostPer1k,
  }) = _AiModel;

  factory AiModel.fromJson(Map<String, dynamic> json) => _$AiModelFromJson(json);
}

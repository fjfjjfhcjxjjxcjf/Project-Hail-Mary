// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiProviderImpl _$$AiProviderImplFromJson(Map<String, dynamic> json) =>
    _$AiProviderImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$ProviderTypeEnumMap, json['type']),
      baseUrl: json['baseUrl'] as String,
      apiKey: json['apiKey'] as String? ?? '',
      models:
          (json['models'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      selectedModel: json['selectedModel'] as String? ?? '',
      isActive: json['isActive'] as bool? ?? true,
      supportsStreaming: json['supportsStreaming'] as bool? ?? false,
      supportsVision: json['supportsVision'] as bool? ?? false,
      maxContextLength: (json['maxContextLength'] as num?)?.toInt() ?? 4096,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$AiProviderImplToJson(_$AiProviderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$ProviderTypeEnumMap[instance.type]!,
      'baseUrl': instance.baseUrl,
      'apiKey': instance.apiKey,
      'models': instance.models,
      'selectedModel': instance.selectedModel,
      'isActive': instance.isActive,
      'supportsStreaming': instance.supportsStreaming,
      'supportsVision': instance.supportsVision,
      'maxContextLength': instance.maxContextLength,
      'metadata': instance.metadata,
    };

const _$ProviderTypeEnumMap = {
  ProviderType.openai: 'openai',
  ProviderType.gemini: 'gemini',
  ProviderType.openrouter: 'openrouter',
  ProviderType.deepseek: 'deepseek',
  ProviderType.claude: 'claude',
  ProviderType.ollama: 'ollama',
  ProviderType.lmStudio: 'lmStudio',
  ProviderType.custom: 'custom',
};

_$AiModelImpl _$$AiModelImplFromJson(Map<String, dynamic> json) =>
    _$AiModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      providerId: json['providerId'] as String,
      contextWindow: (json['contextWindow'] as num?)?.toInt() ?? 4096,
      supportsVision: json['supportsVision'] as bool? ?? false,
      supportsStreaming: json['supportsStreaming'] as bool? ?? false,
      inputCostPer1k: (json['inputCostPer1k'] as num?)?.toDouble(),
      outputCostPer1k: (json['outputCostPer1k'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$AiModelImplToJson(_$AiModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'providerId': instance.providerId,
      'contextWindow': instance.contextWindow,
      'supportsVision': instance.supportsVision,
      'supportsStreaming': instance.supportsStreaming,
      'inputCostPer1k': instance.inputCostPer1k,
      'outputCostPer1k': instance.outputCostPer1k,
    };

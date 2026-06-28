import 'package:freezed_annotation/freezed_annotation.dart';

part 'prompt_template.freezed.dart';
part 'prompt_template.g.dart';

@freezed
class PromptTemplate with _$PromptTemplate {
  const factory PromptTemplate({
    required String id,
    required String name,
    @Default('') String description,
    required String systemPrompt,
    @Default('') String userPromptTemplate,
    @Default('balanced') String profileId,
    @Default(false) bool isBuiltIn,
    @Default(0.3) double temperature,
    @Default('') String category,
    @Default([]) List<String> tags,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _PromptTemplate;

  factory PromptTemplate.fromJson(Map<String, dynamic> json) => _$PromptTemplateFromJson(json);
}

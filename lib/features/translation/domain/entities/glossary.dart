import 'package:freezed_annotation/freezed_annotation.dart';

part 'glossary.freezed.dart';
part 'glossary.g.dart';

@freezed
class GlossaryEntry with _$GlossaryEntry {
  const factory GlossaryEntry({
    required String id,
    required String sourceTerm,
    required String targetTerm,
    @Default('') String context,
    @Default('') String notes,
    @Default(false) bool caseSensitive,
    required DateTime createdAt,
  }) = _GlossaryEntry;

  factory GlossaryEntry.fromJson(Map<String, dynamic> json) => _$GlossaryEntryFromJson(json);
}

@freezed
class Glossary with _$Glossary {
  const factory Glossary({
    required String id,
    required String name,
    required String sourceLanguage,
    required String targetLanguage,
    @Default([]) List<GlossaryEntry> entries,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _Glossary;

  factory Glossary.fromJson(Map<String, dynamic> json) => _$GlossaryFromJson(json);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_analysis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookAnalysisImpl _$$BookAnalysisImplFromJson(Map<String, dynamic> json) =>
    _$BookAnalysisImpl(
      id: json['id'] as String,
      documentId: json['documentId'] as String,
      status:
          $enumDecodeNullable(_$AnalysisStatusEnumMap, json['status']) ??
          AnalysisStatus.pending,
      totalChapters: (json['totalChapters'] as num?)?.toInt() ?? 0,
      totalWords: (json['totalWords'] as num?)?.toInt() ?? 0,
      totalCharacters: (json['totalCharacters'] as num?)?.toInt() ?? 0,
      totalParagraphs: (json['totalParagraphs'] as num?)?.toInt() ?? 0,
      detectedLanguage: json['detectedLanguage'] as String? ?? '',
      imageCount: (json['imageCount'] as num?)?.toInt() ?? 0,
      ocrPageCount: (json['ocrPageCount'] as num?)?.toInt() ?? 0,
      extractedEntities:
          (json['extractedEntities'] as List<dynamic>?)
              ?.map((e) => ExtractedEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      extractedTerms:
          (json['extractedTerms'] as List<dynamic>?)
              ?.map((e) => ExtractedTerm.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      chapterSummaries:
          (json['chapterSummaries'] as List<dynamic>?)
              ?.map((e) => ChapterSummary.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      estimatedCostUsd: (json['estimatedCostUsd'] as num?)?.toDouble() ?? 0.0,
      estimatedTokens: (json['estimatedTokens'] as num?)?.toInt() ?? 0,
      estimatedMinutes: (json['estimatedMinutes'] as num?)?.toInt() ?? 0,
      tableCount: (json['tableCount'] as num?)?.toInt() ?? 0,
      codeBlockCount: (json['codeBlockCount'] as num?)?.toInt() ?? 0,
      detectedFormats:
          (json['detectedFormats'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      summary: json['summary'] as String? ?? '',
      createdAt: DateTime.parse(json['createdAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$$BookAnalysisImplToJson(_$BookAnalysisImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'documentId': instance.documentId,
      'status': _$AnalysisStatusEnumMap[instance.status]!,
      'totalChapters': instance.totalChapters,
      'totalWords': instance.totalWords,
      'totalCharacters': instance.totalCharacters,
      'totalParagraphs': instance.totalParagraphs,
      'detectedLanguage': instance.detectedLanguage,
      'imageCount': instance.imageCount,
      'ocrPageCount': instance.ocrPageCount,
      'extractedEntities': instance.extractedEntities,
      'extractedTerms': instance.extractedTerms,
      'chapterSummaries': instance.chapterSummaries,
      'estimatedCostUsd': instance.estimatedCostUsd,
      'estimatedTokens': instance.estimatedTokens,
      'estimatedMinutes': instance.estimatedMinutes,
      'tableCount': instance.tableCount,
      'codeBlockCount': instance.codeBlockCount,
      'detectedFormats': instance.detectedFormats,
      'summary': instance.summary,
      'createdAt': instance.createdAt.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'errorMessage': instance.errorMessage,
    };

const _$AnalysisStatusEnumMap = {
  AnalysisStatus.pending: 'pending',
  AnalysisStatus.inProgress: 'inProgress',
  AnalysisStatus.completed: 'completed',
  AnalysisStatus.failed: 'failed',
};

_$ExtractedEntityImpl _$$ExtractedEntityImplFromJson(
  Map<String, dynamic> json,
) => _$ExtractedEntityImpl(
  name: json['name'] as String,
  type: json['type'] as String,
  occurrences: (json['occurrences'] as num?)?.toInt() ?? 0,
  aliases:
      (json['aliases'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  context: json['context'] as String? ?? '',
);

Map<String, dynamic> _$$ExtractedEntityImplToJson(
  _$ExtractedEntityImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'type': instance.type,
  'occurrences': instance.occurrences,
  'aliases': instance.aliases,
  'context': instance.context,
};

_$ExtractedTermImpl _$$ExtractedTermImplFromJson(Map<String, dynamic> json) =>
    _$ExtractedTermImpl(
      term: json['term'] as String,
      category: json['category'] as String? ?? '',
      occurrences: (json['occurrences'] as num?)?.toInt() ?? 0,
      context: json['context'] as String? ?? '',
    );

Map<String, dynamic> _$$ExtractedTermImplToJson(_$ExtractedTermImpl instance) =>
    <String, dynamic>{
      'term': instance.term,
      'category': instance.category,
      'occurrences': instance.occurrences,
      'context': instance.context,
    };

_$ChapterSummaryImpl _$$ChapterSummaryImplFromJson(Map<String, dynamic> json) =>
    _$ChapterSummaryImpl(
      title: json['title'] as String,
      index: (json['index'] as num?)?.toInt() ?? 0,
      wordCount: (json['wordCount'] as num?)?.toInt() ?? 0,
      preview: json['preview'] as String? ?? '',
      imageCount: (json['imageCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ChapterSummaryImplToJson(
  _$ChapterSummaryImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'index': instance.index,
  'wordCount': instance.wordCount,
  'preview': instance.preview,
  'imageCount': instance.imageCount,
};

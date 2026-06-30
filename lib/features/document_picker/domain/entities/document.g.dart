// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DocumentImpl _$$DocumentImplFromJson(Map<String, dynamic> json) =>
    _$DocumentImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      path: json['path'] as String,
      format: $enumDecode(_$DocumentFormatEnumMap, json['format']),
      sizeBytes: (json['sizeBytes'] as num).toInt(),
      addedAt: DateTime.parse(json['addedAt'] as String),
      pageCount: (json['pageCount'] as num?)?.toInt() ?? 0,
      extractedText: json['extractedText'] as String? ?? '',
      chapters:
          (json['chapters'] as List<dynamic>?)
              ?.map((e) => DocumentChapter.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      translationProgress: json['translationProgress'] == null
          ? null
          : TranslationProgress.fromJson(
              json['translationProgress'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$DocumentImplToJson(_$DocumentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'path': instance.path,
      'format': _$DocumentFormatEnumMap[instance.format]!,
      'sizeBytes': instance.sizeBytes,
      'addedAt': instance.addedAt.toIso8601String(),
      'pageCount': instance.pageCount,
      'extractedText': instance.extractedText,
      'chapters': instance.chapters,
      'translationProgress': instance.translationProgress,
    };

const _$DocumentFormatEnumMap = {
  DocumentFormat.pdf: 'pdf',
  DocumentFormat.epub: 'epub',
  DocumentFormat.mobi: 'mobi',
  DocumentFormat.azw3: 'azw3',
  DocumentFormat.docx: 'docx',
  DocumentFormat.doc: 'doc',
  DocumentFormat.txt: 'txt',
  DocumentFormat.rtf: 'rtf',
  DocumentFormat.md: 'md',
  DocumentFormat.markdown: 'markdown',
  DocumentFormat.html: 'html',
  DocumentFormat.htm: 'htm',
  DocumentFormat.csv: 'csv',
  DocumentFormat.odt: 'odt',
  DocumentFormat.image: 'image',
  DocumentFormat.unknown: 'unknown',
};

_$DocumentChapterImpl _$$DocumentChapterImplFromJson(
  Map<String, dynamic> json,
) => _$DocumentChapterImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  content: json['content'] as String,
  index: (json['index'] as num?)?.toInt() ?? 0,
  wordCount: (json['wordCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$DocumentChapterImplToJson(
  _$DocumentChapterImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'content': instance.content,
  'index': instance.index,
  'wordCount': instance.wordCount,
};

_$TranslationProgressImpl _$$TranslationProgressImplFromJson(
  Map<String, dynamic> json,
) => _$TranslationProgressImpl(
  totalChunks: (json['totalChunks'] as num?)?.toInt() ?? 0,
  completedChunks: (json['completedChunks'] as num?)?.toInt() ?? 0,
  currentStatus: json['currentStatus'] as String? ?? '',
  isComplete: json['isComplete'] as bool? ?? false,
  isFailed: json['isFailed'] as bool? ?? false,
  errorMessage: json['errorMessage'] as String?,
);

Map<String, dynamic> _$$TranslationProgressImplToJson(
  _$TranslationProgressImpl instance,
) => <String, dynamic>{
  'totalChunks': instance.totalChunks,
  'completedChunks': instance.completedChunks,
  'currentStatus': instance.currentStatus,
  'isComplete': instance.isComplete,
  'isFailed': instance.isFailed,
  'errorMessage': instance.errorMessage,
};

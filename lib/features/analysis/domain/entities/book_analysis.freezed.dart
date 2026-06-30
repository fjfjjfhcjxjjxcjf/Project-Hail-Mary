// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_analysis.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BookAnalysis _$BookAnalysisFromJson(Map<String, dynamic> json) {
  return _BookAnalysis.fromJson(json);
}

/// @nodoc
mixin _$BookAnalysis {
  String get id => throw _privateConstructorUsedError;
  String get documentId => throw _privateConstructorUsedError;
  AnalysisStatus get status => throw _privateConstructorUsedError;
  int get totalChapters => throw _privateConstructorUsedError;
  int get totalWords => throw _privateConstructorUsedError;
  int get totalCharacters => throw _privateConstructorUsedError;
  int get totalParagraphs => throw _privateConstructorUsedError;
  String get detectedLanguage => throw _privateConstructorUsedError;
  int get imageCount => throw _privateConstructorUsedError;
  int get ocrPageCount => throw _privateConstructorUsedError;
  List<ExtractedEntity> get extractedEntities =>
      throw _privateConstructorUsedError;
  List<ExtractedTerm> get extractedTerms => throw _privateConstructorUsedError;
  List<ChapterSummary> get chapterSummaries =>
      throw _privateConstructorUsedError;
  double get estimatedCostUsd => throw _privateConstructorUsedError;
  int get estimatedTokens => throw _privateConstructorUsedError;
  int get estimatedMinutes => throw _privateConstructorUsedError;
  int get tableCount => throw _privateConstructorUsedError;
  int get codeBlockCount => throw _privateConstructorUsedError;
  List<String> get detectedFormats => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Serializes this BookAnalysis to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookAnalysisCopyWith<BookAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookAnalysisCopyWith<$Res> {
  factory $BookAnalysisCopyWith(
    BookAnalysis value,
    $Res Function(BookAnalysis) then,
  ) = _$BookAnalysisCopyWithImpl<$Res, BookAnalysis>;
  @useResult
  $Res call({
    String id,
    String documentId,
    AnalysisStatus status,
    int totalChapters,
    int totalWords,
    int totalCharacters,
    int totalParagraphs,
    String detectedLanguage,
    int imageCount,
    int ocrPageCount,
    List<ExtractedEntity> extractedEntities,
    List<ExtractedTerm> extractedTerms,
    List<ChapterSummary> chapterSummaries,
    double estimatedCostUsd,
    int estimatedTokens,
    int estimatedMinutes,
    int tableCount,
    int codeBlockCount,
    List<String> detectedFormats,
    String summary,
    DateTime createdAt,
    DateTime? completedAt,
    String? errorMessage,
  });
}

/// @nodoc
class _$BookAnalysisCopyWithImpl<$Res, $Val extends BookAnalysis>
    implements $BookAnalysisCopyWith<$Res> {
  _$BookAnalysisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? documentId = null,
    Object? status = null,
    Object? totalChapters = null,
    Object? totalWords = null,
    Object? totalCharacters = null,
    Object? totalParagraphs = null,
    Object? detectedLanguage = null,
    Object? imageCount = null,
    Object? ocrPageCount = null,
    Object? extractedEntities = null,
    Object? extractedTerms = null,
    Object? chapterSummaries = null,
    Object? estimatedCostUsd = null,
    Object? estimatedTokens = null,
    Object? estimatedMinutes = null,
    Object? tableCount = null,
    Object? codeBlockCount = null,
    Object? detectedFormats = null,
    Object? summary = null,
    Object? createdAt = null,
    Object? completedAt = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            documentId: null == documentId
                ? _value.documentId
                : documentId // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as AnalysisStatus,
            totalChapters: null == totalChapters
                ? _value.totalChapters
                : totalChapters // ignore: cast_nullable_to_non_nullable
                      as int,
            totalWords: null == totalWords
                ? _value.totalWords
                : totalWords // ignore: cast_nullable_to_non_nullable
                      as int,
            totalCharacters: null == totalCharacters
                ? _value.totalCharacters
                : totalCharacters // ignore: cast_nullable_to_non_nullable
                      as int,
            totalParagraphs: null == totalParagraphs
                ? _value.totalParagraphs
                : totalParagraphs // ignore: cast_nullable_to_non_nullable
                      as int,
            detectedLanguage: null == detectedLanguage
                ? _value.detectedLanguage
                : detectedLanguage // ignore: cast_nullable_to_non_nullable
                      as String,
            imageCount: null == imageCount
                ? _value.imageCount
                : imageCount // ignore: cast_nullable_to_non_nullable
                      as int,
            ocrPageCount: null == ocrPageCount
                ? _value.ocrPageCount
                : ocrPageCount // ignore: cast_nullable_to_non_nullable
                      as int,
            extractedEntities: null == extractedEntities
                ? _value.extractedEntities
                : extractedEntities // ignore: cast_nullable_to_non_nullable
                      as List<ExtractedEntity>,
            extractedTerms: null == extractedTerms
                ? _value.extractedTerms
                : extractedTerms // ignore: cast_nullable_to_non_nullable
                      as List<ExtractedTerm>,
            chapterSummaries: null == chapterSummaries
                ? _value.chapterSummaries
                : chapterSummaries // ignore: cast_nullable_to_non_nullable
                      as List<ChapterSummary>,
            estimatedCostUsd: null == estimatedCostUsd
                ? _value.estimatedCostUsd
                : estimatedCostUsd // ignore: cast_nullable_to_non_nullable
                      as double,
            estimatedTokens: null == estimatedTokens
                ? _value.estimatedTokens
                : estimatedTokens // ignore: cast_nullable_to_non_nullable
                      as int,
            estimatedMinutes: null == estimatedMinutes
                ? _value.estimatedMinutes
                : estimatedMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            tableCount: null == tableCount
                ? _value.tableCount
                : tableCount // ignore: cast_nullable_to_non_nullable
                      as int,
            codeBlockCount: null == codeBlockCount
                ? _value.codeBlockCount
                : codeBlockCount // ignore: cast_nullable_to_non_nullable
                      as int,
            detectedFormats: null == detectedFormats
                ? _value.detectedFormats
                : detectedFormats // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            summary: null == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BookAnalysisImplCopyWith<$Res>
    implements $BookAnalysisCopyWith<$Res> {
  factory _$$BookAnalysisImplCopyWith(
    _$BookAnalysisImpl value,
    $Res Function(_$BookAnalysisImpl) then,
  ) = __$$BookAnalysisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String documentId,
    AnalysisStatus status,
    int totalChapters,
    int totalWords,
    int totalCharacters,
    int totalParagraphs,
    String detectedLanguage,
    int imageCount,
    int ocrPageCount,
    List<ExtractedEntity> extractedEntities,
    List<ExtractedTerm> extractedTerms,
    List<ChapterSummary> chapterSummaries,
    double estimatedCostUsd,
    int estimatedTokens,
    int estimatedMinutes,
    int tableCount,
    int codeBlockCount,
    List<String> detectedFormats,
    String summary,
    DateTime createdAt,
    DateTime? completedAt,
    String? errorMessage,
  });
}

/// @nodoc
class __$$BookAnalysisImplCopyWithImpl<$Res>
    extends _$BookAnalysisCopyWithImpl<$Res, _$BookAnalysisImpl>
    implements _$$BookAnalysisImplCopyWith<$Res> {
  __$$BookAnalysisImplCopyWithImpl(
    _$BookAnalysisImpl _value,
    $Res Function(_$BookAnalysisImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? documentId = null,
    Object? status = null,
    Object? totalChapters = null,
    Object? totalWords = null,
    Object? totalCharacters = null,
    Object? totalParagraphs = null,
    Object? detectedLanguage = null,
    Object? imageCount = null,
    Object? ocrPageCount = null,
    Object? extractedEntities = null,
    Object? extractedTerms = null,
    Object? chapterSummaries = null,
    Object? estimatedCostUsd = null,
    Object? estimatedTokens = null,
    Object? estimatedMinutes = null,
    Object? tableCount = null,
    Object? codeBlockCount = null,
    Object? detectedFormats = null,
    Object? summary = null,
    Object? createdAt = null,
    Object? completedAt = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$BookAnalysisImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        documentId: null == documentId
            ? _value.documentId
            : documentId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as AnalysisStatus,
        totalChapters: null == totalChapters
            ? _value.totalChapters
            : totalChapters // ignore: cast_nullable_to_non_nullable
                  as int,
        totalWords: null == totalWords
            ? _value.totalWords
            : totalWords // ignore: cast_nullable_to_non_nullable
                  as int,
        totalCharacters: null == totalCharacters
            ? _value.totalCharacters
            : totalCharacters // ignore: cast_nullable_to_non_nullable
                  as int,
        totalParagraphs: null == totalParagraphs
            ? _value.totalParagraphs
            : totalParagraphs // ignore: cast_nullable_to_non_nullable
                  as int,
        detectedLanguage: null == detectedLanguage
            ? _value.detectedLanguage
            : detectedLanguage // ignore: cast_nullable_to_non_nullable
                  as String,
        imageCount: null == imageCount
            ? _value.imageCount
            : imageCount // ignore: cast_nullable_to_non_nullable
                  as int,
        ocrPageCount: null == ocrPageCount
            ? _value.ocrPageCount
            : ocrPageCount // ignore: cast_nullable_to_non_nullable
                  as int,
        extractedEntities: null == extractedEntities
            ? _value._extractedEntities
            : extractedEntities // ignore: cast_nullable_to_non_nullable
                  as List<ExtractedEntity>,
        extractedTerms: null == extractedTerms
            ? _value._extractedTerms
            : extractedTerms // ignore: cast_nullable_to_non_nullable
                  as List<ExtractedTerm>,
        chapterSummaries: null == chapterSummaries
            ? _value._chapterSummaries
            : chapterSummaries // ignore: cast_nullable_to_non_nullable
                  as List<ChapterSummary>,
        estimatedCostUsd: null == estimatedCostUsd
            ? _value.estimatedCostUsd
            : estimatedCostUsd // ignore: cast_nullable_to_non_nullable
                  as double,
        estimatedTokens: null == estimatedTokens
            ? _value.estimatedTokens
            : estimatedTokens // ignore: cast_nullable_to_non_nullable
                  as int,
        estimatedMinutes: null == estimatedMinutes
            ? _value.estimatedMinutes
            : estimatedMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        tableCount: null == tableCount
            ? _value.tableCount
            : tableCount // ignore: cast_nullable_to_non_nullable
                  as int,
        codeBlockCount: null == codeBlockCount
            ? _value.codeBlockCount
            : codeBlockCount // ignore: cast_nullable_to_non_nullable
                  as int,
        detectedFormats: null == detectedFormats
            ? _value._detectedFormats
            : detectedFormats // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        summary: null == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BookAnalysisImpl implements _BookAnalysis {
  const _$BookAnalysisImpl({
    required this.id,
    required this.documentId,
    this.status = AnalysisStatus.pending,
    this.totalChapters = 0,
    this.totalWords = 0,
    this.totalCharacters = 0,
    this.totalParagraphs = 0,
    this.detectedLanguage = '',
    this.imageCount = 0,
    this.ocrPageCount = 0,
    final List<ExtractedEntity> extractedEntities = const [],
    final List<ExtractedTerm> extractedTerms = const [],
    final List<ChapterSummary> chapterSummaries = const [],
    this.estimatedCostUsd = 0.0,
    this.estimatedTokens = 0,
    this.estimatedMinutes = 0,
    this.tableCount = 0,
    this.codeBlockCount = 0,
    final List<String> detectedFormats = const [],
    this.summary = '',
    required this.createdAt,
    this.completedAt,
    this.errorMessage,
  }) : _extractedEntities = extractedEntities,
       _extractedTerms = extractedTerms,
       _chapterSummaries = chapterSummaries,
       _detectedFormats = detectedFormats;

  factory _$BookAnalysisImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookAnalysisImplFromJson(json);

  @override
  final String id;
  @override
  final String documentId;
  @override
  @JsonKey()
  final AnalysisStatus status;
  @override
  @JsonKey()
  final int totalChapters;
  @override
  @JsonKey()
  final int totalWords;
  @override
  @JsonKey()
  final int totalCharacters;
  @override
  @JsonKey()
  final int totalParagraphs;
  @override
  @JsonKey()
  final String detectedLanguage;
  @override
  @JsonKey()
  final int imageCount;
  @override
  @JsonKey()
  final int ocrPageCount;
  final List<ExtractedEntity> _extractedEntities;
  @override
  @JsonKey()
  List<ExtractedEntity> get extractedEntities {
    if (_extractedEntities is EqualUnmodifiableListView)
      return _extractedEntities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_extractedEntities);
  }

  final List<ExtractedTerm> _extractedTerms;
  @override
  @JsonKey()
  List<ExtractedTerm> get extractedTerms {
    if (_extractedTerms is EqualUnmodifiableListView) return _extractedTerms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_extractedTerms);
  }

  final List<ChapterSummary> _chapterSummaries;
  @override
  @JsonKey()
  List<ChapterSummary> get chapterSummaries {
    if (_chapterSummaries is EqualUnmodifiableListView)
      return _chapterSummaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chapterSummaries);
  }

  @override
  @JsonKey()
  final double estimatedCostUsd;
  @override
  @JsonKey()
  final int estimatedTokens;
  @override
  @JsonKey()
  final int estimatedMinutes;
  @override
  @JsonKey()
  final int tableCount;
  @override
  @JsonKey()
  final int codeBlockCount;
  final List<String> _detectedFormats;
  @override
  @JsonKey()
  List<String> get detectedFormats {
    if (_detectedFormats is EqualUnmodifiableListView) return _detectedFormats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_detectedFormats);
  }

  @override
  @JsonKey()
  final String summary;
  @override
  final DateTime createdAt;
  @override
  final DateTime? completedAt;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'BookAnalysis(id: $id, documentId: $documentId, status: $status, totalChapters: $totalChapters, totalWords: $totalWords, totalCharacters: $totalCharacters, totalParagraphs: $totalParagraphs, detectedLanguage: $detectedLanguage, imageCount: $imageCount, ocrPageCount: $ocrPageCount, extractedEntities: $extractedEntities, extractedTerms: $extractedTerms, chapterSummaries: $chapterSummaries, estimatedCostUsd: $estimatedCostUsd, estimatedTokens: $estimatedTokens, estimatedMinutes: $estimatedMinutes, tableCount: $tableCount, codeBlockCount: $codeBlockCount, detectedFormats: $detectedFormats, summary: $summary, createdAt: $createdAt, completedAt: $completedAt, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookAnalysisImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalChapters, totalChapters) ||
                other.totalChapters == totalChapters) &&
            (identical(other.totalWords, totalWords) ||
                other.totalWords == totalWords) &&
            (identical(other.totalCharacters, totalCharacters) ||
                other.totalCharacters == totalCharacters) &&
            (identical(other.totalParagraphs, totalParagraphs) ||
                other.totalParagraphs == totalParagraphs) &&
            (identical(other.detectedLanguage, detectedLanguage) ||
                other.detectedLanguage == detectedLanguage) &&
            (identical(other.imageCount, imageCount) ||
                other.imageCount == imageCount) &&
            (identical(other.ocrPageCount, ocrPageCount) ||
                other.ocrPageCount == ocrPageCount) &&
            const DeepCollectionEquality().equals(
              other._extractedEntities,
              _extractedEntities,
            ) &&
            const DeepCollectionEquality().equals(
              other._extractedTerms,
              _extractedTerms,
            ) &&
            const DeepCollectionEquality().equals(
              other._chapterSummaries,
              _chapterSummaries,
            ) &&
            (identical(other.estimatedCostUsd, estimatedCostUsd) ||
                other.estimatedCostUsd == estimatedCostUsd) &&
            (identical(other.estimatedTokens, estimatedTokens) ||
                other.estimatedTokens == estimatedTokens) &&
            (identical(other.estimatedMinutes, estimatedMinutes) ||
                other.estimatedMinutes == estimatedMinutes) &&
            (identical(other.tableCount, tableCount) ||
                other.tableCount == tableCount) &&
            (identical(other.codeBlockCount, codeBlockCount) ||
                other.codeBlockCount == codeBlockCount) &&
            const DeepCollectionEquality().equals(
              other._detectedFormats,
              _detectedFormats,
            ) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    documentId,
    status,
    totalChapters,
    totalWords,
    totalCharacters,
    totalParagraphs,
    detectedLanguage,
    imageCount,
    ocrPageCount,
    const DeepCollectionEquality().hash(_extractedEntities),
    const DeepCollectionEquality().hash(_extractedTerms),
    const DeepCollectionEquality().hash(_chapterSummaries),
    estimatedCostUsd,
    estimatedTokens,
    estimatedMinutes,
    tableCount,
    codeBlockCount,
    const DeepCollectionEquality().hash(_detectedFormats),
    summary,
    createdAt,
    completedAt,
    errorMessage,
  ]);

  /// Create a copy of BookAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookAnalysisImplCopyWith<_$BookAnalysisImpl> get copyWith =>
      __$$BookAnalysisImplCopyWithImpl<_$BookAnalysisImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookAnalysisImplToJson(this);
  }
}

abstract class _BookAnalysis implements BookAnalysis {
  const factory _BookAnalysis({
    required final String id,
    required final String documentId,
    final AnalysisStatus status,
    final int totalChapters,
    final int totalWords,
    final int totalCharacters,
    final int totalParagraphs,
    final String detectedLanguage,
    final int imageCount,
    final int ocrPageCount,
    final List<ExtractedEntity> extractedEntities,
    final List<ExtractedTerm> extractedTerms,
    final List<ChapterSummary> chapterSummaries,
    final double estimatedCostUsd,
    final int estimatedTokens,
    final int estimatedMinutes,
    final int tableCount,
    final int codeBlockCount,
    final List<String> detectedFormats,
    final String summary,
    required final DateTime createdAt,
    final DateTime? completedAt,
    final String? errorMessage,
  }) = _$BookAnalysisImpl;

  factory _BookAnalysis.fromJson(Map<String, dynamic> json) =
      _$BookAnalysisImpl.fromJson;

  @override
  String get id;
  @override
  String get documentId;
  @override
  AnalysisStatus get status;
  @override
  int get totalChapters;
  @override
  int get totalWords;
  @override
  int get totalCharacters;
  @override
  int get totalParagraphs;
  @override
  String get detectedLanguage;
  @override
  int get imageCount;
  @override
  int get ocrPageCount;
  @override
  List<ExtractedEntity> get extractedEntities;
  @override
  List<ExtractedTerm> get extractedTerms;
  @override
  List<ChapterSummary> get chapterSummaries;
  @override
  double get estimatedCostUsd;
  @override
  int get estimatedTokens;
  @override
  int get estimatedMinutes;
  @override
  int get tableCount;
  @override
  int get codeBlockCount;
  @override
  List<String> get detectedFormats;
  @override
  String get summary;
  @override
  DateTime get createdAt;
  @override
  DateTime? get completedAt;
  @override
  String? get errorMessage;

  /// Create a copy of BookAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookAnalysisImplCopyWith<_$BookAnalysisImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExtractedEntity _$ExtractedEntityFromJson(Map<String, dynamic> json) {
  return _ExtractedEntity.fromJson(json);
}

/// @nodoc
mixin _$ExtractedEntity {
  String get name => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // character, place, org, etc.
  int get occurrences => throw _privateConstructorUsedError;
  List<String> get aliases => throw _privateConstructorUsedError;
  String get context => throw _privateConstructorUsedError;

  /// Serializes this ExtractedEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExtractedEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExtractedEntityCopyWith<ExtractedEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtractedEntityCopyWith<$Res> {
  factory $ExtractedEntityCopyWith(
    ExtractedEntity value,
    $Res Function(ExtractedEntity) then,
  ) = _$ExtractedEntityCopyWithImpl<$Res, ExtractedEntity>;
  @useResult
  $Res call({
    String name,
    String type,
    int occurrences,
    List<String> aliases,
    String context,
  });
}

/// @nodoc
class _$ExtractedEntityCopyWithImpl<$Res, $Val extends ExtractedEntity>
    implements $ExtractedEntityCopyWith<$Res> {
  _$ExtractedEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExtractedEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? occurrences = null,
    Object? aliases = null,
    Object? context = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            occurrences: null == occurrences
                ? _value.occurrences
                : occurrences // ignore: cast_nullable_to_non_nullable
                      as int,
            aliases: null == aliases
                ? _value.aliases
                : aliases // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            context: null == context
                ? _value.context
                : context // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExtractedEntityImplCopyWith<$Res>
    implements $ExtractedEntityCopyWith<$Res> {
  factory _$$ExtractedEntityImplCopyWith(
    _$ExtractedEntityImpl value,
    $Res Function(_$ExtractedEntityImpl) then,
  ) = __$$ExtractedEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String type,
    int occurrences,
    List<String> aliases,
    String context,
  });
}

/// @nodoc
class __$$ExtractedEntityImplCopyWithImpl<$Res>
    extends _$ExtractedEntityCopyWithImpl<$Res, _$ExtractedEntityImpl>
    implements _$$ExtractedEntityImplCopyWith<$Res> {
  __$$ExtractedEntityImplCopyWithImpl(
    _$ExtractedEntityImpl _value,
    $Res Function(_$ExtractedEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExtractedEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? occurrences = null,
    Object? aliases = null,
    Object? context = null,
  }) {
    return _then(
      _$ExtractedEntityImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        occurrences: null == occurrences
            ? _value.occurrences
            : occurrences // ignore: cast_nullable_to_non_nullable
                  as int,
        aliases: null == aliases
            ? _value._aliases
            : aliases // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        context: null == context
            ? _value.context
            : context // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExtractedEntityImpl implements _ExtractedEntity {
  const _$ExtractedEntityImpl({
    required this.name,
    required this.type,
    this.occurrences = 0,
    final List<String> aliases = const [],
    this.context = '',
  }) : _aliases = aliases;

  factory _$ExtractedEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExtractedEntityImplFromJson(json);

  @override
  final String name;
  @override
  final String type;
  // character, place, org, etc.
  @override
  @JsonKey()
  final int occurrences;
  final List<String> _aliases;
  @override
  @JsonKey()
  List<String> get aliases {
    if (_aliases is EqualUnmodifiableListView) return _aliases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_aliases);
  }

  @override
  @JsonKey()
  final String context;

  @override
  String toString() {
    return 'ExtractedEntity(name: $name, type: $type, occurrences: $occurrences, aliases: $aliases, context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtractedEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.occurrences, occurrences) ||
                other.occurrences == occurrences) &&
            const DeepCollectionEquality().equals(other._aliases, _aliases) &&
            (identical(other.context, context) || other.context == context));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    type,
    occurrences,
    const DeepCollectionEquality().hash(_aliases),
    context,
  );

  /// Create a copy of ExtractedEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtractedEntityImplCopyWith<_$ExtractedEntityImpl> get copyWith =>
      __$$ExtractedEntityImplCopyWithImpl<_$ExtractedEntityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ExtractedEntityImplToJson(this);
  }
}

abstract class _ExtractedEntity implements ExtractedEntity {
  const factory _ExtractedEntity({
    required final String name,
    required final String type,
    final int occurrences,
    final List<String> aliases,
    final String context,
  }) = _$ExtractedEntityImpl;

  factory _ExtractedEntity.fromJson(Map<String, dynamic> json) =
      _$ExtractedEntityImpl.fromJson;

  @override
  String get name;
  @override
  String get type; // character, place, org, etc.
  @override
  int get occurrences;
  @override
  List<String> get aliases;
  @override
  String get context;

  /// Create a copy of ExtractedEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExtractedEntityImplCopyWith<_$ExtractedEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExtractedTerm _$ExtractedTermFromJson(Map<String, dynamic> json) {
  return _ExtractedTerm.fromJson(json);
}

/// @nodoc
mixin _$ExtractedTerm {
  String get term => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  int get occurrences => throw _privateConstructorUsedError;
  String get context => throw _privateConstructorUsedError;

  /// Serializes this ExtractedTerm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExtractedTerm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExtractedTermCopyWith<ExtractedTerm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtractedTermCopyWith<$Res> {
  factory $ExtractedTermCopyWith(
    ExtractedTerm value,
    $Res Function(ExtractedTerm) then,
  ) = _$ExtractedTermCopyWithImpl<$Res, ExtractedTerm>;
  @useResult
  $Res call({String term, String category, int occurrences, String context});
}

/// @nodoc
class _$ExtractedTermCopyWithImpl<$Res, $Val extends ExtractedTerm>
    implements $ExtractedTermCopyWith<$Res> {
  _$ExtractedTermCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExtractedTerm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? term = null,
    Object? category = null,
    Object? occurrences = null,
    Object? context = null,
  }) {
    return _then(
      _value.copyWith(
            term: null == term
                ? _value.term
                : term // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            occurrences: null == occurrences
                ? _value.occurrences
                : occurrences // ignore: cast_nullable_to_non_nullable
                      as int,
            context: null == context
                ? _value.context
                : context // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExtractedTermImplCopyWith<$Res>
    implements $ExtractedTermCopyWith<$Res> {
  factory _$$ExtractedTermImplCopyWith(
    _$ExtractedTermImpl value,
    $Res Function(_$ExtractedTermImpl) then,
  ) = __$$ExtractedTermImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String term, String category, int occurrences, String context});
}

/// @nodoc
class __$$ExtractedTermImplCopyWithImpl<$Res>
    extends _$ExtractedTermCopyWithImpl<$Res, _$ExtractedTermImpl>
    implements _$$ExtractedTermImplCopyWith<$Res> {
  __$$ExtractedTermImplCopyWithImpl(
    _$ExtractedTermImpl _value,
    $Res Function(_$ExtractedTermImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExtractedTerm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? term = null,
    Object? category = null,
    Object? occurrences = null,
    Object? context = null,
  }) {
    return _then(
      _$ExtractedTermImpl(
        term: null == term
            ? _value.term
            : term // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        occurrences: null == occurrences
            ? _value.occurrences
            : occurrences // ignore: cast_nullable_to_non_nullable
                  as int,
        context: null == context
            ? _value.context
            : context // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExtractedTermImpl implements _ExtractedTerm {
  const _$ExtractedTermImpl({
    required this.term,
    this.category = '',
    this.occurrences = 0,
    this.context = '',
  });

  factory _$ExtractedTermImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExtractedTermImplFromJson(json);

  @override
  final String term;
  @override
  @JsonKey()
  final String category;
  @override
  @JsonKey()
  final int occurrences;
  @override
  @JsonKey()
  final String context;

  @override
  String toString() {
    return 'ExtractedTerm(term: $term, category: $category, occurrences: $occurrences, context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtractedTermImpl &&
            (identical(other.term, term) || other.term == term) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.occurrences, occurrences) ||
                other.occurrences == occurrences) &&
            (identical(other.context, context) || other.context == context));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, term, category, occurrences, context);

  /// Create a copy of ExtractedTerm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtractedTermImplCopyWith<_$ExtractedTermImpl> get copyWith =>
      __$$ExtractedTermImplCopyWithImpl<_$ExtractedTermImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExtractedTermImplToJson(this);
  }
}

abstract class _ExtractedTerm implements ExtractedTerm {
  const factory _ExtractedTerm({
    required final String term,
    final String category,
    final int occurrences,
    final String context,
  }) = _$ExtractedTermImpl;

  factory _ExtractedTerm.fromJson(Map<String, dynamic> json) =
      _$ExtractedTermImpl.fromJson;

  @override
  String get term;
  @override
  String get category;
  @override
  int get occurrences;
  @override
  String get context;

  /// Create a copy of ExtractedTerm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExtractedTermImplCopyWith<_$ExtractedTermImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChapterSummary _$ChapterSummaryFromJson(Map<String, dynamic> json) {
  return _ChapterSummary.fromJson(json);
}

/// @nodoc
mixin _$ChapterSummary {
  String get title => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  int get wordCount => throw _privateConstructorUsedError;
  String get preview => throw _privateConstructorUsedError;
  int get imageCount => throw _privateConstructorUsedError;

  /// Serializes this ChapterSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChapterSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChapterSummaryCopyWith<ChapterSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterSummaryCopyWith<$Res> {
  factory $ChapterSummaryCopyWith(
    ChapterSummary value,
    $Res Function(ChapterSummary) then,
  ) = _$ChapterSummaryCopyWithImpl<$Res, ChapterSummary>;
  @useResult
  $Res call({
    String title,
    int index,
    int wordCount,
    String preview,
    int imageCount,
  });
}

/// @nodoc
class _$ChapterSummaryCopyWithImpl<$Res, $Val extends ChapterSummary>
    implements $ChapterSummaryCopyWith<$Res> {
  _$ChapterSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChapterSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? index = null,
    Object? wordCount = null,
    Object? preview = null,
    Object? imageCount = null,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            index: null == index
                ? _value.index
                : index // ignore: cast_nullable_to_non_nullable
                      as int,
            wordCount: null == wordCount
                ? _value.wordCount
                : wordCount // ignore: cast_nullable_to_non_nullable
                      as int,
            preview: null == preview
                ? _value.preview
                : preview // ignore: cast_nullable_to_non_nullable
                      as String,
            imageCount: null == imageCount
                ? _value.imageCount
                : imageCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChapterSummaryImplCopyWith<$Res>
    implements $ChapterSummaryCopyWith<$Res> {
  factory _$$ChapterSummaryImplCopyWith(
    _$ChapterSummaryImpl value,
    $Res Function(_$ChapterSummaryImpl) then,
  ) = __$$ChapterSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    int index,
    int wordCount,
    String preview,
    int imageCount,
  });
}

/// @nodoc
class __$$ChapterSummaryImplCopyWithImpl<$Res>
    extends _$ChapterSummaryCopyWithImpl<$Res, _$ChapterSummaryImpl>
    implements _$$ChapterSummaryImplCopyWith<$Res> {
  __$$ChapterSummaryImplCopyWithImpl(
    _$ChapterSummaryImpl _value,
    $Res Function(_$ChapterSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChapterSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? index = null,
    Object? wordCount = null,
    Object? preview = null,
    Object? imageCount = null,
  }) {
    return _then(
      _$ChapterSummaryImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        index: null == index
            ? _value.index
            : index // ignore: cast_nullable_to_non_nullable
                  as int,
        wordCount: null == wordCount
            ? _value.wordCount
            : wordCount // ignore: cast_nullable_to_non_nullable
                  as int,
        preview: null == preview
            ? _value.preview
            : preview // ignore: cast_nullable_to_non_nullable
                  as String,
        imageCount: null == imageCount
            ? _value.imageCount
            : imageCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChapterSummaryImpl implements _ChapterSummary {
  const _$ChapterSummaryImpl({
    required this.title,
    this.index = 0,
    this.wordCount = 0,
    this.preview = '',
    this.imageCount = 0,
  });

  factory _$ChapterSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChapterSummaryImplFromJson(json);

  @override
  final String title;
  @override
  @JsonKey()
  final int index;
  @override
  @JsonKey()
  final int wordCount;
  @override
  @JsonKey()
  final String preview;
  @override
  @JsonKey()
  final int imageCount;

  @override
  String toString() {
    return 'ChapterSummary(title: $title, index: $index, wordCount: $wordCount, preview: $preview, imageCount: $imageCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapterSummaryImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.wordCount, wordCount) ||
                other.wordCount == wordCount) &&
            (identical(other.preview, preview) || other.preview == preview) &&
            (identical(other.imageCount, imageCount) ||
                other.imageCount == imageCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, index, wordCount, preview, imageCount);

  /// Create a copy of ChapterSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChapterSummaryImplCopyWith<_$ChapterSummaryImpl> get copyWith =>
      __$$ChapterSummaryImplCopyWithImpl<_$ChapterSummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChapterSummaryImplToJson(this);
  }
}

abstract class _ChapterSummary implements ChapterSummary {
  const factory _ChapterSummary({
    required final String title,
    final int index,
    final int wordCount,
    final String preview,
    final int imageCount,
  }) = _$ChapterSummaryImpl;

  factory _ChapterSummary.fromJson(Map<String, dynamic> json) =
      _$ChapterSummaryImpl.fromJson;

  @override
  String get title;
  @override
  int get index;
  @override
  int get wordCount;
  @override
  String get preview;
  @override
  int get imageCount;

  /// Create a copy of ChapterSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChapterSummaryImplCopyWith<_$ChapterSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

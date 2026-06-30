// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Document _$DocumentFromJson(Map<String, dynamic> json) {
  return _Document.fromJson(json);
}

/// @nodoc
mixin _$Document {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  DocumentFormat get format => throw _privateConstructorUsedError;
  int get sizeBytes => throw _privateConstructorUsedError;
  DateTime get addedAt => throw _privateConstructorUsedError;
  int get pageCount => throw _privateConstructorUsedError;
  String get extractedText => throw _privateConstructorUsedError;
  List<DocumentChapter> get chapters => throw _privateConstructorUsedError;
  TranslationProgress? get translationProgress =>
      throw _privateConstructorUsedError;

  /// Serializes this Document to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocumentCopyWith<Document> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentCopyWith<$Res> {
  factory $DocumentCopyWith(Document value, $Res Function(Document) then) =
      _$DocumentCopyWithImpl<$Res, Document>;
  @useResult
  $Res call({
    String id,
    String name,
    String path,
    DocumentFormat format,
    int sizeBytes,
    DateTime addedAt,
    int pageCount,
    String extractedText,
    List<DocumentChapter> chapters,
    TranslationProgress? translationProgress,
  });

  $TranslationProgressCopyWith<$Res>? get translationProgress;
}

/// @nodoc
class _$DocumentCopyWithImpl<$Res, $Val extends Document>
    implements $DocumentCopyWith<$Res> {
  _$DocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? path = null,
    Object? format = null,
    Object? sizeBytes = null,
    Object? addedAt = null,
    Object? pageCount = null,
    Object? extractedText = null,
    Object? chapters = null,
    Object? translationProgress = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            path: null == path
                ? _value.path
                : path // ignore: cast_nullable_to_non_nullable
                      as String,
            format: null == format
                ? _value.format
                : format // ignore: cast_nullable_to_non_nullable
                      as DocumentFormat,
            sizeBytes: null == sizeBytes
                ? _value.sizeBytes
                : sizeBytes // ignore: cast_nullable_to_non_nullable
                      as int,
            addedAt: null == addedAt
                ? _value.addedAt
                : addedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            pageCount: null == pageCount
                ? _value.pageCount
                : pageCount // ignore: cast_nullable_to_non_nullable
                      as int,
            extractedText: null == extractedText
                ? _value.extractedText
                : extractedText // ignore: cast_nullable_to_non_nullable
                      as String,
            chapters: null == chapters
                ? _value.chapters
                : chapters // ignore: cast_nullable_to_non_nullable
                      as List<DocumentChapter>,
            translationProgress: freezed == translationProgress
                ? _value.translationProgress
                : translationProgress // ignore: cast_nullable_to_non_nullable
                      as TranslationProgress?,
          )
          as $Val,
    );
  }

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TranslationProgressCopyWith<$Res>? get translationProgress {
    if (_value.translationProgress == null) {
      return null;
    }

    return $TranslationProgressCopyWith<$Res>(_value.translationProgress!, (
      value,
    ) {
      return _then(_value.copyWith(translationProgress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DocumentImplCopyWith<$Res>
    implements $DocumentCopyWith<$Res> {
  factory _$$DocumentImplCopyWith(
    _$DocumentImpl value,
    $Res Function(_$DocumentImpl) then,
  ) = __$$DocumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String path,
    DocumentFormat format,
    int sizeBytes,
    DateTime addedAt,
    int pageCount,
    String extractedText,
    List<DocumentChapter> chapters,
    TranslationProgress? translationProgress,
  });

  @override
  $TranslationProgressCopyWith<$Res>? get translationProgress;
}

/// @nodoc
class __$$DocumentImplCopyWithImpl<$Res>
    extends _$DocumentCopyWithImpl<$Res, _$DocumentImpl>
    implements _$$DocumentImplCopyWith<$Res> {
  __$$DocumentImplCopyWithImpl(
    _$DocumentImpl _value,
    $Res Function(_$DocumentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? path = null,
    Object? format = null,
    Object? sizeBytes = null,
    Object? addedAt = null,
    Object? pageCount = null,
    Object? extractedText = null,
    Object? chapters = null,
    Object? translationProgress = freezed,
  }) {
    return _then(
      _$DocumentImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        path: null == path
            ? _value.path
            : path // ignore: cast_nullable_to_non_nullable
                  as String,
        format: null == format
            ? _value.format
            : format // ignore: cast_nullable_to_non_nullable
                  as DocumentFormat,
        sizeBytes: null == sizeBytes
            ? _value.sizeBytes
            : sizeBytes // ignore: cast_nullable_to_non_nullable
                  as int,
        addedAt: null == addedAt
            ? _value.addedAt
            : addedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        pageCount: null == pageCount
            ? _value.pageCount
            : pageCount // ignore: cast_nullable_to_non_nullable
                  as int,
        extractedText: null == extractedText
            ? _value.extractedText
            : extractedText // ignore: cast_nullable_to_non_nullable
                  as String,
        chapters: null == chapters
            ? _value._chapters
            : chapters // ignore: cast_nullable_to_non_nullable
                  as List<DocumentChapter>,
        translationProgress: freezed == translationProgress
            ? _value.translationProgress
            : translationProgress // ignore: cast_nullable_to_non_nullable
                  as TranslationProgress?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DocumentImpl implements _Document {
  const _$DocumentImpl({
    required this.id,
    required this.name,
    required this.path,
    required this.format,
    required this.sizeBytes,
    required this.addedAt,
    this.pageCount = 0,
    this.extractedText = '',
    final List<DocumentChapter> chapters = const [],
    this.translationProgress,
  }) : _chapters = chapters;

  factory _$DocumentImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocumentImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String path;
  @override
  final DocumentFormat format;
  @override
  final int sizeBytes;
  @override
  final DateTime addedAt;
  @override
  @JsonKey()
  final int pageCount;
  @override
  @JsonKey()
  final String extractedText;
  final List<DocumentChapter> _chapters;
  @override
  @JsonKey()
  List<DocumentChapter> get chapters {
    if (_chapters is EqualUnmodifiableListView) return _chapters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chapters);
  }

  @override
  final TranslationProgress? translationProgress;

  @override
  String toString() {
    return 'Document(id: $id, name: $name, path: $path, format: $format, sizeBytes: $sizeBytes, addedAt: $addedAt, pageCount: $pageCount, extractedText: $extractedText, chapters: $chapters, translationProgress: $translationProgress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.sizeBytes, sizeBytes) ||
                other.sizeBytes == sizeBytes) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt) &&
            (identical(other.pageCount, pageCount) ||
                other.pageCount == pageCount) &&
            (identical(other.extractedText, extractedText) ||
                other.extractedText == extractedText) &&
            const DeepCollectionEquality().equals(other._chapters, _chapters) &&
            (identical(other.translationProgress, translationProgress) ||
                other.translationProgress == translationProgress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    path,
    format,
    sizeBytes,
    addedAt,
    pageCount,
    extractedText,
    const DeepCollectionEquality().hash(_chapters),
    translationProgress,
  );

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentImplCopyWith<_$DocumentImpl> get copyWith =>
      __$$DocumentImplCopyWithImpl<_$DocumentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DocumentImplToJson(this);
  }
}

abstract class _Document implements Document {
  const factory _Document({
    required final String id,
    required final String name,
    required final String path,
    required final DocumentFormat format,
    required final int sizeBytes,
    required final DateTime addedAt,
    final int pageCount,
    final String extractedText,
    final List<DocumentChapter> chapters,
    final TranslationProgress? translationProgress,
  }) = _$DocumentImpl;

  factory _Document.fromJson(Map<String, dynamic> json) =
      _$DocumentImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get path;
  @override
  DocumentFormat get format;
  @override
  int get sizeBytes;
  @override
  DateTime get addedAt;
  @override
  int get pageCount;
  @override
  String get extractedText;
  @override
  List<DocumentChapter> get chapters;
  @override
  TranslationProgress? get translationProgress;

  /// Create a copy of Document
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentImplCopyWith<_$DocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DocumentChapter _$DocumentChapterFromJson(Map<String, dynamic> json) {
  return _DocumentChapter.fromJson(json);
}

/// @nodoc
mixin _$DocumentChapter {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  int get wordCount => throw _privateConstructorUsedError;

  /// Serializes this DocumentChapter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DocumentChapter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocumentChapterCopyWith<DocumentChapter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentChapterCopyWith<$Res> {
  factory $DocumentChapterCopyWith(
    DocumentChapter value,
    $Res Function(DocumentChapter) then,
  ) = _$DocumentChapterCopyWithImpl<$Res, DocumentChapter>;
  @useResult
  $Res call({
    String id,
    String title,
    String content,
    int index,
    int wordCount,
  });
}

/// @nodoc
class _$DocumentChapterCopyWithImpl<$Res, $Val extends DocumentChapter>
    implements $DocumentChapterCopyWith<$Res> {
  _$DocumentChapterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DocumentChapter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? index = null,
    Object? wordCount = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            index: null == index
                ? _value.index
                : index // ignore: cast_nullable_to_non_nullable
                      as int,
            wordCount: null == wordCount
                ? _value.wordCount
                : wordCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DocumentChapterImplCopyWith<$Res>
    implements $DocumentChapterCopyWith<$Res> {
  factory _$$DocumentChapterImplCopyWith(
    _$DocumentChapterImpl value,
    $Res Function(_$DocumentChapterImpl) then,
  ) = __$$DocumentChapterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String content,
    int index,
    int wordCount,
  });
}

/// @nodoc
class __$$DocumentChapterImplCopyWithImpl<$Res>
    extends _$DocumentChapterCopyWithImpl<$Res, _$DocumentChapterImpl>
    implements _$$DocumentChapterImplCopyWith<$Res> {
  __$$DocumentChapterImplCopyWithImpl(
    _$DocumentChapterImpl _value,
    $Res Function(_$DocumentChapterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DocumentChapter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? index = null,
    Object? wordCount = null,
  }) {
    return _then(
      _$DocumentChapterImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        index: null == index
            ? _value.index
            : index // ignore: cast_nullable_to_non_nullable
                  as int,
        wordCount: null == wordCount
            ? _value.wordCount
            : wordCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DocumentChapterImpl implements _DocumentChapter {
  const _$DocumentChapterImpl({
    required this.id,
    required this.title,
    required this.content,
    this.index = 0,
    this.wordCount = 0,
  });

  factory _$DocumentChapterImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocumentChapterImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String content;
  @override
  @JsonKey()
  final int index;
  @override
  @JsonKey()
  final int wordCount;

  @override
  String toString() {
    return 'DocumentChapter(id: $id, title: $title, content: $content, index: $index, wordCount: $wordCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentChapterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.wordCount, wordCount) ||
                other.wordCount == wordCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, content, index, wordCount);

  /// Create a copy of DocumentChapter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentChapterImplCopyWith<_$DocumentChapterImpl> get copyWith =>
      __$$DocumentChapterImplCopyWithImpl<_$DocumentChapterImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DocumentChapterImplToJson(this);
  }
}

abstract class _DocumentChapter implements DocumentChapter {
  const factory _DocumentChapter({
    required final String id,
    required final String title,
    required final String content,
    final int index,
    final int wordCount,
  }) = _$DocumentChapterImpl;

  factory _DocumentChapter.fromJson(Map<String, dynamic> json) =
      _$DocumentChapterImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get content;
  @override
  int get index;
  @override
  int get wordCount;

  /// Create a copy of DocumentChapter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentChapterImplCopyWith<_$DocumentChapterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TranslationProgress _$TranslationProgressFromJson(Map<String, dynamic> json) {
  return _TranslationProgress.fromJson(json);
}

/// @nodoc
mixin _$TranslationProgress {
  int get totalChunks => throw _privateConstructorUsedError;
  int get completedChunks => throw _privateConstructorUsedError;
  String get currentStatus => throw _privateConstructorUsedError;
  bool get isComplete => throw _privateConstructorUsedError;
  bool get isFailed => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Serializes this TranslationProgress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TranslationProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TranslationProgressCopyWith<TranslationProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranslationProgressCopyWith<$Res> {
  factory $TranslationProgressCopyWith(
    TranslationProgress value,
    $Res Function(TranslationProgress) then,
  ) = _$TranslationProgressCopyWithImpl<$Res, TranslationProgress>;
  @useResult
  $Res call({
    int totalChunks,
    int completedChunks,
    String currentStatus,
    bool isComplete,
    bool isFailed,
    String? errorMessage,
  });
}

/// @nodoc
class _$TranslationProgressCopyWithImpl<$Res, $Val extends TranslationProgress>
    implements $TranslationProgressCopyWith<$Res> {
  _$TranslationProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TranslationProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalChunks = null,
    Object? completedChunks = null,
    Object? currentStatus = null,
    Object? isComplete = null,
    Object? isFailed = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            totalChunks: null == totalChunks
                ? _value.totalChunks
                : totalChunks // ignore: cast_nullable_to_non_nullable
                      as int,
            completedChunks: null == completedChunks
                ? _value.completedChunks
                : completedChunks // ignore: cast_nullable_to_non_nullable
                      as int,
            currentStatus: null == currentStatus
                ? _value.currentStatus
                : currentStatus // ignore: cast_nullable_to_non_nullable
                      as String,
            isComplete: null == isComplete
                ? _value.isComplete
                : isComplete // ignore: cast_nullable_to_non_nullable
                      as bool,
            isFailed: null == isFailed
                ? _value.isFailed
                : isFailed // ignore: cast_nullable_to_non_nullable
                      as bool,
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
abstract class _$$TranslationProgressImplCopyWith<$Res>
    implements $TranslationProgressCopyWith<$Res> {
  factory _$$TranslationProgressImplCopyWith(
    _$TranslationProgressImpl value,
    $Res Function(_$TranslationProgressImpl) then,
  ) = __$$TranslationProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int totalChunks,
    int completedChunks,
    String currentStatus,
    bool isComplete,
    bool isFailed,
    String? errorMessage,
  });
}

/// @nodoc
class __$$TranslationProgressImplCopyWithImpl<$Res>
    extends _$TranslationProgressCopyWithImpl<$Res, _$TranslationProgressImpl>
    implements _$$TranslationProgressImplCopyWith<$Res> {
  __$$TranslationProgressImplCopyWithImpl(
    _$TranslationProgressImpl _value,
    $Res Function(_$TranslationProgressImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TranslationProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalChunks = null,
    Object? completedChunks = null,
    Object? currentStatus = null,
    Object? isComplete = null,
    Object? isFailed = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$TranslationProgressImpl(
        totalChunks: null == totalChunks
            ? _value.totalChunks
            : totalChunks // ignore: cast_nullable_to_non_nullable
                  as int,
        completedChunks: null == completedChunks
            ? _value.completedChunks
            : completedChunks // ignore: cast_nullable_to_non_nullable
                  as int,
        currentStatus: null == currentStatus
            ? _value.currentStatus
            : currentStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        isComplete: null == isComplete
            ? _value.isComplete
            : isComplete // ignore: cast_nullable_to_non_nullable
                  as bool,
        isFailed: null == isFailed
            ? _value.isFailed
            : isFailed // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$TranslationProgressImpl implements _TranslationProgress {
  const _$TranslationProgressImpl({
    this.totalChunks = 0,
    this.completedChunks = 0,
    this.currentStatus = '',
    this.isComplete = false,
    this.isFailed = false,
    this.errorMessage,
  });

  factory _$TranslationProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$TranslationProgressImplFromJson(json);

  @override
  @JsonKey()
  final int totalChunks;
  @override
  @JsonKey()
  final int completedChunks;
  @override
  @JsonKey()
  final String currentStatus;
  @override
  @JsonKey()
  final bool isComplete;
  @override
  @JsonKey()
  final bool isFailed;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'TranslationProgress(totalChunks: $totalChunks, completedChunks: $completedChunks, currentStatus: $currentStatus, isComplete: $isComplete, isFailed: $isFailed, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranslationProgressImpl &&
            (identical(other.totalChunks, totalChunks) ||
                other.totalChunks == totalChunks) &&
            (identical(other.completedChunks, completedChunks) ||
                other.completedChunks == completedChunks) &&
            (identical(other.currentStatus, currentStatus) ||
                other.currentStatus == currentStatus) &&
            (identical(other.isComplete, isComplete) ||
                other.isComplete == isComplete) &&
            (identical(other.isFailed, isFailed) ||
                other.isFailed == isFailed) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalChunks,
    completedChunks,
    currentStatus,
    isComplete,
    isFailed,
    errorMessage,
  );

  /// Create a copy of TranslationProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranslationProgressImplCopyWith<_$TranslationProgressImpl> get copyWith =>
      __$$TranslationProgressImplCopyWithImpl<_$TranslationProgressImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TranslationProgressImplToJson(this);
  }
}

abstract class _TranslationProgress implements TranslationProgress {
  const factory _TranslationProgress({
    final int totalChunks,
    final int completedChunks,
    final String currentStatus,
    final bool isComplete,
    final bool isFailed,
    final String? errorMessage,
  }) = _$TranslationProgressImpl;

  factory _TranslationProgress.fromJson(Map<String, dynamic> json) =
      _$TranslationProgressImpl.fromJson;

  @override
  int get totalChunks;
  @override
  int get completedChunks;
  @override
  String get currentStatus;
  @override
  bool get isComplete;
  @override
  bool get isFailed;
  @override
  String? get errorMessage;

  /// Create a copy of TranslationProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranslationProgressImplCopyWith<_$TranslationProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

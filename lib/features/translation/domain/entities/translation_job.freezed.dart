// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'translation_job.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TranslationJob _$TranslationJobFromJson(Map<String, dynamic> json) {
  return _TranslationJob.fromJson(json);
}

/// @nodoc
mixin _$TranslationJob {
  String get id => throw _privateConstructorUsedError;
  String get documentId => throw _privateConstructorUsedError;
  String get documentName => throw _privateConstructorUsedError;
  String get sourceLanguage => throw _privateConstructorUsedError;
  String get targetLanguage => throw _privateConstructorUsedError;
  TranslationProfile get profile => throw _privateConstructorUsedError;
  TranslationStatus get status => throw _privateConstructorUsedError;
  double get progress => throw _privateConstructorUsedError;
  String get customPrompt => throw _privateConstructorUsedError;
  String get providerId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  List<TranslatedChunk> get chunks => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get useGlossary => throw _privateConstructorUsedError;
  bool get useContextAware => throw _privateConstructorUsedError;

  /// Serializes this TranslationJob to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TranslationJob
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TranslationJobCopyWith<TranslationJob> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranslationJobCopyWith<$Res> {
  factory $TranslationJobCopyWith(
    TranslationJob value,
    $Res Function(TranslationJob) then,
  ) = _$TranslationJobCopyWithImpl<$Res, TranslationJob>;
  @useResult
  $Res call({
    String id,
    String documentId,
    String documentName,
    String sourceLanguage,
    String targetLanguage,
    TranslationProfile profile,
    TranslationStatus status,
    double progress,
    String customPrompt,
    String providerId,
    DateTime createdAt,
    DateTime? completedAt,
    List<TranslatedChunk> chunks,
    String? errorMessage,
    bool useGlossary,
    bool useContextAware,
  });
}

/// @nodoc
class _$TranslationJobCopyWithImpl<$Res, $Val extends TranslationJob>
    implements $TranslationJobCopyWith<$Res> {
  _$TranslationJobCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TranslationJob
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? documentId = null,
    Object? documentName = null,
    Object? sourceLanguage = null,
    Object? targetLanguage = null,
    Object? profile = null,
    Object? status = null,
    Object? progress = null,
    Object? customPrompt = null,
    Object? providerId = null,
    Object? createdAt = null,
    Object? completedAt = freezed,
    Object? chunks = null,
    Object? errorMessage = freezed,
    Object? useGlossary = null,
    Object? useContextAware = null,
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
            documentName: null == documentName
                ? _value.documentName
                : documentName // ignore: cast_nullable_to_non_nullable
                      as String,
            sourceLanguage: null == sourceLanguage
                ? _value.sourceLanguage
                : sourceLanguage // ignore: cast_nullable_to_non_nullable
                      as String,
            targetLanguage: null == targetLanguage
                ? _value.targetLanguage
                : targetLanguage // ignore: cast_nullable_to_non_nullable
                      as String,
            profile: null == profile
                ? _value.profile
                : profile // ignore: cast_nullable_to_non_nullable
                      as TranslationProfile,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as TranslationStatus,
            progress: null == progress
                ? _value.progress
                : progress // ignore: cast_nullable_to_non_nullable
                      as double,
            customPrompt: null == customPrompt
                ? _value.customPrompt
                : customPrompt // ignore: cast_nullable_to_non_nullable
                      as String,
            providerId: null == providerId
                ? _value.providerId
                : providerId // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            chunks: null == chunks
                ? _value.chunks
                : chunks // ignore: cast_nullable_to_non_nullable
                      as List<TranslatedChunk>,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            useGlossary: null == useGlossary
                ? _value.useGlossary
                : useGlossary // ignore: cast_nullable_to_non_nullable
                      as bool,
            useContextAware: null == useContextAware
                ? _value.useContextAware
                : useContextAware // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TranslationJobImplCopyWith<$Res>
    implements $TranslationJobCopyWith<$Res> {
  factory _$$TranslationJobImplCopyWith(
    _$TranslationJobImpl value,
    $Res Function(_$TranslationJobImpl) then,
  ) = __$$TranslationJobImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String documentId,
    String documentName,
    String sourceLanguage,
    String targetLanguage,
    TranslationProfile profile,
    TranslationStatus status,
    double progress,
    String customPrompt,
    String providerId,
    DateTime createdAt,
    DateTime? completedAt,
    List<TranslatedChunk> chunks,
    String? errorMessage,
    bool useGlossary,
    bool useContextAware,
  });
}

/// @nodoc
class __$$TranslationJobImplCopyWithImpl<$Res>
    extends _$TranslationJobCopyWithImpl<$Res, _$TranslationJobImpl>
    implements _$$TranslationJobImplCopyWith<$Res> {
  __$$TranslationJobImplCopyWithImpl(
    _$TranslationJobImpl _value,
    $Res Function(_$TranslationJobImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TranslationJob
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? documentId = null,
    Object? documentName = null,
    Object? sourceLanguage = null,
    Object? targetLanguage = null,
    Object? profile = null,
    Object? status = null,
    Object? progress = null,
    Object? customPrompt = null,
    Object? providerId = null,
    Object? createdAt = null,
    Object? completedAt = freezed,
    Object? chunks = null,
    Object? errorMessage = freezed,
    Object? useGlossary = null,
    Object? useContextAware = null,
  }) {
    return _then(
      _$TranslationJobImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        documentId: null == documentId
            ? _value.documentId
            : documentId // ignore: cast_nullable_to_non_nullable
                  as String,
        documentName: null == documentName
            ? _value.documentName
            : documentName // ignore: cast_nullable_to_non_nullable
                  as String,
        sourceLanguage: null == sourceLanguage
            ? _value.sourceLanguage
            : sourceLanguage // ignore: cast_nullable_to_non_nullable
                  as String,
        targetLanguage: null == targetLanguage
            ? _value.targetLanguage
            : targetLanguage // ignore: cast_nullable_to_non_nullable
                  as String,
        profile: null == profile
            ? _value.profile
            : profile // ignore: cast_nullable_to_non_nullable
                  as TranslationProfile,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as TranslationStatus,
        progress: null == progress
            ? _value.progress
            : progress // ignore: cast_nullable_to_non_nullable
                  as double,
        customPrompt: null == customPrompt
            ? _value.customPrompt
            : customPrompt // ignore: cast_nullable_to_non_nullable
                  as String,
        providerId: null == providerId
            ? _value.providerId
            : providerId // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        chunks: null == chunks
            ? _value._chunks
            : chunks // ignore: cast_nullable_to_non_nullable
                  as List<TranslatedChunk>,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        useGlossary: null == useGlossary
            ? _value.useGlossary
            : useGlossary // ignore: cast_nullable_to_non_nullable
                  as bool,
        useContextAware: null == useContextAware
            ? _value.useContextAware
            : useContextAware // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TranslationJobImpl implements _TranslationJob {
  const _$TranslationJobImpl({
    required this.id,
    required this.documentId,
    required this.documentName,
    required this.sourceLanguage,
    required this.targetLanguage,
    required this.profile,
    this.status = TranslationStatus.pending,
    this.progress = 0.0,
    this.customPrompt = '',
    this.providerId = '',
    required this.createdAt,
    this.completedAt,
    final List<TranslatedChunk> chunks = const [],
    this.errorMessage,
    this.useGlossary = false,
    this.useContextAware = false,
  }) : _chunks = chunks;

  factory _$TranslationJobImpl.fromJson(Map<String, dynamic> json) =>
      _$$TranslationJobImplFromJson(json);

  @override
  final String id;
  @override
  final String documentId;
  @override
  final String documentName;
  @override
  final String sourceLanguage;
  @override
  final String targetLanguage;
  @override
  final TranslationProfile profile;
  @override
  @JsonKey()
  final TranslationStatus status;
  @override
  @JsonKey()
  final double progress;
  @override
  @JsonKey()
  final String customPrompt;
  @override
  @JsonKey()
  final String providerId;
  @override
  final DateTime createdAt;
  @override
  final DateTime? completedAt;
  final List<TranslatedChunk> _chunks;
  @override
  @JsonKey()
  List<TranslatedChunk> get chunks {
    if (_chunks is EqualUnmodifiableListView) return _chunks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chunks);
  }

  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final bool useGlossary;
  @override
  @JsonKey()
  final bool useContextAware;

  @override
  String toString() {
    return 'TranslationJob(id: $id, documentId: $documentId, documentName: $documentName, sourceLanguage: $sourceLanguage, targetLanguage: $targetLanguage, profile: $profile, status: $status, progress: $progress, customPrompt: $customPrompt, providerId: $providerId, createdAt: $createdAt, completedAt: $completedAt, chunks: $chunks, errorMessage: $errorMessage, useGlossary: $useGlossary, useContextAware: $useContextAware)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranslationJobImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.documentName, documentName) ||
                other.documentName == documentName) &&
            (identical(other.sourceLanguage, sourceLanguage) ||
                other.sourceLanguage == sourceLanguage) &&
            (identical(other.targetLanguage, targetLanguage) ||
                other.targetLanguage == targetLanguage) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.customPrompt, customPrompt) ||
                other.customPrompt == customPrompt) &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            const DeepCollectionEquality().equals(other._chunks, _chunks) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.useGlossary, useGlossary) ||
                other.useGlossary == useGlossary) &&
            (identical(other.useContextAware, useContextAware) ||
                other.useContextAware == useContextAware));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    documentId,
    documentName,
    sourceLanguage,
    targetLanguage,
    profile,
    status,
    progress,
    customPrompt,
    providerId,
    createdAt,
    completedAt,
    const DeepCollectionEquality().hash(_chunks),
    errorMessage,
    useGlossary,
    useContextAware,
  );

  /// Create a copy of TranslationJob
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranslationJobImplCopyWith<_$TranslationJobImpl> get copyWith =>
      __$$TranslationJobImplCopyWithImpl<_$TranslationJobImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TranslationJobImplToJson(this);
  }
}

abstract class _TranslationJob implements TranslationJob {
  const factory _TranslationJob({
    required final String id,
    required final String documentId,
    required final String documentName,
    required final String sourceLanguage,
    required final String targetLanguage,
    required final TranslationProfile profile,
    final TranslationStatus status,
    final double progress,
    final String customPrompt,
    final String providerId,
    required final DateTime createdAt,
    final DateTime? completedAt,
    final List<TranslatedChunk> chunks,
    final String? errorMessage,
    final bool useGlossary,
    final bool useContextAware,
  }) = _$TranslationJobImpl;

  factory _TranslationJob.fromJson(Map<String, dynamic> json) =
      _$TranslationJobImpl.fromJson;

  @override
  String get id;
  @override
  String get documentId;
  @override
  String get documentName;
  @override
  String get sourceLanguage;
  @override
  String get targetLanguage;
  @override
  TranslationProfile get profile;
  @override
  TranslationStatus get status;
  @override
  double get progress;
  @override
  String get customPrompt;
  @override
  String get providerId;
  @override
  DateTime get createdAt;
  @override
  DateTime? get completedAt;
  @override
  List<TranslatedChunk> get chunks;
  @override
  String? get errorMessage;
  @override
  bool get useGlossary;
  @override
  bool get useContextAware;

  /// Create a copy of TranslationJob
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranslationJobImplCopyWith<_$TranslationJobImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TranslatedChunk _$TranslatedChunkFromJson(Map<String, dynamic> json) {
  return _TranslatedChunk.fromJson(json);
}

/// @nodoc
mixin _$TranslatedChunk {
  String get id => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  String get originalText => throw _privateConstructorUsedError;
  String get translatedText => throw _privateConstructorUsedError;
  bool get isComplete => throw _privateConstructorUsedError;
  bool get isReviewed => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Serializes this TranslatedChunk to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TranslatedChunk
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TranslatedChunkCopyWith<TranslatedChunk> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranslatedChunkCopyWith<$Res> {
  factory $TranslatedChunkCopyWith(
    TranslatedChunk value,
    $Res Function(TranslatedChunk) then,
  ) = _$TranslatedChunkCopyWithImpl<$Res, TranslatedChunk>;
  @useResult
  $Res call({
    String id,
    int index,
    String originalText,
    String translatedText,
    bool isComplete,
    bool isReviewed,
    String? errorMessage,
  });
}

/// @nodoc
class _$TranslatedChunkCopyWithImpl<$Res, $Val extends TranslatedChunk>
    implements $TranslatedChunkCopyWith<$Res> {
  _$TranslatedChunkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TranslatedChunk
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? index = null,
    Object? originalText = null,
    Object? translatedText = null,
    Object? isComplete = null,
    Object? isReviewed = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            index: null == index
                ? _value.index
                : index // ignore: cast_nullable_to_non_nullable
                      as int,
            originalText: null == originalText
                ? _value.originalText
                : originalText // ignore: cast_nullable_to_non_nullable
                      as String,
            translatedText: null == translatedText
                ? _value.translatedText
                : translatedText // ignore: cast_nullable_to_non_nullable
                      as String,
            isComplete: null == isComplete
                ? _value.isComplete
                : isComplete // ignore: cast_nullable_to_non_nullable
                      as bool,
            isReviewed: null == isReviewed
                ? _value.isReviewed
                : isReviewed // ignore: cast_nullable_to_non_nullable
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
abstract class _$$TranslatedChunkImplCopyWith<$Res>
    implements $TranslatedChunkCopyWith<$Res> {
  factory _$$TranslatedChunkImplCopyWith(
    _$TranslatedChunkImpl value,
    $Res Function(_$TranslatedChunkImpl) then,
  ) = __$$TranslatedChunkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    int index,
    String originalText,
    String translatedText,
    bool isComplete,
    bool isReviewed,
    String? errorMessage,
  });
}

/// @nodoc
class __$$TranslatedChunkImplCopyWithImpl<$Res>
    extends _$TranslatedChunkCopyWithImpl<$Res, _$TranslatedChunkImpl>
    implements _$$TranslatedChunkImplCopyWith<$Res> {
  __$$TranslatedChunkImplCopyWithImpl(
    _$TranslatedChunkImpl _value,
    $Res Function(_$TranslatedChunkImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TranslatedChunk
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? index = null,
    Object? originalText = null,
    Object? translatedText = null,
    Object? isComplete = null,
    Object? isReviewed = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$TranslatedChunkImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        index: null == index
            ? _value.index
            : index // ignore: cast_nullable_to_non_nullable
                  as int,
        originalText: null == originalText
            ? _value.originalText
            : originalText // ignore: cast_nullable_to_non_nullable
                  as String,
        translatedText: null == translatedText
            ? _value.translatedText
            : translatedText // ignore: cast_nullable_to_non_nullable
                  as String,
        isComplete: null == isComplete
            ? _value.isComplete
            : isComplete // ignore: cast_nullable_to_non_nullable
                  as bool,
        isReviewed: null == isReviewed
            ? _value.isReviewed
            : isReviewed // ignore: cast_nullable_to_non_nullable
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
class _$TranslatedChunkImpl implements _TranslatedChunk {
  const _$TranslatedChunkImpl({
    required this.id,
    required this.index,
    required this.originalText,
    this.translatedText = '',
    this.isComplete = false,
    this.isReviewed = false,
    this.errorMessage,
  });

  factory _$TranslatedChunkImpl.fromJson(Map<String, dynamic> json) =>
      _$$TranslatedChunkImplFromJson(json);

  @override
  final String id;
  @override
  final int index;
  @override
  final String originalText;
  @override
  @JsonKey()
  final String translatedText;
  @override
  @JsonKey()
  final bool isComplete;
  @override
  @JsonKey()
  final bool isReviewed;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'TranslatedChunk(id: $id, index: $index, originalText: $originalText, translatedText: $translatedText, isComplete: $isComplete, isReviewed: $isReviewed, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranslatedChunkImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.originalText, originalText) ||
                other.originalText == originalText) &&
            (identical(other.translatedText, translatedText) ||
                other.translatedText == translatedText) &&
            (identical(other.isComplete, isComplete) ||
                other.isComplete == isComplete) &&
            (identical(other.isReviewed, isReviewed) ||
                other.isReviewed == isReviewed) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    index,
    originalText,
    translatedText,
    isComplete,
    isReviewed,
    errorMessage,
  );

  /// Create a copy of TranslatedChunk
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranslatedChunkImplCopyWith<_$TranslatedChunkImpl> get copyWith =>
      __$$TranslatedChunkImplCopyWithImpl<_$TranslatedChunkImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TranslatedChunkImplToJson(this);
  }
}

abstract class _TranslatedChunk implements TranslatedChunk {
  const factory _TranslatedChunk({
    required final String id,
    required final int index,
    required final String originalText,
    final String translatedText,
    final bool isComplete,
    final bool isReviewed,
    final String? errorMessage,
  }) = _$TranslatedChunkImpl;

  factory _TranslatedChunk.fromJson(Map<String, dynamic> json) =
      _$TranslatedChunkImpl.fromJson;

  @override
  String get id;
  @override
  int get index;
  @override
  String get originalText;
  @override
  String get translatedText;
  @override
  bool get isComplete;
  @override
  bool get isReviewed;
  @override
  String? get errorMessage;

  /// Create a copy of TranslatedChunk
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranslatedChunkImplCopyWith<_$TranslatedChunkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

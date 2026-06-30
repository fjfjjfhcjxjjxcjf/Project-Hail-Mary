// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'translation_cache.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CacheEntry _$CacheEntryFromJson(Map<String, dynamic> json) {
  return _CacheEntry.fromJson(json);
}

/// @nodoc
mixin _$CacheEntry {
  String get id => throw _privateConstructorUsedError;
  String get sourceHash => throw _privateConstructorUsedError;
  String get sourceText => throw _privateConstructorUsedError;
  String get translatedText => throw _privateConstructorUsedError;
  String get sourceLanguage => throw _privateConstructorUsedError;
  String get targetLanguage => throw _privateConstructorUsedError;
  String get profileId => throw _privateConstructorUsedError;
  String get providerId => throw _privateConstructorUsedError;
  String get modelId => throw _privateConstructorUsedError;
  int get hitCount => throw _privateConstructorUsedError;
  double get qualityScore => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get lastUsedAt => throw _privateConstructorUsedError;

  /// Serializes this CacheEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CacheEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CacheEntryCopyWith<CacheEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CacheEntryCopyWith<$Res> {
  factory $CacheEntryCopyWith(
    CacheEntry value,
    $Res Function(CacheEntry) then,
  ) = _$CacheEntryCopyWithImpl<$Res, CacheEntry>;
  @useResult
  $Res call({
    String id,
    String sourceHash,
    String sourceText,
    String translatedText,
    String sourceLanguage,
    String targetLanguage,
    String profileId,
    String providerId,
    String modelId,
    int hitCount,
    double qualityScore,
    DateTime createdAt,
    DateTime? lastUsedAt,
  });
}

/// @nodoc
class _$CacheEntryCopyWithImpl<$Res, $Val extends CacheEntry>
    implements $CacheEntryCopyWith<$Res> {
  _$CacheEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CacheEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sourceHash = null,
    Object? sourceText = null,
    Object? translatedText = null,
    Object? sourceLanguage = null,
    Object? targetLanguage = null,
    Object? profileId = null,
    Object? providerId = null,
    Object? modelId = null,
    Object? hitCount = null,
    Object? qualityScore = null,
    Object? createdAt = null,
    Object? lastUsedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            sourceHash: null == sourceHash
                ? _value.sourceHash
                : sourceHash // ignore: cast_nullable_to_non_nullable
                      as String,
            sourceText: null == sourceText
                ? _value.sourceText
                : sourceText // ignore: cast_nullable_to_non_nullable
                      as String,
            translatedText: null == translatedText
                ? _value.translatedText
                : translatedText // ignore: cast_nullable_to_non_nullable
                      as String,
            sourceLanguage: null == sourceLanguage
                ? _value.sourceLanguage
                : sourceLanguage // ignore: cast_nullable_to_non_nullable
                      as String,
            targetLanguage: null == targetLanguage
                ? _value.targetLanguage
                : targetLanguage // ignore: cast_nullable_to_non_nullable
                      as String,
            profileId: null == profileId
                ? _value.profileId
                : profileId // ignore: cast_nullable_to_non_nullable
                      as String,
            providerId: null == providerId
                ? _value.providerId
                : providerId // ignore: cast_nullable_to_non_nullable
                      as String,
            modelId: null == modelId
                ? _value.modelId
                : modelId // ignore: cast_nullable_to_non_nullable
                      as String,
            hitCount: null == hitCount
                ? _value.hitCount
                : hitCount // ignore: cast_nullable_to_non_nullable
                      as int,
            qualityScore: null == qualityScore
                ? _value.qualityScore
                : qualityScore // ignore: cast_nullable_to_non_nullable
                      as double,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            lastUsedAt: freezed == lastUsedAt
                ? _value.lastUsedAt
                : lastUsedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CacheEntryImplCopyWith<$Res>
    implements $CacheEntryCopyWith<$Res> {
  factory _$$CacheEntryImplCopyWith(
    _$CacheEntryImpl value,
    $Res Function(_$CacheEntryImpl) then,
  ) = __$$CacheEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String sourceHash,
    String sourceText,
    String translatedText,
    String sourceLanguage,
    String targetLanguage,
    String profileId,
    String providerId,
    String modelId,
    int hitCount,
    double qualityScore,
    DateTime createdAt,
    DateTime? lastUsedAt,
  });
}

/// @nodoc
class __$$CacheEntryImplCopyWithImpl<$Res>
    extends _$CacheEntryCopyWithImpl<$Res, _$CacheEntryImpl>
    implements _$$CacheEntryImplCopyWith<$Res> {
  __$$CacheEntryImplCopyWithImpl(
    _$CacheEntryImpl _value,
    $Res Function(_$CacheEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CacheEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sourceHash = null,
    Object? sourceText = null,
    Object? translatedText = null,
    Object? sourceLanguage = null,
    Object? targetLanguage = null,
    Object? profileId = null,
    Object? providerId = null,
    Object? modelId = null,
    Object? hitCount = null,
    Object? qualityScore = null,
    Object? createdAt = null,
    Object? lastUsedAt = freezed,
  }) {
    return _then(
      _$CacheEntryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        sourceHash: null == sourceHash
            ? _value.sourceHash
            : sourceHash // ignore: cast_nullable_to_non_nullable
                  as String,
        sourceText: null == sourceText
            ? _value.sourceText
            : sourceText // ignore: cast_nullable_to_non_nullable
                  as String,
        translatedText: null == translatedText
            ? _value.translatedText
            : translatedText // ignore: cast_nullable_to_non_nullable
                  as String,
        sourceLanguage: null == sourceLanguage
            ? _value.sourceLanguage
            : sourceLanguage // ignore: cast_nullable_to_non_nullable
                  as String,
        targetLanguage: null == targetLanguage
            ? _value.targetLanguage
            : targetLanguage // ignore: cast_nullable_to_non_nullable
                  as String,
        profileId: null == profileId
            ? _value.profileId
            : profileId // ignore: cast_nullable_to_non_nullable
                  as String,
        providerId: null == providerId
            ? _value.providerId
            : providerId // ignore: cast_nullable_to_non_nullable
                  as String,
        modelId: null == modelId
            ? _value.modelId
            : modelId // ignore: cast_nullable_to_non_nullable
                  as String,
        hitCount: null == hitCount
            ? _value.hitCount
            : hitCount // ignore: cast_nullable_to_non_nullable
                  as int,
        qualityScore: null == qualityScore
            ? _value.qualityScore
            : qualityScore // ignore: cast_nullable_to_non_nullable
                  as double,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        lastUsedAt: freezed == lastUsedAt
            ? _value.lastUsedAt
            : lastUsedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CacheEntryImpl implements _CacheEntry {
  const _$CacheEntryImpl({
    required this.id,
    required this.sourceHash,
    required this.sourceText,
    required this.translatedText,
    required this.sourceLanguage,
    required this.targetLanguage,
    this.profileId = '',
    this.providerId = '',
    this.modelId = '',
    this.hitCount = 0,
    this.qualityScore = 0.0,
    required this.createdAt,
    this.lastUsedAt,
  });

  factory _$CacheEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CacheEntryImplFromJson(json);

  @override
  final String id;
  @override
  final String sourceHash;
  @override
  final String sourceText;
  @override
  final String translatedText;
  @override
  final String sourceLanguage;
  @override
  final String targetLanguage;
  @override
  @JsonKey()
  final String profileId;
  @override
  @JsonKey()
  final String providerId;
  @override
  @JsonKey()
  final String modelId;
  @override
  @JsonKey()
  final int hitCount;
  @override
  @JsonKey()
  final double qualityScore;
  @override
  final DateTime createdAt;
  @override
  final DateTime? lastUsedAt;

  @override
  String toString() {
    return 'CacheEntry(id: $id, sourceHash: $sourceHash, sourceText: $sourceText, translatedText: $translatedText, sourceLanguage: $sourceLanguage, targetLanguage: $targetLanguage, profileId: $profileId, providerId: $providerId, modelId: $modelId, hitCount: $hitCount, qualityScore: $qualityScore, createdAt: $createdAt, lastUsedAt: $lastUsedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CacheEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sourceHash, sourceHash) ||
                other.sourceHash == sourceHash) &&
            (identical(other.sourceText, sourceText) ||
                other.sourceText == sourceText) &&
            (identical(other.translatedText, translatedText) ||
                other.translatedText == translatedText) &&
            (identical(other.sourceLanguage, sourceLanguage) ||
                other.sourceLanguage == sourceLanguage) &&
            (identical(other.targetLanguage, targetLanguage) ||
                other.targetLanguage == targetLanguage) &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.modelId, modelId) || other.modelId == modelId) &&
            (identical(other.hitCount, hitCount) ||
                other.hitCount == hitCount) &&
            (identical(other.qualityScore, qualityScore) ||
                other.qualityScore == qualityScore) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastUsedAt, lastUsedAt) ||
                other.lastUsedAt == lastUsedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    sourceHash,
    sourceText,
    translatedText,
    sourceLanguage,
    targetLanguage,
    profileId,
    providerId,
    modelId,
    hitCount,
    qualityScore,
    createdAt,
    lastUsedAt,
  );

  /// Create a copy of CacheEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CacheEntryImplCopyWith<_$CacheEntryImpl> get copyWith =>
      __$$CacheEntryImplCopyWithImpl<_$CacheEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CacheEntryImplToJson(this);
  }
}

abstract class _CacheEntry implements CacheEntry {
  const factory _CacheEntry({
    required final String id,
    required final String sourceHash,
    required final String sourceText,
    required final String translatedText,
    required final String sourceLanguage,
    required final String targetLanguage,
    final String profileId,
    final String providerId,
    final String modelId,
    final int hitCount,
    final double qualityScore,
    required final DateTime createdAt,
    final DateTime? lastUsedAt,
  }) = _$CacheEntryImpl;

  factory _CacheEntry.fromJson(Map<String, dynamic> json) =
      _$CacheEntryImpl.fromJson;

  @override
  String get id;
  @override
  String get sourceHash;
  @override
  String get sourceText;
  @override
  String get translatedText;
  @override
  String get sourceLanguage;
  @override
  String get targetLanguage;
  @override
  String get profileId;
  @override
  String get providerId;
  @override
  String get modelId;
  @override
  int get hitCount;
  @override
  double get qualityScore;
  @override
  DateTime get createdAt;
  @override
  DateTime? get lastUsedAt;

  /// Create a copy of CacheEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CacheEntryImplCopyWith<_$CacheEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

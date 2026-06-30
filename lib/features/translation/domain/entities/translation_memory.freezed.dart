// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'translation_memory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TranslationMemoryEntry _$TranslationMemoryEntryFromJson(
  Map<String, dynamic> json,
) {
  return _TranslationMemoryEntry.fromJson(json);
}

/// @nodoc
mixin _$TranslationMemoryEntry {
  String get id => throw _privateConstructorUsedError;
  String get sourceText => throw _privateConstructorUsedError;
  String get translatedText => throw _privateConstructorUsedError;
  String get sourceLanguage => throw _privateConstructorUsedError;
  String get targetLanguage => throw _privateConstructorUsedError;
  String get profileId => throw _privateConstructorUsedError;
  String get providerId => throw _privateConstructorUsedError;
  MemoryScope get scope => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  String get seriesId => throw _privateConstructorUsedError;
  int get hitCount => throw _privateConstructorUsedError;
  double get qualityScore => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get lastUsedAt => throw _privateConstructorUsedError;
  Map<String, String> get metadata => throw _privateConstructorUsedError;

  /// Serializes this TranslationMemoryEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TranslationMemoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TranslationMemoryEntryCopyWith<TranslationMemoryEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranslationMemoryEntryCopyWith<$Res> {
  factory $TranslationMemoryEntryCopyWith(
    TranslationMemoryEntry value,
    $Res Function(TranslationMemoryEntry) then,
  ) = _$TranslationMemoryEntryCopyWithImpl<$Res, TranslationMemoryEntry>;
  @useResult
  $Res call({
    String id,
    String sourceText,
    String translatedText,
    String sourceLanguage,
    String targetLanguage,
    String profileId,
    String providerId,
    MemoryScope scope,
    String projectId,
    String seriesId,
    int hitCount,
    double qualityScore,
    DateTime createdAt,
    DateTime? lastUsedAt,
    Map<String, String> metadata,
  });
}

/// @nodoc
class _$TranslationMemoryEntryCopyWithImpl<
  $Res,
  $Val extends TranslationMemoryEntry
>
    implements $TranslationMemoryEntryCopyWith<$Res> {
  _$TranslationMemoryEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TranslationMemoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sourceText = null,
    Object? translatedText = null,
    Object? sourceLanguage = null,
    Object? targetLanguage = null,
    Object? profileId = null,
    Object? providerId = null,
    Object? scope = null,
    Object? projectId = null,
    Object? seriesId = null,
    Object? hitCount = null,
    Object? qualityScore = null,
    Object? createdAt = null,
    Object? lastUsedAt = freezed,
    Object? metadata = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
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
            scope: null == scope
                ? _value.scope
                : scope // ignore: cast_nullable_to_non_nullable
                      as MemoryScope,
            projectId: null == projectId
                ? _value.projectId
                : projectId // ignore: cast_nullable_to_non_nullable
                      as String,
            seriesId: null == seriesId
                ? _value.seriesId
                : seriesId // ignore: cast_nullable_to_non_nullable
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
            metadata: null == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TranslationMemoryEntryImplCopyWith<$Res>
    implements $TranslationMemoryEntryCopyWith<$Res> {
  factory _$$TranslationMemoryEntryImplCopyWith(
    _$TranslationMemoryEntryImpl value,
    $Res Function(_$TranslationMemoryEntryImpl) then,
  ) = __$$TranslationMemoryEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String sourceText,
    String translatedText,
    String sourceLanguage,
    String targetLanguage,
    String profileId,
    String providerId,
    MemoryScope scope,
    String projectId,
    String seriesId,
    int hitCount,
    double qualityScore,
    DateTime createdAt,
    DateTime? lastUsedAt,
    Map<String, String> metadata,
  });
}

/// @nodoc
class __$$TranslationMemoryEntryImplCopyWithImpl<$Res>
    extends
        _$TranslationMemoryEntryCopyWithImpl<$Res, _$TranslationMemoryEntryImpl>
    implements _$$TranslationMemoryEntryImplCopyWith<$Res> {
  __$$TranslationMemoryEntryImplCopyWithImpl(
    _$TranslationMemoryEntryImpl _value,
    $Res Function(_$TranslationMemoryEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TranslationMemoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sourceText = null,
    Object? translatedText = null,
    Object? sourceLanguage = null,
    Object? targetLanguage = null,
    Object? profileId = null,
    Object? providerId = null,
    Object? scope = null,
    Object? projectId = null,
    Object? seriesId = null,
    Object? hitCount = null,
    Object? qualityScore = null,
    Object? createdAt = null,
    Object? lastUsedAt = freezed,
    Object? metadata = null,
  }) {
    return _then(
      _$TranslationMemoryEntryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
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
        scope: null == scope
            ? _value.scope
            : scope // ignore: cast_nullable_to_non_nullable
                  as MemoryScope,
        projectId: null == projectId
            ? _value.projectId
            : projectId // ignore: cast_nullable_to_non_nullable
                  as String,
        seriesId: null == seriesId
            ? _value.seriesId
            : seriesId // ignore: cast_nullable_to_non_nullable
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
        metadata: null == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TranslationMemoryEntryImpl implements _TranslationMemoryEntry {
  const _$TranslationMemoryEntryImpl({
    required this.id,
    required this.sourceText,
    required this.translatedText,
    required this.sourceLanguage,
    required this.targetLanguage,
    this.profileId = '',
    this.providerId = '',
    this.scope = MemoryScope.project,
    this.projectId = '',
    this.seriesId = '',
    this.hitCount = 0,
    this.qualityScore = 0.0,
    required this.createdAt,
    this.lastUsedAt,
    final Map<String, String> metadata = const {},
  }) : _metadata = metadata;

  factory _$TranslationMemoryEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TranslationMemoryEntryImplFromJson(json);

  @override
  final String id;
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
  final MemoryScope scope;
  @override
  @JsonKey()
  final String projectId;
  @override
  @JsonKey()
  final String seriesId;
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
  final Map<String, String> _metadata;
  @override
  @JsonKey()
  Map<String, String> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'TranslationMemoryEntry(id: $id, sourceText: $sourceText, translatedText: $translatedText, sourceLanguage: $sourceLanguage, targetLanguage: $targetLanguage, profileId: $profileId, providerId: $providerId, scope: $scope, projectId: $projectId, seriesId: $seriesId, hitCount: $hitCount, qualityScore: $qualityScore, createdAt: $createdAt, lastUsedAt: $lastUsedAt, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranslationMemoryEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
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
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.seriesId, seriesId) ||
                other.seriesId == seriesId) &&
            (identical(other.hitCount, hitCount) ||
                other.hitCount == hitCount) &&
            (identical(other.qualityScore, qualityScore) ||
                other.qualityScore == qualityScore) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastUsedAt, lastUsedAt) ||
                other.lastUsedAt == lastUsedAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    sourceText,
    translatedText,
    sourceLanguage,
    targetLanguage,
    profileId,
    providerId,
    scope,
    projectId,
    seriesId,
    hitCount,
    qualityScore,
    createdAt,
    lastUsedAt,
    const DeepCollectionEquality().hash(_metadata),
  );

  /// Create a copy of TranslationMemoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranslationMemoryEntryImplCopyWith<_$TranslationMemoryEntryImpl>
  get copyWith =>
      __$$TranslationMemoryEntryImplCopyWithImpl<_$TranslationMemoryEntryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TranslationMemoryEntryImplToJson(this);
  }
}

abstract class _TranslationMemoryEntry implements TranslationMemoryEntry {
  const factory _TranslationMemoryEntry({
    required final String id,
    required final String sourceText,
    required final String translatedText,
    required final String sourceLanguage,
    required final String targetLanguage,
    final String profileId,
    final String providerId,
    final MemoryScope scope,
    final String projectId,
    final String seriesId,
    final int hitCount,
    final double qualityScore,
    required final DateTime createdAt,
    final DateTime? lastUsedAt,
    final Map<String, String> metadata,
  }) = _$TranslationMemoryEntryImpl;

  factory _TranslationMemoryEntry.fromJson(Map<String, dynamic> json) =
      _$TranslationMemoryEntryImpl.fromJson;

  @override
  String get id;
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
  MemoryScope get scope;
  @override
  String get projectId;
  @override
  String get seriesId;
  @override
  int get hitCount;
  @override
  double get qualityScore;
  @override
  DateTime get createdAt;
  @override
  DateTime? get lastUsedAt;
  @override
  Map<String, String> get metadata;

  /// Create a copy of TranslationMemoryEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranslationMemoryEntryImplCopyWith<_$TranslationMemoryEntryImpl>
  get copyWith => throw _privateConstructorUsedError;
}

TranslationMemory _$TranslationMemoryFromJson(Map<String, dynamic> json) {
  return _TranslationMemory.fromJson(json);
}

/// @nodoc
mixin _$TranslationMemory {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  MemoryScope get scope => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  String get seriesId => throw _privateConstructorUsedError;
  List<TranslationMemoryEntry> get entries =>
      throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this TranslationMemory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TranslationMemory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TranslationMemoryCopyWith<TranslationMemory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranslationMemoryCopyWith<$Res> {
  factory $TranslationMemoryCopyWith(
    TranslationMemory value,
    $Res Function(TranslationMemory) then,
  ) = _$TranslationMemoryCopyWithImpl<$Res, TranslationMemory>;
  @useResult
  $Res call({
    String id,
    String name,
    MemoryScope scope,
    String projectId,
    String seriesId,
    List<TranslationMemoryEntry> entries,
    DateTime createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$TranslationMemoryCopyWithImpl<$Res, $Val extends TranslationMemory>
    implements $TranslationMemoryCopyWith<$Res> {
  _$TranslationMemoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TranslationMemory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? scope = null,
    Object? projectId = null,
    Object? seriesId = null,
    Object? entries = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
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
            scope: null == scope
                ? _value.scope
                : scope // ignore: cast_nullable_to_non_nullable
                      as MemoryScope,
            projectId: null == projectId
                ? _value.projectId
                : projectId // ignore: cast_nullable_to_non_nullable
                      as String,
            seriesId: null == seriesId
                ? _value.seriesId
                : seriesId // ignore: cast_nullable_to_non_nullable
                      as String,
            entries: null == entries
                ? _value.entries
                : entries // ignore: cast_nullable_to_non_nullable
                      as List<TranslationMemoryEntry>,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TranslationMemoryImplCopyWith<$Res>
    implements $TranslationMemoryCopyWith<$Res> {
  factory _$$TranslationMemoryImplCopyWith(
    _$TranslationMemoryImpl value,
    $Res Function(_$TranslationMemoryImpl) then,
  ) = __$$TranslationMemoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    MemoryScope scope,
    String projectId,
    String seriesId,
    List<TranslationMemoryEntry> entries,
    DateTime createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$TranslationMemoryImplCopyWithImpl<$Res>
    extends _$TranslationMemoryCopyWithImpl<$Res, _$TranslationMemoryImpl>
    implements _$$TranslationMemoryImplCopyWith<$Res> {
  __$$TranslationMemoryImplCopyWithImpl(
    _$TranslationMemoryImpl _value,
    $Res Function(_$TranslationMemoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TranslationMemory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? scope = null,
    Object? projectId = null,
    Object? seriesId = null,
    Object? entries = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$TranslationMemoryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        scope: null == scope
            ? _value.scope
            : scope // ignore: cast_nullable_to_non_nullable
                  as MemoryScope,
        projectId: null == projectId
            ? _value.projectId
            : projectId // ignore: cast_nullable_to_non_nullable
                  as String,
        seriesId: null == seriesId
            ? _value.seriesId
            : seriesId // ignore: cast_nullable_to_non_nullable
                  as String,
        entries: null == entries
            ? _value._entries
            : entries // ignore: cast_nullable_to_non_nullable
                  as List<TranslationMemoryEntry>,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TranslationMemoryImpl implements _TranslationMemory {
  const _$TranslationMemoryImpl({
    required this.id,
    required this.name,
    this.scope = MemoryScope.project,
    this.projectId = '',
    this.seriesId = '',
    final List<TranslationMemoryEntry> entries = const [],
    required this.createdAt,
    this.updatedAt,
  }) : _entries = entries;

  factory _$TranslationMemoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TranslationMemoryImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey()
  final MemoryScope scope;
  @override
  @JsonKey()
  final String projectId;
  @override
  @JsonKey()
  final String seriesId;
  final List<TranslationMemoryEntry> _entries;
  @override
  @JsonKey()
  List<TranslationMemoryEntry> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'TranslationMemory(id: $id, name: $name, scope: $scope, projectId: $projectId, seriesId: $seriesId, entries: $entries, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranslationMemoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.seriesId, seriesId) ||
                other.seriesId == seriesId) &&
            const DeepCollectionEquality().equals(other._entries, _entries) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    scope,
    projectId,
    seriesId,
    const DeepCollectionEquality().hash(_entries),
    createdAt,
    updatedAt,
  );

  /// Create a copy of TranslationMemory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranslationMemoryImplCopyWith<_$TranslationMemoryImpl> get copyWith =>
      __$$TranslationMemoryImplCopyWithImpl<_$TranslationMemoryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TranslationMemoryImplToJson(this);
  }
}

abstract class _TranslationMemory implements TranslationMemory {
  const factory _TranslationMemory({
    required final String id,
    required final String name,
    final MemoryScope scope,
    final String projectId,
    final String seriesId,
    final List<TranslationMemoryEntry> entries,
    required final DateTime createdAt,
    final DateTime? updatedAt,
  }) = _$TranslationMemoryImpl;

  factory _TranslationMemory.fromJson(Map<String, dynamic> json) =
      _$TranslationMemoryImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  MemoryScope get scope;
  @override
  String get projectId;
  @override
  String get seriesId;
  @override
  List<TranslationMemoryEntry> get entries;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of TranslationMemory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranslationMemoryImplCopyWith<_$TranslationMemoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

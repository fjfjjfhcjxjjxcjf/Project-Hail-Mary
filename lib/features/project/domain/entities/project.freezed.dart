// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TranslationProject _$TranslationProjectFromJson(Map<String, dynamic> json) {
  return _TranslationProject.fromJson(json);
}

/// @nodoc
mixin _$TranslationProject {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get sourceLanguage => throw _privateConstructorUsedError;
  String get targetLanguage => throw _privateConstructorUsedError;
  String get profileId => throw _privateConstructorUsedError;
  ProjectStatus get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  List<String> get documentIds => throw _privateConstructorUsedError;
  List<String> get glossaryIds => throw _privateConstructorUsedError;
  String get defaultProviderId =>
      throw _privateConstructorUsedError; // Memory fields
  List<KnownEntity> get knownEntities => throw _privateConstructorUsedError;
  List<String> get translationMemoryIds => throw _privateConstructorUsedError;
  Map<String, String> get stylePreferences =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;

  /// Serializes this TranslationProject to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TranslationProject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TranslationProjectCopyWith<TranslationProject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranslationProjectCopyWith<$Res> {
  factory $TranslationProjectCopyWith(
    TranslationProject value,
    $Res Function(TranslationProject) then,
  ) = _$TranslationProjectCopyWithImpl<$Res, TranslationProject>;
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    String sourceLanguage,
    String targetLanguage,
    String profileId,
    ProjectStatus status,
    DateTime createdAt,
    DateTime? updatedAt,
    List<String> documentIds,
    List<String> glossaryIds,
    String defaultProviderId,
    List<KnownEntity> knownEntities,
    List<String> translationMemoryIds,
    Map<String, String> stylePreferences,
    Map<String, dynamic> metadata,
  });
}

/// @nodoc
class _$TranslationProjectCopyWithImpl<$Res, $Val extends TranslationProject>
    implements $TranslationProjectCopyWith<$Res> {
  _$TranslationProjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TranslationProject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? sourceLanguage = null,
    Object? targetLanguage = null,
    Object? profileId = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? documentIds = null,
    Object? glossaryIds = null,
    Object? defaultProviderId = null,
    Object? knownEntities = null,
    Object? translationMemoryIds = null,
    Object? stylePreferences = null,
    Object? metadata = null,
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
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
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
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as ProjectStatus,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            documentIds: null == documentIds
                ? _value.documentIds
                : documentIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            glossaryIds: null == glossaryIds
                ? _value.glossaryIds
                : glossaryIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            defaultProviderId: null == defaultProviderId
                ? _value.defaultProviderId
                : defaultProviderId // ignore: cast_nullable_to_non_nullable
                      as String,
            knownEntities: null == knownEntities
                ? _value.knownEntities
                : knownEntities // ignore: cast_nullable_to_non_nullable
                      as List<KnownEntity>,
            translationMemoryIds: null == translationMemoryIds
                ? _value.translationMemoryIds
                : translationMemoryIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            stylePreferences: null == stylePreferences
                ? _value.stylePreferences
                : stylePreferences // ignore: cast_nullable_to_non_nullable
                      as Map<String, String>,
            metadata: null == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TranslationProjectImplCopyWith<$Res>
    implements $TranslationProjectCopyWith<$Res> {
  factory _$$TranslationProjectImplCopyWith(
    _$TranslationProjectImpl value,
    $Res Function(_$TranslationProjectImpl) then,
  ) = __$$TranslationProjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    String sourceLanguage,
    String targetLanguage,
    String profileId,
    ProjectStatus status,
    DateTime createdAt,
    DateTime? updatedAt,
    List<String> documentIds,
    List<String> glossaryIds,
    String defaultProviderId,
    List<KnownEntity> knownEntities,
    List<String> translationMemoryIds,
    Map<String, String> stylePreferences,
    Map<String, dynamic> metadata,
  });
}

/// @nodoc
class __$$TranslationProjectImplCopyWithImpl<$Res>
    extends _$TranslationProjectCopyWithImpl<$Res, _$TranslationProjectImpl>
    implements _$$TranslationProjectImplCopyWith<$Res> {
  __$$TranslationProjectImplCopyWithImpl(
    _$TranslationProjectImpl _value,
    $Res Function(_$TranslationProjectImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TranslationProject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? sourceLanguage = null,
    Object? targetLanguage = null,
    Object? profileId = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? documentIds = null,
    Object? glossaryIds = null,
    Object? defaultProviderId = null,
    Object? knownEntities = null,
    Object? translationMemoryIds = null,
    Object? stylePreferences = null,
    Object? metadata = null,
  }) {
    return _then(
      _$TranslationProjectImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
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
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ProjectStatus,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        documentIds: null == documentIds
            ? _value._documentIds
            : documentIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        glossaryIds: null == glossaryIds
            ? _value._glossaryIds
            : glossaryIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        defaultProviderId: null == defaultProviderId
            ? _value.defaultProviderId
            : defaultProviderId // ignore: cast_nullable_to_non_nullable
                  as String,
        knownEntities: null == knownEntities
            ? _value._knownEntities
            : knownEntities // ignore: cast_nullable_to_non_nullable
                  as List<KnownEntity>,
        translationMemoryIds: null == translationMemoryIds
            ? _value._translationMemoryIds
            : translationMemoryIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        stylePreferences: null == stylePreferences
            ? _value._stylePreferences
            : stylePreferences // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        metadata: null == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TranslationProjectImpl implements _TranslationProject {
  const _$TranslationProjectImpl({
    required this.id,
    required this.name,
    this.description = '',
    required this.sourceLanguage,
    required this.targetLanguage,
    this.profileId = 'balanced',
    this.status = ProjectStatus.active,
    required this.createdAt,
    this.updatedAt,
    final List<String> documentIds = const [],
    final List<String> glossaryIds = const [],
    this.defaultProviderId = '',
    final List<KnownEntity> knownEntities = const [],
    final List<String> translationMemoryIds = const [],
    final Map<String, String> stylePreferences = const {},
    final Map<String, dynamic> metadata = const {},
  }) : _documentIds = documentIds,
       _glossaryIds = glossaryIds,
       _knownEntities = knownEntities,
       _translationMemoryIds = translationMemoryIds,
       _stylePreferences = stylePreferences,
       _metadata = metadata;

  factory _$TranslationProjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$TranslationProjectImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey()
  final String description;
  @override
  final String sourceLanguage;
  @override
  final String targetLanguage;
  @override
  @JsonKey()
  final String profileId;
  @override
  @JsonKey()
  final ProjectStatus status;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;
  final List<String> _documentIds;
  @override
  @JsonKey()
  List<String> get documentIds {
    if (_documentIds is EqualUnmodifiableListView) return _documentIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documentIds);
  }

  final List<String> _glossaryIds;
  @override
  @JsonKey()
  List<String> get glossaryIds {
    if (_glossaryIds is EqualUnmodifiableListView) return _glossaryIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_glossaryIds);
  }

  @override
  @JsonKey()
  final String defaultProviderId;
  // Memory fields
  final List<KnownEntity> _knownEntities;
  // Memory fields
  @override
  @JsonKey()
  List<KnownEntity> get knownEntities {
    if (_knownEntities is EqualUnmodifiableListView) return _knownEntities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_knownEntities);
  }

  final List<String> _translationMemoryIds;
  @override
  @JsonKey()
  List<String> get translationMemoryIds {
    if (_translationMemoryIds is EqualUnmodifiableListView)
      return _translationMemoryIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_translationMemoryIds);
  }

  final Map<String, String> _stylePreferences;
  @override
  @JsonKey()
  Map<String, String> get stylePreferences {
    if (_stylePreferences is EqualUnmodifiableMapView) return _stylePreferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_stylePreferences);
  }

  final Map<String, dynamic> _metadata;
  @override
  @JsonKey()
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  String toString() {
    return 'TranslationProject(id: $id, name: $name, description: $description, sourceLanguage: $sourceLanguage, targetLanguage: $targetLanguage, profileId: $profileId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, documentIds: $documentIds, glossaryIds: $glossaryIds, defaultProviderId: $defaultProviderId, knownEntities: $knownEntities, translationMemoryIds: $translationMemoryIds, stylePreferences: $stylePreferences, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranslationProjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.sourceLanguage, sourceLanguage) ||
                other.sourceLanguage == sourceLanguage) &&
            (identical(other.targetLanguage, targetLanguage) ||
                other.targetLanguage == targetLanguage) &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(
              other._documentIds,
              _documentIds,
            ) &&
            const DeepCollectionEquality().equals(
              other._glossaryIds,
              _glossaryIds,
            ) &&
            (identical(other.defaultProviderId, defaultProviderId) ||
                other.defaultProviderId == defaultProviderId) &&
            const DeepCollectionEquality().equals(
              other._knownEntities,
              _knownEntities,
            ) &&
            const DeepCollectionEquality().equals(
              other._translationMemoryIds,
              _translationMemoryIds,
            ) &&
            const DeepCollectionEquality().equals(
              other._stylePreferences,
              _stylePreferences,
            ) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    sourceLanguage,
    targetLanguage,
    profileId,
    status,
    createdAt,
    updatedAt,
    const DeepCollectionEquality().hash(_documentIds),
    const DeepCollectionEquality().hash(_glossaryIds),
    defaultProviderId,
    const DeepCollectionEquality().hash(_knownEntities),
    const DeepCollectionEquality().hash(_translationMemoryIds),
    const DeepCollectionEquality().hash(_stylePreferences),
    const DeepCollectionEquality().hash(_metadata),
  );

  /// Create a copy of TranslationProject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranslationProjectImplCopyWith<_$TranslationProjectImpl> get copyWith =>
      __$$TranslationProjectImplCopyWithImpl<_$TranslationProjectImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TranslationProjectImplToJson(this);
  }
}

abstract class _TranslationProject implements TranslationProject {
  const factory _TranslationProject({
    required final String id,
    required final String name,
    final String description,
    required final String sourceLanguage,
    required final String targetLanguage,
    final String profileId,
    final ProjectStatus status,
    required final DateTime createdAt,
    final DateTime? updatedAt,
    final List<String> documentIds,
    final List<String> glossaryIds,
    final String defaultProviderId,
    final List<KnownEntity> knownEntities,
    final List<String> translationMemoryIds,
    final Map<String, String> stylePreferences,
    final Map<String, dynamic> metadata,
  }) = _$TranslationProjectImpl;

  factory _TranslationProject.fromJson(Map<String, dynamic> json) =
      _$TranslationProjectImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get sourceLanguage;
  @override
  String get targetLanguage;
  @override
  String get profileId;
  @override
  ProjectStatus get status;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  List<String> get documentIds;
  @override
  List<String> get glossaryIds;
  @override
  String get defaultProviderId; // Memory fields
  @override
  List<KnownEntity> get knownEntities;
  @override
  List<String> get translationMemoryIds;
  @override
  Map<String, String> get stylePreferences;
  @override
  Map<String, dynamic> get metadata;

  /// Create a copy of TranslationProject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranslationProjectImplCopyWith<_$TranslationProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KnownEntity _$KnownEntityFromJson(Map<String, dynamic> json) {
  return _KnownEntity.fromJson(json);
}

/// @nodoc
mixin _$KnownEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  EntityType get type => throw _privateConstructorUsedError;
  String get translatedName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get translationPolicy =>
      throw _privateConstructorUsedError; // always, never, custom
  int get occurrenceCount => throw _privateConstructorUsedError;
  List<String> get aliases => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this KnownEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of KnownEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $KnownEntityCopyWith<KnownEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KnownEntityCopyWith<$Res> {
  factory $KnownEntityCopyWith(
    KnownEntity value,
    $Res Function(KnownEntity) then,
  ) = _$KnownEntityCopyWithImpl<$Res, KnownEntity>;
  @useResult
  $Res call({
    String id,
    String name,
    EntityType type,
    String translatedName,
    String description,
    String translationPolicy,
    int occurrenceCount,
    List<String> aliases,
    DateTime createdAt,
  });
}

/// @nodoc
class _$KnownEntityCopyWithImpl<$Res, $Val extends KnownEntity>
    implements $KnownEntityCopyWith<$Res> {
  _$KnownEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of KnownEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? translatedName = null,
    Object? description = null,
    Object? translationPolicy = null,
    Object? occurrenceCount = null,
    Object? aliases = null,
    Object? createdAt = null,
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
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as EntityType,
            translatedName: null == translatedName
                ? _value.translatedName
                : translatedName // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            translationPolicy: null == translationPolicy
                ? _value.translationPolicy
                : translationPolicy // ignore: cast_nullable_to_non_nullable
                      as String,
            occurrenceCount: null == occurrenceCount
                ? _value.occurrenceCount
                : occurrenceCount // ignore: cast_nullable_to_non_nullable
                      as int,
            aliases: null == aliases
                ? _value.aliases
                : aliases // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$KnownEntityImplCopyWith<$Res>
    implements $KnownEntityCopyWith<$Res> {
  factory _$$KnownEntityImplCopyWith(
    _$KnownEntityImpl value,
    $Res Function(_$KnownEntityImpl) then,
  ) = __$$KnownEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    EntityType type,
    String translatedName,
    String description,
    String translationPolicy,
    int occurrenceCount,
    List<String> aliases,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$KnownEntityImplCopyWithImpl<$Res>
    extends _$KnownEntityCopyWithImpl<$Res, _$KnownEntityImpl>
    implements _$$KnownEntityImplCopyWith<$Res> {
  __$$KnownEntityImplCopyWithImpl(
    _$KnownEntityImpl _value,
    $Res Function(_$KnownEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of KnownEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? translatedName = null,
    Object? description = null,
    Object? translationPolicy = null,
    Object? occurrenceCount = null,
    Object? aliases = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$KnownEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as EntityType,
        translatedName: null == translatedName
            ? _value.translatedName
            : translatedName // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        translationPolicy: null == translationPolicy
            ? _value.translationPolicy
            : translationPolicy // ignore: cast_nullable_to_non_nullable
                  as String,
        occurrenceCount: null == occurrenceCount
            ? _value.occurrenceCount
            : occurrenceCount // ignore: cast_nullable_to_non_nullable
                  as int,
        aliases: null == aliases
            ? _value._aliases
            : aliases // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$KnownEntityImpl implements _KnownEntity {
  const _$KnownEntityImpl({
    required this.id,
    required this.name,
    required this.type,
    this.translatedName = '',
    this.description = '',
    this.translationPolicy = 'always',
    this.occurrenceCount = 0,
    final List<String> aliases = const [],
    required this.createdAt,
  }) : _aliases = aliases;

  factory _$KnownEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$KnownEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final EntityType type;
  @override
  @JsonKey()
  final String translatedName;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String translationPolicy;
  // always, never, custom
  @override
  @JsonKey()
  final int occurrenceCount;
  final List<String> _aliases;
  @override
  @JsonKey()
  List<String> get aliases {
    if (_aliases is EqualUnmodifiableListView) return _aliases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_aliases);
  }

  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'KnownEntity(id: $id, name: $name, type: $type, translatedName: $translatedName, description: $description, translationPolicy: $translationPolicy, occurrenceCount: $occurrenceCount, aliases: $aliases, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KnownEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.translatedName, translatedName) ||
                other.translatedName == translatedName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.translationPolicy, translationPolicy) ||
                other.translationPolicy == translationPolicy) &&
            (identical(other.occurrenceCount, occurrenceCount) ||
                other.occurrenceCount == occurrenceCount) &&
            const DeepCollectionEquality().equals(other._aliases, _aliases) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    type,
    translatedName,
    description,
    translationPolicy,
    occurrenceCount,
    const DeepCollectionEquality().hash(_aliases),
    createdAt,
  );

  /// Create a copy of KnownEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KnownEntityImplCopyWith<_$KnownEntityImpl> get copyWith =>
      __$$KnownEntityImplCopyWithImpl<_$KnownEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KnownEntityImplToJson(this);
  }
}

abstract class _KnownEntity implements KnownEntity {
  const factory _KnownEntity({
    required final String id,
    required final String name,
    required final EntityType type,
    final String translatedName,
    final String description,
    final String translationPolicy,
    final int occurrenceCount,
    final List<String> aliases,
    required final DateTime createdAt,
  }) = _$KnownEntityImpl;

  factory _KnownEntity.fromJson(Map<String, dynamic> json) =
      _$KnownEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  EntityType get type;
  @override
  String get translatedName;
  @override
  String get description;
  @override
  String get translationPolicy; // always, never, custom
  @override
  int get occurrenceCount;
  @override
  List<String> get aliases;
  @override
  DateTime get createdAt;

  /// Create a copy of KnownEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KnownEntityImplCopyWith<_$KnownEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

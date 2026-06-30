// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plugin_manifest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PluginManifest _$PluginManifestFromJson(Map<String, dynamic> json) {
  return _PluginManifest.fromJson(json);
}

/// @nodoc
mixin _$PluginManifest {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  PluginType get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  PluginStatus get status => throw _privateConstructorUsedError;
  List<String> get supportedFormats => throw _privateConstructorUsedError;
  Map<String, dynamic> get config => throw _privateConstructorUsedError;
  Map<String, String> get configSchema => throw _privateConstructorUsedError;
  DateTime get installedAt => throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this PluginManifest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PluginManifest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PluginManifestCopyWith<PluginManifest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PluginManifestCopyWith<$Res> {
  factory $PluginManifestCopyWith(
    PluginManifest value,
    $Res Function(PluginManifest) then,
  ) = _$PluginManifestCopyWithImpl<$Res, PluginManifest>;
  @useResult
  $Res call({
    String id,
    String name,
    String version,
    PluginType type,
    String description,
    String author,
    PluginStatus status,
    List<String> supportedFormats,
    Map<String, dynamic> config,
    Map<String, String> configSchema,
    DateTime installedAt,
    DateTime? lastUpdated,
  });
}

/// @nodoc
class _$PluginManifestCopyWithImpl<$Res, $Val extends PluginManifest>
    implements $PluginManifestCopyWith<$Res> {
  _$PluginManifestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PluginManifest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? version = null,
    Object? type = null,
    Object? description = null,
    Object? author = null,
    Object? status = null,
    Object? supportedFormats = null,
    Object? config = null,
    Object? configSchema = null,
    Object? installedAt = null,
    Object? lastUpdated = freezed,
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
            version: null == version
                ? _value.version
                : version // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as PluginType,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            author: null == author
                ? _value.author
                : author // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as PluginStatus,
            supportedFormats: null == supportedFormats
                ? _value.supportedFormats
                : supportedFormats // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            config: null == config
                ? _value.config
                : config // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            configSchema: null == configSchema
                ? _value.configSchema
                : configSchema // ignore: cast_nullable_to_non_nullable
                      as Map<String, String>,
            installedAt: null == installedAt
                ? _value.installedAt
                : installedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            lastUpdated: freezed == lastUpdated
                ? _value.lastUpdated
                : lastUpdated // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PluginManifestImplCopyWith<$Res>
    implements $PluginManifestCopyWith<$Res> {
  factory _$$PluginManifestImplCopyWith(
    _$PluginManifestImpl value,
    $Res Function(_$PluginManifestImpl) then,
  ) = __$$PluginManifestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String version,
    PluginType type,
    String description,
    String author,
    PluginStatus status,
    List<String> supportedFormats,
    Map<String, dynamic> config,
    Map<String, String> configSchema,
    DateTime installedAt,
    DateTime? lastUpdated,
  });
}

/// @nodoc
class __$$PluginManifestImplCopyWithImpl<$Res>
    extends _$PluginManifestCopyWithImpl<$Res, _$PluginManifestImpl>
    implements _$$PluginManifestImplCopyWith<$Res> {
  __$$PluginManifestImplCopyWithImpl(
    _$PluginManifestImpl _value,
    $Res Function(_$PluginManifestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PluginManifest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? version = null,
    Object? type = null,
    Object? description = null,
    Object? author = null,
    Object? status = null,
    Object? supportedFormats = null,
    Object? config = null,
    Object? configSchema = null,
    Object? installedAt = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(
      _$PluginManifestImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        version: null == version
            ? _value.version
            : version // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as PluginType,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        author: null == author
            ? _value.author
            : author // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as PluginStatus,
        supportedFormats: null == supportedFormats
            ? _value._supportedFormats
            : supportedFormats // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        config: null == config
            ? _value._config
            : config // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        configSchema: null == configSchema
            ? _value._configSchema
            : configSchema // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        installedAt: null == installedAt
            ? _value.installedAt
            : installedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        lastUpdated: freezed == lastUpdated
            ? _value.lastUpdated
            : lastUpdated // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PluginManifestImpl implements _PluginManifest {
  const _$PluginManifestImpl({
    required this.id,
    required this.name,
    required this.version,
    required this.type,
    this.description = '',
    this.author = '',
    this.status = PluginStatus.installed,
    final List<String> supportedFormats = const [],
    final Map<String, dynamic> config = const {},
    final Map<String, String> configSchema = const {},
    required this.installedAt,
    this.lastUpdated,
  }) : _supportedFormats = supportedFormats,
       _config = config,
       _configSchema = configSchema;

  factory _$PluginManifestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PluginManifestImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String version;
  @override
  final PluginType type;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String author;
  @override
  @JsonKey()
  final PluginStatus status;
  final List<String> _supportedFormats;
  @override
  @JsonKey()
  List<String> get supportedFormats {
    if (_supportedFormats is EqualUnmodifiableListView)
      return _supportedFormats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_supportedFormats);
  }

  final Map<String, dynamic> _config;
  @override
  @JsonKey()
  Map<String, dynamic> get config {
    if (_config is EqualUnmodifiableMapView) return _config;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_config);
  }

  final Map<String, String> _configSchema;
  @override
  @JsonKey()
  Map<String, String> get configSchema {
    if (_configSchema is EqualUnmodifiableMapView) return _configSchema;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_configSchema);
  }

  @override
  final DateTime installedAt;
  @override
  final DateTime? lastUpdated;

  @override
  String toString() {
    return 'PluginManifest(id: $id, name: $name, version: $version, type: $type, description: $description, author: $author, status: $status, supportedFormats: $supportedFormats, config: $config, configSchema: $configSchema, installedAt: $installedAt, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PluginManifestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(
              other._supportedFormats,
              _supportedFormats,
            ) &&
            const DeepCollectionEquality().equals(other._config, _config) &&
            const DeepCollectionEquality().equals(
              other._configSchema,
              _configSchema,
            ) &&
            (identical(other.installedAt, installedAt) ||
                other.installedAt == installedAt) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    version,
    type,
    description,
    author,
    status,
    const DeepCollectionEquality().hash(_supportedFormats),
    const DeepCollectionEquality().hash(_config),
    const DeepCollectionEquality().hash(_configSchema),
    installedAt,
    lastUpdated,
  );

  /// Create a copy of PluginManifest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PluginManifestImplCopyWith<_$PluginManifestImpl> get copyWith =>
      __$$PluginManifestImplCopyWithImpl<_$PluginManifestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PluginManifestImplToJson(this);
  }
}

abstract class _PluginManifest implements PluginManifest {
  const factory _PluginManifest({
    required final String id,
    required final String name,
    required final String version,
    required final PluginType type,
    final String description,
    final String author,
    final PluginStatus status,
    final List<String> supportedFormats,
    final Map<String, dynamic> config,
    final Map<String, String> configSchema,
    required final DateTime installedAt,
    final DateTime? lastUpdated,
  }) = _$PluginManifestImpl;

  factory _PluginManifest.fromJson(Map<String, dynamic> json) =
      _$PluginManifestImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get version;
  @override
  PluginType get type;
  @override
  String get description;
  @override
  String get author;
  @override
  PluginStatus get status;
  @override
  List<String> get supportedFormats;
  @override
  Map<String, dynamic> get config;
  @override
  Map<String, String> get configSchema;
  @override
  DateTime get installedAt;
  @override
  DateTime? get lastUpdated;

  /// Create a copy of PluginManifest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PluginManifestImplCopyWith<_$PluginManifestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

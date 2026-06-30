// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prompt_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PromptTemplate _$PromptTemplateFromJson(Map<String, dynamic> json) {
  return _PromptTemplate.fromJson(json);
}

/// @nodoc
mixin _$PromptTemplate {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get systemPrompt => throw _privateConstructorUsedError;
  String get userPromptTemplate => throw _privateConstructorUsedError;
  String get profileId => throw _privateConstructorUsedError;
  bool get isBuiltIn => throw _privateConstructorUsedError;
  double get temperature => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PromptTemplate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PromptTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromptTemplateCopyWith<PromptTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromptTemplateCopyWith<$Res> {
  factory $PromptTemplateCopyWith(
    PromptTemplate value,
    $Res Function(PromptTemplate) then,
  ) = _$PromptTemplateCopyWithImpl<$Res, PromptTemplate>;
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    String systemPrompt,
    String userPromptTemplate,
    String profileId,
    bool isBuiltIn,
    double temperature,
    String category,
    List<String> tags,
    DateTime createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$PromptTemplateCopyWithImpl<$Res, $Val extends PromptTemplate>
    implements $PromptTemplateCopyWith<$Res> {
  _$PromptTemplateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PromptTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? systemPrompt = null,
    Object? userPromptTemplate = null,
    Object? profileId = null,
    Object? isBuiltIn = null,
    Object? temperature = null,
    Object? category = null,
    Object? tags = null,
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
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            systemPrompt: null == systemPrompt
                ? _value.systemPrompt
                : systemPrompt // ignore: cast_nullable_to_non_nullable
                      as String,
            userPromptTemplate: null == userPromptTemplate
                ? _value.userPromptTemplate
                : userPromptTemplate // ignore: cast_nullable_to_non_nullable
                      as String,
            profileId: null == profileId
                ? _value.profileId
                : profileId // ignore: cast_nullable_to_non_nullable
                      as String,
            isBuiltIn: null == isBuiltIn
                ? _value.isBuiltIn
                : isBuiltIn // ignore: cast_nullable_to_non_nullable
                      as bool,
            temperature: null == temperature
                ? _value.temperature
                : temperature // ignore: cast_nullable_to_non_nullable
                      as double,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
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
abstract class _$$PromptTemplateImplCopyWith<$Res>
    implements $PromptTemplateCopyWith<$Res> {
  factory _$$PromptTemplateImplCopyWith(
    _$PromptTemplateImpl value,
    $Res Function(_$PromptTemplateImpl) then,
  ) = __$$PromptTemplateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    String systemPrompt,
    String userPromptTemplate,
    String profileId,
    bool isBuiltIn,
    double temperature,
    String category,
    List<String> tags,
    DateTime createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$PromptTemplateImplCopyWithImpl<$Res>
    extends _$PromptTemplateCopyWithImpl<$Res, _$PromptTemplateImpl>
    implements _$$PromptTemplateImplCopyWith<$Res> {
  __$$PromptTemplateImplCopyWithImpl(
    _$PromptTemplateImpl _value,
    $Res Function(_$PromptTemplateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PromptTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? systemPrompt = null,
    Object? userPromptTemplate = null,
    Object? profileId = null,
    Object? isBuiltIn = null,
    Object? temperature = null,
    Object? category = null,
    Object? tags = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$PromptTemplateImpl(
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
        systemPrompt: null == systemPrompt
            ? _value.systemPrompt
            : systemPrompt // ignore: cast_nullable_to_non_nullable
                  as String,
        userPromptTemplate: null == userPromptTemplate
            ? _value.userPromptTemplate
            : userPromptTemplate // ignore: cast_nullable_to_non_nullable
                  as String,
        profileId: null == profileId
            ? _value.profileId
            : profileId // ignore: cast_nullable_to_non_nullable
                  as String,
        isBuiltIn: null == isBuiltIn
            ? _value.isBuiltIn
            : isBuiltIn // ignore: cast_nullable_to_non_nullable
                  as bool,
        temperature: null == temperature
            ? _value.temperature
            : temperature // ignore: cast_nullable_to_non_nullable
                  as double,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
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
class _$PromptTemplateImpl implements _PromptTemplate {
  const _$PromptTemplateImpl({
    required this.id,
    required this.name,
    this.description = '',
    required this.systemPrompt,
    this.userPromptTemplate = '',
    this.profileId = 'balanced',
    this.isBuiltIn = false,
    this.temperature = 0.3,
    this.category = '',
    final List<String> tags = const [],
    required this.createdAt,
    this.updatedAt,
  }) : _tags = tags;

  factory _$PromptTemplateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromptTemplateImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey()
  final String description;
  @override
  final String systemPrompt;
  @override
  @JsonKey()
  final String userPromptTemplate;
  @override
  @JsonKey()
  final String profileId;
  @override
  @JsonKey()
  final bool isBuiltIn;
  @override
  @JsonKey()
  final double temperature;
  @override
  @JsonKey()
  final String category;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'PromptTemplate(id: $id, name: $name, description: $description, systemPrompt: $systemPrompt, userPromptTemplate: $userPromptTemplate, profileId: $profileId, isBuiltIn: $isBuiltIn, temperature: $temperature, category: $category, tags: $tags, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromptTemplateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.systemPrompt, systemPrompt) ||
                other.systemPrompt == systemPrompt) &&
            (identical(other.userPromptTemplate, userPromptTemplate) ||
                other.userPromptTemplate == userPromptTemplate) &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.isBuiltIn, isBuiltIn) ||
                other.isBuiltIn == isBuiltIn) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
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
    description,
    systemPrompt,
    userPromptTemplate,
    profileId,
    isBuiltIn,
    temperature,
    category,
    const DeepCollectionEquality().hash(_tags),
    createdAt,
    updatedAt,
  );

  /// Create a copy of PromptTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PromptTemplateImplCopyWith<_$PromptTemplateImpl> get copyWith =>
      __$$PromptTemplateImplCopyWithImpl<_$PromptTemplateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PromptTemplateImplToJson(this);
  }
}

abstract class _PromptTemplate implements PromptTemplate {
  const factory _PromptTemplate({
    required final String id,
    required final String name,
    final String description,
    required final String systemPrompt,
    final String userPromptTemplate,
    final String profileId,
    final bool isBuiltIn,
    final double temperature,
    final String category,
    final List<String> tags,
    required final DateTime createdAt,
    final DateTime? updatedAt,
  }) = _$PromptTemplateImpl;

  factory _PromptTemplate.fromJson(Map<String, dynamic> json) =
      _$PromptTemplateImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get systemPrompt;
  @override
  String get userPromptTemplate;
  @override
  String get profileId;
  @override
  bool get isBuiltIn;
  @override
  double get temperature;
  @override
  String get category;
  @override
  List<String> get tags;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of PromptTemplate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PromptTemplateImplCopyWith<_$PromptTemplateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

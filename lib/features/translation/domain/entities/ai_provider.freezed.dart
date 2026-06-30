// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AiProvider _$AiProviderFromJson(Map<String, dynamic> json) {
  return _AiProvider.fromJson(json);
}

/// @nodoc
mixin _$AiProvider {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  ProviderType get type => throw _privateConstructorUsedError;
  String get baseUrl => throw _privateConstructorUsedError;
  String get apiKey => throw _privateConstructorUsedError;
  List<String> get models => throw _privateConstructorUsedError;
  String get selectedModel => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  bool get supportsStreaming => throw _privateConstructorUsedError;
  bool get supportsVision => throw _privateConstructorUsedError;
  int get maxContextLength => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this AiProvider to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiProvider
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiProviderCopyWith<AiProvider> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiProviderCopyWith<$Res> {
  factory $AiProviderCopyWith(
    AiProvider value,
    $Res Function(AiProvider) then,
  ) = _$AiProviderCopyWithImpl<$Res, AiProvider>;
  @useResult
  $Res call({
    String id,
    String name,
    ProviderType type,
    String baseUrl,
    String apiKey,
    List<String> models,
    String selectedModel,
    bool isActive,
    bool supportsStreaming,
    bool supportsVision,
    int maxContextLength,
    Map<String, dynamic>? metadata,
  });
}

/// @nodoc
class _$AiProviderCopyWithImpl<$Res, $Val extends AiProvider>
    implements $AiProviderCopyWith<$Res> {
  _$AiProviderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiProvider
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? baseUrl = null,
    Object? apiKey = null,
    Object? models = null,
    Object? selectedModel = null,
    Object? isActive = null,
    Object? supportsStreaming = null,
    Object? supportsVision = null,
    Object? maxContextLength = null,
    Object? metadata = freezed,
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
                      as ProviderType,
            baseUrl: null == baseUrl
                ? _value.baseUrl
                : baseUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            apiKey: null == apiKey
                ? _value.apiKey
                : apiKey // ignore: cast_nullable_to_non_nullable
                      as String,
            models: null == models
                ? _value.models
                : models // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            selectedModel: null == selectedModel
                ? _value.selectedModel
                : selectedModel // ignore: cast_nullable_to_non_nullable
                      as String,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            supportsStreaming: null == supportsStreaming
                ? _value.supportsStreaming
                : supportsStreaming // ignore: cast_nullable_to_non_nullable
                      as bool,
            supportsVision: null == supportsVision
                ? _value.supportsVision
                : supportsVision // ignore: cast_nullable_to_non_nullable
                      as bool,
            maxContextLength: null == maxContextLength
                ? _value.maxContextLength
                : maxContextLength // ignore: cast_nullable_to_non_nullable
                      as int,
            metadata: freezed == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiProviderImplCopyWith<$Res>
    implements $AiProviderCopyWith<$Res> {
  factory _$$AiProviderImplCopyWith(
    _$AiProviderImpl value,
    $Res Function(_$AiProviderImpl) then,
  ) = __$$AiProviderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    ProviderType type,
    String baseUrl,
    String apiKey,
    List<String> models,
    String selectedModel,
    bool isActive,
    bool supportsStreaming,
    bool supportsVision,
    int maxContextLength,
    Map<String, dynamic>? metadata,
  });
}

/// @nodoc
class __$$AiProviderImplCopyWithImpl<$Res>
    extends _$AiProviderCopyWithImpl<$Res, _$AiProviderImpl>
    implements _$$AiProviderImplCopyWith<$Res> {
  __$$AiProviderImplCopyWithImpl(
    _$AiProviderImpl _value,
    $Res Function(_$AiProviderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AiProvider
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? baseUrl = null,
    Object? apiKey = null,
    Object? models = null,
    Object? selectedModel = null,
    Object? isActive = null,
    Object? supportsStreaming = null,
    Object? supportsVision = null,
    Object? maxContextLength = null,
    Object? metadata = freezed,
  }) {
    return _then(
      _$AiProviderImpl(
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
                  as ProviderType,
        baseUrl: null == baseUrl
            ? _value.baseUrl
            : baseUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        apiKey: null == apiKey
            ? _value.apiKey
            : apiKey // ignore: cast_nullable_to_non_nullable
                  as String,
        models: null == models
            ? _value._models
            : models // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        selectedModel: null == selectedModel
            ? _value.selectedModel
            : selectedModel // ignore: cast_nullable_to_non_nullable
                  as String,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        supportsStreaming: null == supportsStreaming
            ? _value.supportsStreaming
            : supportsStreaming // ignore: cast_nullable_to_non_nullable
                  as bool,
        supportsVision: null == supportsVision
            ? _value.supportsVision
            : supportsVision // ignore: cast_nullable_to_non_nullable
                  as bool,
        maxContextLength: null == maxContextLength
            ? _value.maxContextLength
            : maxContextLength // ignore: cast_nullable_to_non_nullable
                  as int,
        metadata: freezed == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiProviderImpl implements _AiProvider {
  const _$AiProviderImpl({
    required this.id,
    required this.name,
    required this.type,
    required this.baseUrl,
    this.apiKey = '',
    final List<String> models = const [],
    this.selectedModel = '',
    this.isActive = true,
    this.supportsStreaming = false,
    this.supportsVision = false,
    this.maxContextLength = 4096,
    final Map<String, dynamic>? metadata,
  }) : _models = models,
       _metadata = metadata;

  factory _$AiProviderImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiProviderImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final ProviderType type;
  @override
  final String baseUrl;
  @override
  @JsonKey()
  final String apiKey;
  final List<String> _models;
  @override
  @JsonKey()
  List<String> get models {
    if (_models is EqualUnmodifiableListView) return _models;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_models);
  }

  @override
  @JsonKey()
  final String selectedModel;
  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final bool supportsStreaming;
  @override
  @JsonKey()
  final bool supportsVision;
  @override
  @JsonKey()
  final int maxContextLength;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AiProvider(id: $id, name: $name, type: $type, baseUrl: $baseUrl, apiKey: $apiKey, models: $models, selectedModel: $selectedModel, isActive: $isActive, supportsStreaming: $supportsStreaming, supportsVision: $supportsVision, maxContextLength: $maxContextLength, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiProviderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl) &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey) &&
            const DeepCollectionEquality().equals(other._models, _models) &&
            (identical(other.selectedModel, selectedModel) ||
                other.selectedModel == selectedModel) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.supportsStreaming, supportsStreaming) ||
                other.supportsStreaming == supportsStreaming) &&
            (identical(other.supportsVision, supportsVision) ||
                other.supportsVision == supportsVision) &&
            (identical(other.maxContextLength, maxContextLength) ||
                other.maxContextLength == maxContextLength) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    type,
    baseUrl,
    apiKey,
    const DeepCollectionEquality().hash(_models),
    selectedModel,
    isActive,
    supportsStreaming,
    supportsVision,
    maxContextLength,
    const DeepCollectionEquality().hash(_metadata),
  );

  /// Create a copy of AiProvider
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiProviderImplCopyWith<_$AiProviderImpl> get copyWith =>
      __$$AiProviderImplCopyWithImpl<_$AiProviderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AiProviderImplToJson(this);
  }
}

abstract class _AiProvider implements AiProvider {
  const factory _AiProvider({
    required final String id,
    required final String name,
    required final ProviderType type,
    required final String baseUrl,
    final String apiKey,
    final List<String> models,
    final String selectedModel,
    final bool isActive,
    final bool supportsStreaming,
    final bool supportsVision,
    final int maxContextLength,
    final Map<String, dynamic>? metadata,
  }) = _$AiProviderImpl;

  factory _AiProvider.fromJson(Map<String, dynamic> json) =
      _$AiProviderImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  ProviderType get type;
  @override
  String get baseUrl;
  @override
  String get apiKey;
  @override
  List<String> get models;
  @override
  String get selectedModel;
  @override
  bool get isActive;
  @override
  bool get supportsStreaming;
  @override
  bool get supportsVision;
  @override
  int get maxContextLength;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of AiProvider
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiProviderImplCopyWith<_$AiProviderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AiModel _$AiModelFromJson(Map<String, dynamic> json) {
  return _AiModel.fromJson(json);
}

/// @nodoc
mixin _$AiModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get providerId => throw _privateConstructorUsedError;
  int get contextWindow => throw _privateConstructorUsedError;
  bool get supportsVision => throw _privateConstructorUsedError;
  bool get supportsStreaming => throw _privateConstructorUsedError;
  double? get inputCostPer1k => throw _privateConstructorUsedError;
  double? get outputCostPer1k => throw _privateConstructorUsedError;

  /// Serializes this AiModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AiModelCopyWith<AiModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiModelCopyWith<$Res> {
  factory $AiModelCopyWith(AiModel value, $Res Function(AiModel) then) =
      _$AiModelCopyWithImpl<$Res, AiModel>;
  @useResult
  $Res call({
    String id,
    String name,
    String providerId,
    int contextWindow,
    bool supportsVision,
    bool supportsStreaming,
    double? inputCostPer1k,
    double? outputCostPer1k,
  });
}

/// @nodoc
class _$AiModelCopyWithImpl<$Res, $Val extends AiModel>
    implements $AiModelCopyWith<$Res> {
  _$AiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? providerId = null,
    Object? contextWindow = null,
    Object? supportsVision = null,
    Object? supportsStreaming = null,
    Object? inputCostPer1k = freezed,
    Object? outputCostPer1k = freezed,
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
            providerId: null == providerId
                ? _value.providerId
                : providerId // ignore: cast_nullable_to_non_nullable
                      as String,
            contextWindow: null == contextWindow
                ? _value.contextWindow
                : contextWindow // ignore: cast_nullable_to_non_nullable
                      as int,
            supportsVision: null == supportsVision
                ? _value.supportsVision
                : supportsVision // ignore: cast_nullable_to_non_nullable
                      as bool,
            supportsStreaming: null == supportsStreaming
                ? _value.supportsStreaming
                : supportsStreaming // ignore: cast_nullable_to_non_nullable
                      as bool,
            inputCostPer1k: freezed == inputCostPer1k
                ? _value.inputCostPer1k
                : inputCostPer1k // ignore: cast_nullable_to_non_nullable
                      as double?,
            outputCostPer1k: freezed == outputCostPer1k
                ? _value.outputCostPer1k
                : outputCostPer1k // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AiModelImplCopyWith<$Res> implements $AiModelCopyWith<$Res> {
  factory _$$AiModelImplCopyWith(
    _$AiModelImpl value,
    $Res Function(_$AiModelImpl) then,
  ) = __$$AiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String providerId,
    int contextWindow,
    bool supportsVision,
    bool supportsStreaming,
    double? inputCostPer1k,
    double? outputCostPer1k,
  });
}

/// @nodoc
class __$$AiModelImplCopyWithImpl<$Res>
    extends _$AiModelCopyWithImpl<$Res, _$AiModelImpl>
    implements _$$AiModelImplCopyWith<$Res> {
  __$$AiModelImplCopyWithImpl(
    _$AiModelImpl _value,
    $Res Function(_$AiModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? providerId = null,
    Object? contextWindow = null,
    Object? supportsVision = null,
    Object? supportsStreaming = null,
    Object? inputCostPer1k = freezed,
    Object? outputCostPer1k = freezed,
  }) {
    return _then(
      _$AiModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        providerId: null == providerId
            ? _value.providerId
            : providerId // ignore: cast_nullable_to_non_nullable
                  as String,
        contextWindow: null == contextWindow
            ? _value.contextWindow
            : contextWindow // ignore: cast_nullable_to_non_nullable
                  as int,
        supportsVision: null == supportsVision
            ? _value.supportsVision
            : supportsVision // ignore: cast_nullable_to_non_nullable
                  as bool,
        supportsStreaming: null == supportsStreaming
            ? _value.supportsStreaming
            : supportsStreaming // ignore: cast_nullable_to_non_nullable
                  as bool,
        inputCostPer1k: freezed == inputCostPer1k
            ? _value.inputCostPer1k
            : inputCostPer1k // ignore: cast_nullable_to_non_nullable
                  as double?,
        outputCostPer1k: freezed == outputCostPer1k
            ? _value.outputCostPer1k
            : outputCostPer1k // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AiModelImpl implements _AiModel {
  const _$AiModelImpl({
    required this.id,
    required this.name,
    required this.providerId,
    this.contextWindow = 4096,
    this.supportsVision = false,
    this.supportsStreaming = false,
    this.inputCostPer1k,
    this.outputCostPer1k,
  });

  factory _$AiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AiModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String providerId;
  @override
  @JsonKey()
  final int contextWindow;
  @override
  @JsonKey()
  final bool supportsVision;
  @override
  @JsonKey()
  final bool supportsStreaming;
  @override
  final double? inputCostPer1k;
  @override
  final double? outputCostPer1k;

  @override
  String toString() {
    return 'AiModel(id: $id, name: $name, providerId: $providerId, contextWindow: $contextWindow, supportsVision: $supportsVision, supportsStreaming: $supportsStreaming, inputCostPer1k: $inputCostPer1k, outputCostPer1k: $outputCostPer1k)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AiModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.contextWindow, contextWindow) ||
                other.contextWindow == contextWindow) &&
            (identical(other.supportsVision, supportsVision) ||
                other.supportsVision == supportsVision) &&
            (identical(other.supportsStreaming, supportsStreaming) ||
                other.supportsStreaming == supportsStreaming) &&
            (identical(other.inputCostPer1k, inputCostPer1k) ||
                other.inputCostPer1k == inputCostPer1k) &&
            (identical(other.outputCostPer1k, outputCostPer1k) ||
                other.outputCostPer1k == outputCostPer1k));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    providerId,
    contextWindow,
    supportsVision,
    supportsStreaming,
    inputCostPer1k,
    outputCostPer1k,
  );

  /// Create a copy of AiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AiModelImplCopyWith<_$AiModelImpl> get copyWith =>
      __$$AiModelImplCopyWithImpl<_$AiModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AiModelImplToJson(this);
  }
}

abstract class _AiModel implements AiModel {
  const factory _AiModel({
    required final String id,
    required final String name,
    required final String providerId,
    final int contextWindow,
    final bool supportsVision,
    final bool supportsStreaming,
    final double? inputCostPer1k,
    final double? outputCostPer1k,
  }) = _$AiModelImpl;

  factory _AiModel.fromJson(Map<String, dynamic> json) = _$AiModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get providerId;
  @override
  int get contextWindow;
  @override
  bool get supportsVision;
  @override
  bool get supportsStreaming;
  @override
  double? get inputCostPer1k;
  @override
  double? get outputCostPer1k;

  /// Create a copy of AiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AiModelImplCopyWith<_$AiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

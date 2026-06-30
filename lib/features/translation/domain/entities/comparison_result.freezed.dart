// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comparison_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ComparisonResult _$ComparisonResultFromJson(Map<String, dynamic> json) {
  return _ComparisonResult.fromJson(json);
}

/// @nodoc
mixin _$ComparisonResult {
  String get id => throw _privateConstructorUsedError;
  String get sourceText => throw _privateConstructorUsedError;
  List<TranslationCandidate> get candidates =>
      throw _privateConstructorUsedError;
  int get selectedIndex => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ComparisonResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ComparisonResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ComparisonResultCopyWith<ComparisonResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComparisonResultCopyWith<$Res> {
  factory $ComparisonResultCopyWith(
    ComparisonResult value,
    $Res Function(ComparisonResult) then,
  ) = _$ComparisonResultCopyWithImpl<$Res, ComparisonResult>;
  @useResult
  $Res call({
    String id,
    String sourceText,
    List<TranslationCandidate> candidates,
    int selectedIndex,
    DateTime createdAt,
  });
}

/// @nodoc
class _$ComparisonResultCopyWithImpl<$Res, $Val extends ComparisonResult>
    implements $ComparisonResultCopyWith<$Res> {
  _$ComparisonResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ComparisonResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sourceText = null,
    Object? candidates = null,
    Object? selectedIndex = null,
    Object? createdAt = null,
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
            candidates: null == candidates
                ? _value.candidates
                : candidates // ignore: cast_nullable_to_non_nullable
                      as List<TranslationCandidate>,
            selectedIndex: null == selectedIndex
                ? _value.selectedIndex
                : selectedIndex // ignore: cast_nullable_to_non_nullable
                      as int,
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
abstract class _$$ComparisonResultImplCopyWith<$Res>
    implements $ComparisonResultCopyWith<$Res> {
  factory _$$ComparisonResultImplCopyWith(
    _$ComparisonResultImpl value,
    $Res Function(_$ComparisonResultImpl) then,
  ) = __$$ComparisonResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String sourceText,
    List<TranslationCandidate> candidates,
    int selectedIndex,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$ComparisonResultImplCopyWithImpl<$Res>
    extends _$ComparisonResultCopyWithImpl<$Res, _$ComparisonResultImpl>
    implements _$$ComparisonResultImplCopyWith<$Res> {
  __$$ComparisonResultImplCopyWithImpl(
    _$ComparisonResultImpl _value,
    $Res Function(_$ComparisonResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ComparisonResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sourceText = null,
    Object? candidates = null,
    Object? selectedIndex = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$ComparisonResultImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        sourceText: null == sourceText
            ? _value.sourceText
            : sourceText // ignore: cast_nullable_to_non_nullable
                  as String,
        candidates: null == candidates
            ? _value._candidates
            : candidates // ignore: cast_nullable_to_non_nullable
                  as List<TranslationCandidate>,
        selectedIndex: null == selectedIndex
            ? _value.selectedIndex
            : selectedIndex // ignore: cast_nullable_to_non_nullable
                  as int,
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
class _$ComparisonResultImpl implements _ComparisonResult {
  const _$ComparisonResultImpl({
    required this.id,
    required this.sourceText,
    final List<TranslationCandidate> candidates = const [],
    this.selectedIndex = -1,
    required this.createdAt,
  }) : _candidates = candidates;

  factory _$ComparisonResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComparisonResultImplFromJson(json);

  @override
  final String id;
  @override
  final String sourceText;
  final List<TranslationCandidate> _candidates;
  @override
  @JsonKey()
  List<TranslationCandidate> get candidates {
    if (_candidates is EqualUnmodifiableListView) return _candidates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_candidates);
  }

  @override
  @JsonKey()
  final int selectedIndex;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'ComparisonResult(id: $id, sourceText: $sourceText, candidates: $candidates, selectedIndex: $selectedIndex, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComparisonResultImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sourceText, sourceText) ||
                other.sourceText == sourceText) &&
            const DeepCollectionEquality().equals(
              other._candidates,
              _candidates,
            ) &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    sourceText,
    const DeepCollectionEquality().hash(_candidates),
    selectedIndex,
    createdAt,
  );

  /// Create a copy of ComparisonResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ComparisonResultImplCopyWith<_$ComparisonResultImpl> get copyWith =>
      __$$ComparisonResultImplCopyWithImpl<_$ComparisonResultImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ComparisonResultImplToJson(this);
  }
}

abstract class _ComparisonResult implements ComparisonResult {
  const factory _ComparisonResult({
    required final String id,
    required final String sourceText,
    final List<TranslationCandidate> candidates,
    final int selectedIndex,
    required final DateTime createdAt,
  }) = _$ComparisonResultImpl;

  factory _ComparisonResult.fromJson(Map<String, dynamic> json) =
      _$ComparisonResultImpl.fromJson;

  @override
  String get id;
  @override
  String get sourceText;
  @override
  List<TranslationCandidate> get candidates;
  @override
  int get selectedIndex;
  @override
  DateTime get createdAt;

  /// Create a copy of ComparisonResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ComparisonResultImplCopyWith<_$ComparisonResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TranslationCandidate _$TranslationCandidateFromJson(Map<String, dynamic> json) {
  return _TranslationCandidate.fromJson(json);
}

/// @nodoc
mixin _$TranslationCandidate {
  String get providerId => throw _privateConstructorUsedError;
  String get providerName => throw _privateConstructorUsedError;
  String get modelName => throw _privateConstructorUsedError;
  String get translatedText => throw _privateConstructorUsedError;
  double get qualityScore => throw _privateConstructorUsedError;
  int get tokenCount => throw _privateConstructorUsedError;
  double get costUsd => throw _privateConstructorUsedError;
  int get durationMs => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  /// Serializes this TranslationCandidate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TranslationCandidate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TranslationCandidateCopyWith<TranslationCandidate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranslationCandidateCopyWith<$Res> {
  factory $TranslationCandidateCopyWith(
    TranslationCandidate value,
    $Res Function(TranslationCandidate) then,
  ) = _$TranslationCandidateCopyWithImpl<$Res, TranslationCandidate>;
  @useResult
  $Res call({
    String providerId,
    String providerName,
    String modelName,
    String translatedText,
    double qualityScore,
    int tokenCount,
    double costUsd,
    int durationMs,
    bool isSelected,
  });
}

/// @nodoc
class _$TranslationCandidateCopyWithImpl<
  $Res,
  $Val extends TranslationCandidate
>
    implements $TranslationCandidateCopyWith<$Res> {
  _$TranslationCandidateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TranslationCandidate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? providerId = null,
    Object? providerName = null,
    Object? modelName = null,
    Object? translatedText = null,
    Object? qualityScore = null,
    Object? tokenCount = null,
    Object? costUsd = null,
    Object? durationMs = null,
    Object? isSelected = null,
  }) {
    return _then(
      _value.copyWith(
            providerId: null == providerId
                ? _value.providerId
                : providerId // ignore: cast_nullable_to_non_nullable
                      as String,
            providerName: null == providerName
                ? _value.providerName
                : providerName // ignore: cast_nullable_to_non_nullable
                      as String,
            modelName: null == modelName
                ? _value.modelName
                : modelName // ignore: cast_nullable_to_non_nullable
                      as String,
            translatedText: null == translatedText
                ? _value.translatedText
                : translatedText // ignore: cast_nullable_to_non_nullable
                      as String,
            qualityScore: null == qualityScore
                ? _value.qualityScore
                : qualityScore // ignore: cast_nullable_to_non_nullable
                      as double,
            tokenCount: null == tokenCount
                ? _value.tokenCount
                : tokenCount // ignore: cast_nullable_to_non_nullable
                      as int,
            costUsd: null == costUsd
                ? _value.costUsd
                : costUsd // ignore: cast_nullable_to_non_nullable
                      as double,
            durationMs: null == durationMs
                ? _value.durationMs
                : durationMs // ignore: cast_nullable_to_non_nullable
                      as int,
            isSelected: null == isSelected
                ? _value.isSelected
                : isSelected // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TranslationCandidateImplCopyWith<$Res>
    implements $TranslationCandidateCopyWith<$Res> {
  factory _$$TranslationCandidateImplCopyWith(
    _$TranslationCandidateImpl value,
    $Res Function(_$TranslationCandidateImpl) then,
  ) = __$$TranslationCandidateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String providerId,
    String providerName,
    String modelName,
    String translatedText,
    double qualityScore,
    int tokenCount,
    double costUsd,
    int durationMs,
    bool isSelected,
  });
}

/// @nodoc
class __$$TranslationCandidateImplCopyWithImpl<$Res>
    extends _$TranslationCandidateCopyWithImpl<$Res, _$TranslationCandidateImpl>
    implements _$$TranslationCandidateImplCopyWith<$Res> {
  __$$TranslationCandidateImplCopyWithImpl(
    _$TranslationCandidateImpl _value,
    $Res Function(_$TranslationCandidateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TranslationCandidate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? providerId = null,
    Object? providerName = null,
    Object? modelName = null,
    Object? translatedText = null,
    Object? qualityScore = null,
    Object? tokenCount = null,
    Object? costUsd = null,
    Object? durationMs = null,
    Object? isSelected = null,
  }) {
    return _then(
      _$TranslationCandidateImpl(
        providerId: null == providerId
            ? _value.providerId
            : providerId // ignore: cast_nullable_to_non_nullable
                  as String,
        providerName: null == providerName
            ? _value.providerName
            : providerName // ignore: cast_nullable_to_non_nullable
                  as String,
        modelName: null == modelName
            ? _value.modelName
            : modelName // ignore: cast_nullable_to_non_nullable
                  as String,
        translatedText: null == translatedText
            ? _value.translatedText
            : translatedText // ignore: cast_nullable_to_non_nullable
                  as String,
        qualityScore: null == qualityScore
            ? _value.qualityScore
            : qualityScore // ignore: cast_nullable_to_non_nullable
                  as double,
        tokenCount: null == tokenCount
            ? _value.tokenCount
            : tokenCount // ignore: cast_nullable_to_non_nullable
                  as int,
        costUsd: null == costUsd
            ? _value.costUsd
            : costUsd // ignore: cast_nullable_to_non_nullable
                  as double,
        durationMs: null == durationMs
            ? _value.durationMs
            : durationMs // ignore: cast_nullable_to_non_nullable
                  as int,
        isSelected: null == isSelected
            ? _value.isSelected
            : isSelected // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TranslationCandidateImpl implements _TranslationCandidate {
  const _$TranslationCandidateImpl({
    required this.providerId,
    required this.providerName,
    required this.modelName,
    required this.translatedText,
    this.qualityScore = 0.0,
    this.tokenCount = 0,
    this.costUsd = 0.0,
    this.durationMs = 0,
    this.isSelected = false,
  });

  factory _$TranslationCandidateImpl.fromJson(Map<String, dynamic> json) =>
      _$$TranslationCandidateImplFromJson(json);

  @override
  final String providerId;
  @override
  final String providerName;
  @override
  final String modelName;
  @override
  final String translatedText;
  @override
  @JsonKey()
  final double qualityScore;
  @override
  @JsonKey()
  final int tokenCount;
  @override
  @JsonKey()
  final double costUsd;
  @override
  @JsonKey()
  final int durationMs;
  @override
  @JsonKey()
  final bool isSelected;

  @override
  String toString() {
    return 'TranslationCandidate(providerId: $providerId, providerName: $providerName, modelName: $modelName, translatedText: $translatedText, qualityScore: $qualityScore, tokenCount: $tokenCount, costUsd: $costUsd, durationMs: $durationMs, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranslationCandidateImpl &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.providerName, providerName) ||
                other.providerName == providerName) &&
            (identical(other.modelName, modelName) ||
                other.modelName == modelName) &&
            (identical(other.translatedText, translatedText) ||
                other.translatedText == translatedText) &&
            (identical(other.qualityScore, qualityScore) ||
                other.qualityScore == qualityScore) &&
            (identical(other.tokenCount, tokenCount) ||
                other.tokenCount == tokenCount) &&
            (identical(other.costUsd, costUsd) || other.costUsd == costUsd) &&
            (identical(other.durationMs, durationMs) ||
                other.durationMs == durationMs) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    providerId,
    providerName,
    modelName,
    translatedText,
    qualityScore,
    tokenCount,
    costUsd,
    durationMs,
    isSelected,
  );

  /// Create a copy of TranslationCandidate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranslationCandidateImplCopyWith<_$TranslationCandidateImpl>
  get copyWith =>
      __$$TranslationCandidateImplCopyWithImpl<_$TranslationCandidateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TranslationCandidateImplToJson(this);
  }
}

abstract class _TranslationCandidate implements TranslationCandidate {
  const factory _TranslationCandidate({
    required final String providerId,
    required final String providerName,
    required final String modelName,
    required final String translatedText,
    final double qualityScore,
    final int tokenCount,
    final double costUsd,
    final int durationMs,
    final bool isSelected,
  }) = _$TranslationCandidateImpl;

  factory _TranslationCandidate.fromJson(Map<String, dynamic> json) =
      _$TranslationCandidateImpl.fromJson;

  @override
  String get providerId;
  @override
  String get providerName;
  @override
  String get modelName;
  @override
  String get translatedText;
  @override
  double get qualityScore;
  @override
  int get tokenCount;
  @override
  double get costUsd;
  @override
  int get durationMs;
  @override
  bool get isSelected;

  /// Create a copy of TranslationCandidate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranslationCandidateImplCopyWith<_$TranslationCandidateImpl>
  get copyWith => throw _privateConstructorUsedError;
}

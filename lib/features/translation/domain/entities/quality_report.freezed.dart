// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quality_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

QualityReport _$QualityReportFromJson(Map<String, dynamic> json) {
  return _QualityReport.fromJson(json);
}

/// @nodoc
mixin _$QualityReport {
  String get id => throw _privateConstructorUsedError;
  String get jobId => throw _privateConstructorUsedError;
  double get overallScore => throw _privateConstructorUsedError; // 0-100
  List<QualityCheck> get checks => throw _privateConstructorUsedError;
  List<QualityIssue> get issues => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this QualityReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QualityReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QualityReportCopyWith<QualityReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QualityReportCopyWith<$Res> {
  factory $QualityReportCopyWith(
    QualityReport value,
    $Res Function(QualityReport) then,
  ) = _$QualityReportCopyWithImpl<$Res, QualityReport>;
  @useResult
  $Res call({
    String id,
    String jobId,
    double overallScore,
    List<QualityCheck> checks,
    List<QualityIssue> issues,
    String summary,
    DateTime createdAt,
  });
}

/// @nodoc
class _$QualityReportCopyWithImpl<$Res, $Val extends QualityReport>
    implements $QualityReportCopyWith<$Res> {
  _$QualityReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QualityReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? jobId = null,
    Object? overallScore = null,
    Object? checks = null,
    Object? issues = null,
    Object? summary = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            jobId: null == jobId
                ? _value.jobId
                : jobId // ignore: cast_nullable_to_non_nullable
                      as String,
            overallScore: null == overallScore
                ? _value.overallScore
                : overallScore // ignore: cast_nullable_to_non_nullable
                      as double,
            checks: null == checks
                ? _value.checks
                : checks // ignore: cast_nullable_to_non_nullable
                      as List<QualityCheck>,
            issues: null == issues
                ? _value.issues
                : issues // ignore: cast_nullable_to_non_nullable
                      as List<QualityIssue>,
            summary: null == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$QualityReportImplCopyWith<$Res>
    implements $QualityReportCopyWith<$Res> {
  factory _$$QualityReportImplCopyWith(
    _$QualityReportImpl value,
    $Res Function(_$QualityReportImpl) then,
  ) = __$$QualityReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String jobId,
    double overallScore,
    List<QualityCheck> checks,
    List<QualityIssue> issues,
    String summary,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$QualityReportImplCopyWithImpl<$Res>
    extends _$QualityReportCopyWithImpl<$Res, _$QualityReportImpl>
    implements _$$QualityReportImplCopyWith<$Res> {
  __$$QualityReportImplCopyWithImpl(
    _$QualityReportImpl _value,
    $Res Function(_$QualityReportImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QualityReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? jobId = null,
    Object? overallScore = null,
    Object? checks = null,
    Object? issues = null,
    Object? summary = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$QualityReportImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        jobId: null == jobId
            ? _value.jobId
            : jobId // ignore: cast_nullable_to_non_nullable
                  as String,
        overallScore: null == overallScore
            ? _value.overallScore
            : overallScore // ignore: cast_nullable_to_non_nullable
                  as double,
        checks: null == checks
            ? _value._checks
            : checks // ignore: cast_nullable_to_non_nullable
                  as List<QualityCheck>,
        issues: null == issues
            ? _value._issues
            : issues // ignore: cast_nullable_to_non_nullable
                  as List<QualityIssue>,
        summary: null == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String,
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
class _$QualityReportImpl implements _QualityReport {
  const _$QualityReportImpl({
    required this.id,
    required this.jobId,
    this.overallScore = 0.0,
    final List<QualityCheck> checks = const [],
    final List<QualityIssue> issues = const [],
    this.summary = '',
    required this.createdAt,
  }) : _checks = checks,
       _issues = issues;

  factory _$QualityReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$QualityReportImplFromJson(json);

  @override
  final String id;
  @override
  final String jobId;
  @override
  @JsonKey()
  final double overallScore;
  // 0-100
  final List<QualityCheck> _checks;
  // 0-100
  @override
  @JsonKey()
  List<QualityCheck> get checks {
    if (_checks is EqualUnmodifiableListView) return _checks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_checks);
  }

  final List<QualityIssue> _issues;
  @override
  @JsonKey()
  List<QualityIssue> get issues {
    if (_issues is EqualUnmodifiableListView) return _issues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_issues);
  }

  @override
  @JsonKey()
  final String summary;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'QualityReport(id: $id, jobId: $jobId, overallScore: $overallScore, checks: $checks, issues: $issues, summary: $summary, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QualityReportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.jobId, jobId) || other.jobId == jobId) &&
            (identical(other.overallScore, overallScore) ||
                other.overallScore == overallScore) &&
            const DeepCollectionEquality().equals(other._checks, _checks) &&
            const DeepCollectionEquality().equals(other._issues, _issues) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    jobId,
    overallScore,
    const DeepCollectionEquality().hash(_checks),
    const DeepCollectionEquality().hash(_issues),
    summary,
    createdAt,
  );

  /// Create a copy of QualityReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QualityReportImplCopyWith<_$QualityReportImpl> get copyWith =>
      __$$QualityReportImplCopyWithImpl<_$QualityReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QualityReportImplToJson(this);
  }
}

abstract class _QualityReport implements QualityReport {
  const factory _QualityReport({
    required final String id,
    required final String jobId,
    final double overallScore,
    final List<QualityCheck> checks,
    final List<QualityIssue> issues,
    final String summary,
    required final DateTime createdAt,
  }) = _$QualityReportImpl;

  factory _QualityReport.fromJson(Map<String, dynamic> json) =
      _$QualityReportImpl.fromJson;

  @override
  String get id;
  @override
  String get jobId;
  @override
  double get overallScore; // 0-100
  @override
  List<QualityCheck> get checks;
  @override
  List<QualityIssue> get issues;
  @override
  String get summary;
  @override
  DateTime get createdAt;

  /// Create a copy of QualityReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QualityReportImplCopyWith<_$QualityReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QualityCheck _$QualityCheckFromJson(Map<String, dynamic> json) {
  return _QualityCheck.fromJson(json);
}

/// @nodoc
mixin _$QualityCheck {
  QualityCheckType get type => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;
  String get feedback => throw _privateConstructorUsedError;
  int get issueCount => throw _privateConstructorUsedError;

  /// Serializes this QualityCheck to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QualityCheck
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QualityCheckCopyWith<QualityCheck> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QualityCheckCopyWith<$Res> {
  factory $QualityCheckCopyWith(
    QualityCheck value,
    $Res Function(QualityCheck) then,
  ) = _$QualityCheckCopyWithImpl<$Res, QualityCheck>;
  @useResult
  $Res call({
    QualityCheckType type,
    double score,
    String feedback,
    int issueCount,
  });
}

/// @nodoc
class _$QualityCheckCopyWithImpl<$Res, $Val extends QualityCheck>
    implements $QualityCheckCopyWith<$Res> {
  _$QualityCheckCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QualityCheck
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? score = null,
    Object? feedback = null,
    Object? issueCount = null,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as QualityCheckType,
            score: null == score
                ? _value.score
                : score // ignore: cast_nullable_to_non_nullable
                      as double,
            feedback: null == feedback
                ? _value.feedback
                : feedback // ignore: cast_nullable_to_non_nullable
                      as String,
            issueCount: null == issueCount
                ? _value.issueCount
                : issueCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QualityCheckImplCopyWith<$Res>
    implements $QualityCheckCopyWith<$Res> {
  factory _$$QualityCheckImplCopyWith(
    _$QualityCheckImpl value,
    $Res Function(_$QualityCheckImpl) then,
  ) = __$$QualityCheckImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    QualityCheckType type,
    double score,
    String feedback,
    int issueCount,
  });
}

/// @nodoc
class __$$QualityCheckImplCopyWithImpl<$Res>
    extends _$QualityCheckCopyWithImpl<$Res, _$QualityCheckImpl>
    implements _$$QualityCheckImplCopyWith<$Res> {
  __$$QualityCheckImplCopyWithImpl(
    _$QualityCheckImpl _value,
    $Res Function(_$QualityCheckImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QualityCheck
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? score = null,
    Object? feedback = null,
    Object? issueCount = null,
  }) {
    return _then(
      _$QualityCheckImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as QualityCheckType,
        score: null == score
            ? _value.score
            : score // ignore: cast_nullable_to_non_nullable
                  as double,
        feedback: null == feedback
            ? _value.feedback
            : feedback // ignore: cast_nullable_to_non_nullable
                  as String,
        issueCount: null == issueCount
            ? _value.issueCount
            : issueCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QualityCheckImpl implements _QualityCheck {
  const _$QualityCheckImpl({
    required this.type,
    this.score = 0.0,
    this.feedback = '',
    this.issueCount = 0,
  });

  factory _$QualityCheckImpl.fromJson(Map<String, dynamic> json) =>
      _$$QualityCheckImplFromJson(json);

  @override
  final QualityCheckType type;
  @override
  @JsonKey()
  final double score;
  @override
  @JsonKey()
  final String feedback;
  @override
  @JsonKey()
  final int issueCount;

  @override
  String toString() {
    return 'QualityCheck(type: $type, score: $score, feedback: $feedback, issueCount: $issueCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QualityCheckImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback) &&
            (identical(other.issueCount, issueCount) ||
                other.issueCount == issueCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, score, feedback, issueCount);

  /// Create a copy of QualityCheck
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QualityCheckImplCopyWith<_$QualityCheckImpl> get copyWith =>
      __$$QualityCheckImplCopyWithImpl<_$QualityCheckImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QualityCheckImplToJson(this);
  }
}

abstract class _QualityCheck implements QualityCheck {
  const factory _QualityCheck({
    required final QualityCheckType type,
    final double score,
    final String feedback,
    final int issueCount,
  }) = _$QualityCheckImpl;

  factory _QualityCheck.fromJson(Map<String, dynamic> json) =
      _$QualityCheckImpl.fromJson;

  @override
  QualityCheckType get type;
  @override
  double get score;
  @override
  String get feedback;
  @override
  int get issueCount;

  /// Create a copy of QualityCheck
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QualityCheckImplCopyWith<_$QualityCheckImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QualityIssue _$QualityIssueFromJson(Map<String, dynamic> json) {
  return _QualityIssue.fromJson(json);
}

/// @nodoc
mixin _$QualityIssue {
  String get message => throw _privateConstructorUsedError;
  IssueSeverity get severity => throw _privateConstructorUsedError;
  String get chunkId => throw _privateConstructorUsedError;
  String get suggestion => throw _privateConstructorUsedError;
  String get context => throw _privateConstructorUsedError;

  /// Serializes this QualityIssue to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QualityIssue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QualityIssueCopyWith<QualityIssue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QualityIssueCopyWith<$Res> {
  factory $QualityIssueCopyWith(
    QualityIssue value,
    $Res Function(QualityIssue) then,
  ) = _$QualityIssueCopyWithImpl<$Res, QualityIssue>;
  @useResult
  $Res call({
    String message,
    IssueSeverity severity,
    String chunkId,
    String suggestion,
    String context,
  });
}

/// @nodoc
class _$QualityIssueCopyWithImpl<$Res, $Val extends QualityIssue>
    implements $QualityIssueCopyWith<$Res> {
  _$QualityIssueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QualityIssue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? severity = null,
    Object? chunkId = null,
    Object? suggestion = null,
    Object? context = null,
  }) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            severity: null == severity
                ? _value.severity
                : severity // ignore: cast_nullable_to_non_nullable
                      as IssueSeverity,
            chunkId: null == chunkId
                ? _value.chunkId
                : chunkId // ignore: cast_nullable_to_non_nullable
                      as String,
            suggestion: null == suggestion
                ? _value.suggestion
                : suggestion // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$QualityIssueImplCopyWith<$Res>
    implements $QualityIssueCopyWith<$Res> {
  factory _$$QualityIssueImplCopyWith(
    _$QualityIssueImpl value,
    $Res Function(_$QualityIssueImpl) then,
  ) = __$$QualityIssueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String message,
    IssueSeverity severity,
    String chunkId,
    String suggestion,
    String context,
  });
}

/// @nodoc
class __$$QualityIssueImplCopyWithImpl<$Res>
    extends _$QualityIssueCopyWithImpl<$Res, _$QualityIssueImpl>
    implements _$$QualityIssueImplCopyWith<$Res> {
  __$$QualityIssueImplCopyWithImpl(
    _$QualityIssueImpl _value,
    $Res Function(_$QualityIssueImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QualityIssue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? severity = null,
    Object? chunkId = null,
    Object? suggestion = null,
    Object? context = null,
  }) {
    return _then(
      _$QualityIssueImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        severity: null == severity
            ? _value.severity
            : severity // ignore: cast_nullable_to_non_nullable
                  as IssueSeverity,
        chunkId: null == chunkId
            ? _value.chunkId
            : chunkId // ignore: cast_nullable_to_non_nullable
                  as String,
        suggestion: null == suggestion
            ? _value.suggestion
            : suggestion // ignore: cast_nullable_to_non_nullable
                  as String,
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
class _$QualityIssueImpl implements _QualityIssue {
  const _$QualityIssueImpl({
    required this.message,
    this.severity = IssueSeverity.medium,
    this.chunkId = '',
    this.suggestion = '',
    this.context = '',
  });

  factory _$QualityIssueImpl.fromJson(Map<String, dynamic> json) =>
      _$$QualityIssueImplFromJson(json);

  @override
  final String message;
  @override
  @JsonKey()
  final IssueSeverity severity;
  @override
  @JsonKey()
  final String chunkId;
  @override
  @JsonKey()
  final String suggestion;
  @override
  @JsonKey()
  final String context;

  @override
  String toString() {
    return 'QualityIssue(message: $message, severity: $severity, chunkId: $chunkId, suggestion: $suggestion, context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QualityIssueImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.chunkId, chunkId) || other.chunkId == chunkId) &&
            (identical(other.suggestion, suggestion) ||
                other.suggestion == suggestion) &&
            (identical(other.context, context) || other.context == context));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, message, severity, chunkId, suggestion, context);

  /// Create a copy of QualityIssue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QualityIssueImplCopyWith<_$QualityIssueImpl> get copyWith =>
      __$$QualityIssueImplCopyWithImpl<_$QualityIssueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QualityIssueImplToJson(this);
  }
}

abstract class _QualityIssue implements QualityIssue {
  const factory _QualityIssue({
    required final String message,
    final IssueSeverity severity,
    final String chunkId,
    final String suggestion,
    final String context,
  }) = _$QualityIssueImpl;

  factory _QualityIssue.fromJson(Map<String, dynamic> json) =
      _$QualityIssueImpl.fromJson;

  @override
  String get message;
  @override
  IssueSeverity get severity;
  @override
  String get chunkId;
  @override
  String get suggestion;
  @override
  String get context;

  /// Create a copy of QualityIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QualityIssueImplCopyWith<_$QualityIssueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

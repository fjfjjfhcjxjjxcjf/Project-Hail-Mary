// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AppFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) network,
    required TResult Function(String message) cache,
    required TResult Function(String message) parsing,
    required TResult Function(String path) fileNotFound,
    required TResult Function(String format) unsupportedFormat,
    required TResult Function(String provider) apiKeyMissing,
    required TResult Function(String message) quotaExceeded,
    required TResult Function(String message) translation,
    required TResult Function(String message) unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? network,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? parsing,
    TResult? Function(String path)? fileNotFound,
    TResult? Function(String format)? unsupportedFormat,
    TResult? Function(String provider)? apiKeyMissing,
    TResult? Function(String message)? quotaExceeded,
    TResult? Function(String message)? translation,
    TResult? Function(String message)? unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? network,
    TResult Function(String message)? cache,
    TResult Function(String message)? parsing,
    TResult Function(String path)? fileNotFound,
    TResult Function(String format)? unsupportedFormat,
    TResult Function(String provider)? apiKeyMissing,
    TResult Function(String message)? quotaExceeded,
    TResult Function(String message)? translation,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(ParsingFailure value) parsing,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(UnsupportedFormatFailure value) unsupportedFormat,
    required TResult Function(ApiKeyMissingFailure value) apiKeyMissing,
    required TResult Function(QuotaExceededFailure value) quotaExceeded,
    required TResult Function(TranslationFailure value) translation,
    required TResult Function(UnknownFailure value) unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(ParsingFailure value)? parsing,
    TResult? Function(FileNotFoundFailure value)? fileNotFound,
    TResult? Function(UnsupportedFormatFailure value)? unsupportedFormat,
    TResult? Function(ApiKeyMissingFailure value)? apiKeyMissing,
    TResult? Function(QuotaExceededFailure value)? quotaExceeded,
    TResult? Function(TranslationFailure value)? translation,
    TResult? Function(UnknownFailure value)? unknown,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(NetworkFailure value)? network,
    TResult Function(CacheFailure value)? cache,
    TResult Function(ParsingFailure value)? parsing,
    TResult Function(FileNotFoundFailure value)? fileNotFound,
    TResult Function(UnsupportedFormatFailure value)? unsupportedFormat,
    TResult Function(ApiKeyMissingFailure value)? apiKeyMissing,
    TResult Function(QuotaExceededFailure value)? quotaExceeded,
    TResult Function(TranslationFailure value)? translation,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppFailureCopyWith<$Res> {
  factory $AppFailureCopyWith(
    AppFailure value,
    $Res Function(AppFailure) then,
  ) = _$AppFailureCopyWithImpl<$Res, AppFailure>;
}

/// @nodoc
class _$AppFailureCopyWithImpl<$Res, $Val extends AppFailure>
    implements $AppFailureCopyWith<$Res> {
  _$AppFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ServerFailureImplCopyWith<$Res> {
  factory _$$ServerFailureImplCopyWith(
    _$ServerFailureImpl value,
    $Res Function(_$ServerFailureImpl) then,
  ) = __$$ServerFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, int? statusCode});
}

/// @nodoc
class __$$ServerFailureImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$ServerFailureImpl>
    implements _$$ServerFailureImplCopyWith<$Res> {
  __$$ServerFailureImplCopyWithImpl(
    _$ServerFailureImpl _value,
    $Res Function(_$ServerFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? statusCode = freezed}) {
    return _then(
      _$ServerFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        statusCode: freezed == statusCode
            ? _value.statusCode
            : statusCode // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc

class _$ServerFailureImpl implements ServerFailure {
  const _$ServerFailureImpl({required this.message, this.statusCode});

  @override
  final String message;
  @override
  final int? statusCode;

  @override
  String toString() {
    return 'AppFailure.server(message: $message, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, statusCode);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerFailureImplCopyWith<_$ServerFailureImpl> get copyWith =>
      __$$ServerFailureImplCopyWithImpl<_$ServerFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) network,
    required TResult Function(String message) cache,
    required TResult Function(String message) parsing,
    required TResult Function(String path) fileNotFound,
    required TResult Function(String format) unsupportedFormat,
    required TResult Function(String provider) apiKeyMissing,
    required TResult Function(String message) quotaExceeded,
    required TResult Function(String message) translation,
    required TResult Function(String message) unknown,
  }) {
    return server(message, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? network,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? parsing,
    TResult? Function(String path)? fileNotFound,
    TResult? Function(String format)? unsupportedFormat,
    TResult? Function(String provider)? apiKeyMissing,
    TResult? Function(String message)? quotaExceeded,
    TResult? Function(String message)? translation,
    TResult? Function(String message)? unknown,
  }) {
    return server?.call(message, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? network,
    TResult Function(String message)? cache,
    TResult Function(String message)? parsing,
    TResult Function(String path)? fileNotFound,
    TResult Function(String format)? unsupportedFormat,
    TResult Function(String provider)? apiKeyMissing,
    TResult Function(String message)? quotaExceeded,
    TResult Function(String message)? translation,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(message, statusCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(ParsingFailure value) parsing,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(UnsupportedFormatFailure value) unsupportedFormat,
    required TResult Function(ApiKeyMissingFailure value) apiKeyMissing,
    required TResult Function(QuotaExceededFailure value) quotaExceeded,
    required TResult Function(TranslationFailure value) translation,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(ParsingFailure value)? parsing,
    TResult? Function(FileNotFoundFailure value)? fileNotFound,
    TResult? Function(UnsupportedFormatFailure value)? unsupportedFormat,
    TResult? Function(ApiKeyMissingFailure value)? apiKeyMissing,
    TResult? Function(QuotaExceededFailure value)? quotaExceeded,
    TResult? Function(TranslationFailure value)? translation,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(NetworkFailure value)? network,
    TResult Function(CacheFailure value)? cache,
    TResult Function(ParsingFailure value)? parsing,
    TResult Function(FileNotFoundFailure value)? fileNotFound,
    TResult Function(UnsupportedFormatFailure value)? unsupportedFormat,
    TResult Function(ApiKeyMissingFailure value)? apiKeyMissing,
    TResult Function(QuotaExceededFailure value)? quotaExceeded,
    TResult Function(TranslationFailure value)? translation,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class ServerFailure implements AppFailure {
  const factory ServerFailure({
    required final String message,
    final int? statusCode,
  }) = _$ServerFailureImpl;

  String get message;
  int? get statusCode;

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerFailureImplCopyWith<_$ServerFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkFailureImplCopyWith<$Res> {
  factory _$$NetworkFailureImplCopyWith(
    _$NetworkFailureImpl value,
    $Res Function(_$NetworkFailureImpl) then,
  ) = __$$NetworkFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NetworkFailureImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$NetworkFailureImpl>
    implements _$$NetworkFailureImplCopyWith<$Res> {
  __$$NetworkFailureImplCopyWithImpl(
    _$NetworkFailureImpl _value,
    $Res Function(_$NetworkFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$NetworkFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$NetworkFailureImpl implements NetworkFailure {
  const _$NetworkFailureImpl({this.message = 'No internet connection'});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AppFailure.network(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkFailureImplCopyWith<_$NetworkFailureImpl> get copyWith =>
      __$$NetworkFailureImplCopyWithImpl<_$NetworkFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) network,
    required TResult Function(String message) cache,
    required TResult Function(String message) parsing,
    required TResult Function(String path) fileNotFound,
    required TResult Function(String format) unsupportedFormat,
    required TResult Function(String provider) apiKeyMissing,
    required TResult Function(String message) quotaExceeded,
    required TResult Function(String message) translation,
    required TResult Function(String message) unknown,
  }) {
    return network(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? network,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? parsing,
    TResult? Function(String path)? fileNotFound,
    TResult? Function(String format)? unsupportedFormat,
    TResult? Function(String provider)? apiKeyMissing,
    TResult? Function(String message)? quotaExceeded,
    TResult? Function(String message)? translation,
    TResult? Function(String message)? unknown,
  }) {
    return network?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? network,
    TResult Function(String message)? cache,
    TResult Function(String message)? parsing,
    TResult Function(String path)? fileNotFound,
    TResult Function(String format)? unsupportedFormat,
    TResult Function(String provider)? apiKeyMissing,
    TResult Function(String message)? quotaExceeded,
    TResult Function(String message)? translation,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(ParsingFailure value) parsing,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(UnsupportedFormatFailure value) unsupportedFormat,
    required TResult Function(ApiKeyMissingFailure value) apiKeyMissing,
    required TResult Function(QuotaExceededFailure value) quotaExceeded,
    required TResult Function(TranslationFailure value) translation,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(ParsingFailure value)? parsing,
    TResult? Function(FileNotFoundFailure value)? fileNotFound,
    TResult? Function(UnsupportedFormatFailure value)? unsupportedFormat,
    TResult? Function(ApiKeyMissingFailure value)? apiKeyMissing,
    TResult? Function(QuotaExceededFailure value)? quotaExceeded,
    TResult? Function(TranslationFailure value)? translation,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(NetworkFailure value)? network,
    TResult Function(CacheFailure value)? cache,
    TResult Function(ParsingFailure value)? parsing,
    TResult Function(FileNotFoundFailure value)? fileNotFound,
    TResult Function(UnsupportedFormatFailure value)? unsupportedFormat,
    TResult Function(ApiKeyMissingFailure value)? apiKeyMissing,
    TResult Function(QuotaExceededFailure value)? quotaExceeded,
    TResult Function(TranslationFailure value)? translation,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class NetworkFailure implements AppFailure {
  const factory NetworkFailure({final String message}) = _$NetworkFailureImpl;

  String get message;

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkFailureImplCopyWith<_$NetworkFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CacheFailureImplCopyWith<$Res> {
  factory _$$CacheFailureImplCopyWith(
    _$CacheFailureImpl value,
    $Res Function(_$CacheFailureImpl) then,
  ) = __$$CacheFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CacheFailureImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$CacheFailureImpl>
    implements _$$CacheFailureImplCopyWith<$Res> {
  __$$CacheFailureImplCopyWithImpl(
    _$CacheFailureImpl _value,
    $Res Function(_$CacheFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$CacheFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$CacheFailureImpl implements CacheFailure {
  const _$CacheFailureImpl({this.message = 'Cache error'});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AppFailure.cache(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CacheFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CacheFailureImplCopyWith<_$CacheFailureImpl> get copyWith =>
      __$$CacheFailureImplCopyWithImpl<_$CacheFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) network,
    required TResult Function(String message) cache,
    required TResult Function(String message) parsing,
    required TResult Function(String path) fileNotFound,
    required TResult Function(String format) unsupportedFormat,
    required TResult Function(String provider) apiKeyMissing,
    required TResult Function(String message) quotaExceeded,
    required TResult Function(String message) translation,
    required TResult Function(String message) unknown,
  }) {
    return cache(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? network,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? parsing,
    TResult? Function(String path)? fileNotFound,
    TResult? Function(String format)? unsupportedFormat,
    TResult? Function(String provider)? apiKeyMissing,
    TResult? Function(String message)? quotaExceeded,
    TResult? Function(String message)? translation,
    TResult? Function(String message)? unknown,
  }) {
    return cache?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? network,
    TResult Function(String message)? cache,
    TResult Function(String message)? parsing,
    TResult Function(String path)? fileNotFound,
    TResult Function(String format)? unsupportedFormat,
    TResult Function(String provider)? apiKeyMissing,
    TResult Function(String message)? quotaExceeded,
    TResult Function(String message)? translation,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(ParsingFailure value) parsing,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(UnsupportedFormatFailure value) unsupportedFormat,
    required TResult Function(ApiKeyMissingFailure value) apiKeyMissing,
    required TResult Function(QuotaExceededFailure value) quotaExceeded,
    required TResult Function(TranslationFailure value) translation,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return cache(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(ParsingFailure value)? parsing,
    TResult? Function(FileNotFoundFailure value)? fileNotFound,
    TResult? Function(UnsupportedFormatFailure value)? unsupportedFormat,
    TResult? Function(ApiKeyMissingFailure value)? apiKeyMissing,
    TResult? Function(QuotaExceededFailure value)? quotaExceeded,
    TResult? Function(TranslationFailure value)? translation,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return cache?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(NetworkFailure value)? network,
    TResult Function(CacheFailure value)? cache,
    TResult Function(ParsingFailure value)? parsing,
    TResult Function(FileNotFoundFailure value)? fileNotFound,
    TResult Function(UnsupportedFormatFailure value)? unsupportedFormat,
    TResult Function(ApiKeyMissingFailure value)? apiKeyMissing,
    TResult Function(QuotaExceededFailure value)? quotaExceeded,
    TResult Function(TranslationFailure value)? translation,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache(this);
    }
    return orElse();
  }
}

abstract class CacheFailure implements AppFailure {
  const factory CacheFailure({final String message}) = _$CacheFailureImpl;

  String get message;

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CacheFailureImplCopyWith<_$CacheFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ParsingFailureImplCopyWith<$Res> {
  factory _$$ParsingFailureImplCopyWith(
    _$ParsingFailureImpl value,
    $Res Function(_$ParsingFailureImpl) then,
  ) = __$$ParsingFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ParsingFailureImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$ParsingFailureImpl>
    implements _$$ParsingFailureImplCopyWith<$Res> {
  __$$ParsingFailureImplCopyWithImpl(
    _$ParsingFailureImpl _value,
    $Res Function(_$ParsingFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ParsingFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ParsingFailureImpl implements ParsingFailure {
  const _$ParsingFailureImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'AppFailure.parsing(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParsingFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParsingFailureImplCopyWith<_$ParsingFailureImpl> get copyWith =>
      __$$ParsingFailureImplCopyWithImpl<_$ParsingFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) network,
    required TResult Function(String message) cache,
    required TResult Function(String message) parsing,
    required TResult Function(String path) fileNotFound,
    required TResult Function(String format) unsupportedFormat,
    required TResult Function(String provider) apiKeyMissing,
    required TResult Function(String message) quotaExceeded,
    required TResult Function(String message) translation,
    required TResult Function(String message) unknown,
  }) {
    return parsing(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? network,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? parsing,
    TResult? Function(String path)? fileNotFound,
    TResult? Function(String format)? unsupportedFormat,
    TResult? Function(String provider)? apiKeyMissing,
    TResult? Function(String message)? quotaExceeded,
    TResult? Function(String message)? translation,
    TResult? Function(String message)? unknown,
  }) {
    return parsing?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? network,
    TResult Function(String message)? cache,
    TResult Function(String message)? parsing,
    TResult Function(String path)? fileNotFound,
    TResult Function(String format)? unsupportedFormat,
    TResult Function(String provider)? apiKeyMissing,
    TResult Function(String message)? quotaExceeded,
    TResult Function(String message)? translation,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (parsing != null) {
      return parsing(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(ParsingFailure value) parsing,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(UnsupportedFormatFailure value) unsupportedFormat,
    required TResult Function(ApiKeyMissingFailure value) apiKeyMissing,
    required TResult Function(QuotaExceededFailure value) quotaExceeded,
    required TResult Function(TranslationFailure value) translation,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return parsing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(ParsingFailure value)? parsing,
    TResult? Function(FileNotFoundFailure value)? fileNotFound,
    TResult? Function(UnsupportedFormatFailure value)? unsupportedFormat,
    TResult? Function(ApiKeyMissingFailure value)? apiKeyMissing,
    TResult? Function(QuotaExceededFailure value)? quotaExceeded,
    TResult? Function(TranslationFailure value)? translation,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return parsing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(NetworkFailure value)? network,
    TResult Function(CacheFailure value)? cache,
    TResult Function(ParsingFailure value)? parsing,
    TResult Function(FileNotFoundFailure value)? fileNotFound,
    TResult Function(UnsupportedFormatFailure value)? unsupportedFormat,
    TResult Function(ApiKeyMissingFailure value)? apiKeyMissing,
    TResult Function(QuotaExceededFailure value)? quotaExceeded,
    TResult Function(TranslationFailure value)? translation,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (parsing != null) {
      return parsing(this);
    }
    return orElse();
  }
}

abstract class ParsingFailure implements AppFailure {
  const factory ParsingFailure({required final String message}) =
      _$ParsingFailureImpl;

  String get message;

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParsingFailureImplCopyWith<_$ParsingFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FileNotFoundFailureImplCopyWith<$Res> {
  factory _$$FileNotFoundFailureImplCopyWith(
    _$FileNotFoundFailureImpl value,
    $Res Function(_$FileNotFoundFailureImpl) then,
  ) = __$$FileNotFoundFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String path});
}

/// @nodoc
class __$$FileNotFoundFailureImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$FileNotFoundFailureImpl>
    implements _$$FileNotFoundFailureImplCopyWith<$Res> {
  __$$FileNotFoundFailureImplCopyWithImpl(
    _$FileNotFoundFailureImpl _value,
    $Res Function(_$FileNotFoundFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? path = null}) {
    return _then(
      _$FileNotFoundFailureImpl(
        path: null == path
            ? _value.path
            : path // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$FileNotFoundFailureImpl implements FileNotFoundFailure {
  const _$FileNotFoundFailureImpl({required this.path});

  @override
  final String path;

  @override
  String toString() {
    return 'AppFailure.fileNotFound(path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileNotFoundFailureImpl &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FileNotFoundFailureImplCopyWith<_$FileNotFoundFailureImpl> get copyWith =>
      __$$FileNotFoundFailureImplCopyWithImpl<_$FileNotFoundFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) network,
    required TResult Function(String message) cache,
    required TResult Function(String message) parsing,
    required TResult Function(String path) fileNotFound,
    required TResult Function(String format) unsupportedFormat,
    required TResult Function(String provider) apiKeyMissing,
    required TResult Function(String message) quotaExceeded,
    required TResult Function(String message) translation,
    required TResult Function(String message) unknown,
  }) {
    return fileNotFound(path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? network,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? parsing,
    TResult? Function(String path)? fileNotFound,
    TResult? Function(String format)? unsupportedFormat,
    TResult? Function(String provider)? apiKeyMissing,
    TResult? Function(String message)? quotaExceeded,
    TResult? Function(String message)? translation,
    TResult? Function(String message)? unknown,
  }) {
    return fileNotFound?.call(path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? network,
    TResult Function(String message)? cache,
    TResult Function(String message)? parsing,
    TResult Function(String path)? fileNotFound,
    TResult Function(String format)? unsupportedFormat,
    TResult Function(String provider)? apiKeyMissing,
    TResult Function(String message)? quotaExceeded,
    TResult Function(String message)? translation,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (fileNotFound != null) {
      return fileNotFound(path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(ParsingFailure value) parsing,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(UnsupportedFormatFailure value) unsupportedFormat,
    required TResult Function(ApiKeyMissingFailure value) apiKeyMissing,
    required TResult Function(QuotaExceededFailure value) quotaExceeded,
    required TResult Function(TranslationFailure value) translation,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return fileNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(ParsingFailure value)? parsing,
    TResult? Function(FileNotFoundFailure value)? fileNotFound,
    TResult? Function(UnsupportedFormatFailure value)? unsupportedFormat,
    TResult? Function(ApiKeyMissingFailure value)? apiKeyMissing,
    TResult? Function(QuotaExceededFailure value)? quotaExceeded,
    TResult? Function(TranslationFailure value)? translation,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return fileNotFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(NetworkFailure value)? network,
    TResult Function(CacheFailure value)? cache,
    TResult Function(ParsingFailure value)? parsing,
    TResult Function(FileNotFoundFailure value)? fileNotFound,
    TResult Function(UnsupportedFormatFailure value)? unsupportedFormat,
    TResult Function(ApiKeyMissingFailure value)? apiKeyMissing,
    TResult Function(QuotaExceededFailure value)? quotaExceeded,
    TResult Function(TranslationFailure value)? translation,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (fileNotFound != null) {
      return fileNotFound(this);
    }
    return orElse();
  }
}

abstract class FileNotFoundFailure implements AppFailure {
  const factory FileNotFoundFailure({required final String path}) =
      _$FileNotFoundFailureImpl;

  String get path;

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FileNotFoundFailureImplCopyWith<_$FileNotFoundFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnsupportedFormatFailureImplCopyWith<$Res> {
  factory _$$UnsupportedFormatFailureImplCopyWith(
    _$UnsupportedFormatFailureImpl value,
    $Res Function(_$UnsupportedFormatFailureImpl) then,
  ) = __$$UnsupportedFormatFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String format});
}

/// @nodoc
class __$$UnsupportedFormatFailureImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$UnsupportedFormatFailureImpl>
    implements _$$UnsupportedFormatFailureImplCopyWith<$Res> {
  __$$UnsupportedFormatFailureImplCopyWithImpl(
    _$UnsupportedFormatFailureImpl _value,
    $Res Function(_$UnsupportedFormatFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? format = null}) {
    return _then(
      _$UnsupportedFormatFailureImpl(
        format: null == format
            ? _value.format
            : format // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$UnsupportedFormatFailureImpl implements UnsupportedFormatFailure {
  const _$UnsupportedFormatFailureImpl({required this.format});

  @override
  final String format;

  @override
  String toString() {
    return 'AppFailure.unsupportedFormat(format: $format)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnsupportedFormatFailureImpl &&
            (identical(other.format, format) || other.format == format));
  }

  @override
  int get hashCode => Object.hash(runtimeType, format);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnsupportedFormatFailureImplCopyWith<_$UnsupportedFormatFailureImpl>
  get copyWith =>
      __$$UnsupportedFormatFailureImplCopyWithImpl<
        _$UnsupportedFormatFailureImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) network,
    required TResult Function(String message) cache,
    required TResult Function(String message) parsing,
    required TResult Function(String path) fileNotFound,
    required TResult Function(String format) unsupportedFormat,
    required TResult Function(String provider) apiKeyMissing,
    required TResult Function(String message) quotaExceeded,
    required TResult Function(String message) translation,
    required TResult Function(String message) unknown,
  }) {
    return unsupportedFormat(format);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? network,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? parsing,
    TResult? Function(String path)? fileNotFound,
    TResult? Function(String format)? unsupportedFormat,
    TResult? Function(String provider)? apiKeyMissing,
    TResult? Function(String message)? quotaExceeded,
    TResult? Function(String message)? translation,
    TResult? Function(String message)? unknown,
  }) {
    return unsupportedFormat?.call(format);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? network,
    TResult Function(String message)? cache,
    TResult Function(String message)? parsing,
    TResult Function(String path)? fileNotFound,
    TResult Function(String format)? unsupportedFormat,
    TResult Function(String provider)? apiKeyMissing,
    TResult Function(String message)? quotaExceeded,
    TResult Function(String message)? translation,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (unsupportedFormat != null) {
      return unsupportedFormat(format);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(ParsingFailure value) parsing,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(UnsupportedFormatFailure value) unsupportedFormat,
    required TResult Function(ApiKeyMissingFailure value) apiKeyMissing,
    required TResult Function(QuotaExceededFailure value) quotaExceeded,
    required TResult Function(TranslationFailure value) translation,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return unsupportedFormat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(ParsingFailure value)? parsing,
    TResult? Function(FileNotFoundFailure value)? fileNotFound,
    TResult? Function(UnsupportedFormatFailure value)? unsupportedFormat,
    TResult? Function(ApiKeyMissingFailure value)? apiKeyMissing,
    TResult? Function(QuotaExceededFailure value)? quotaExceeded,
    TResult? Function(TranslationFailure value)? translation,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return unsupportedFormat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(NetworkFailure value)? network,
    TResult Function(CacheFailure value)? cache,
    TResult Function(ParsingFailure value)? parsing,
    TResult Function(FileNotFoundFailure value)? fileNotFound,
    TResult Function(UnsupportedFormatFailure value)? unsupportedFormat,
    TResult Function(ApiKeyMissingFailure value)? apiKeyMissing,
    TResult Function(QuotaExceededFailure value)? quotaExceeded,
    TResult Function(TranslationFailure value)? translation,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (unsupportedFormat != null) {
      return unsupportedFormat(this);
    }
    return orElse();
  }
}

abstract class UnsupportedFormatFailure implements AppFailure {
  const factory UnsupportedFormatFailure({required final String format}) =
      _$UnsupportedFormatFailureImpl;

  String get format;

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnsupportedFormatFailureImplCopyWith<_$UnsupportedFormatFailureImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiKeyMissingFailureImplCopyWith<$Res> {
  factory _$$ApiKeyMissingFailureImplCopyWith(
    _$ApiKeyMissingFailureImpl value,
    $Res Function(_$ApiKeyMissingFailureImpl) then,
  ) = __$$ApiKeyMissingFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String provider});
}

/// @nodoc
class __$$ApiKeyMissingFailureImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$ApiKeyMissingFailureImpl>
    implements _$$ApiKeyMissingFailureImplCopyWith<$Res> {
  __$$ApiKeyMissingFailureImplCopyWithImpl(
    _$ApiKeyMissingFailureImpl _value,
    $Res Function(_$ApiKeyMissingFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? provider = null}) {
    return _then(
      _$ApiKeyMissingFailureImpl(
        provider: null == provider
            ? _value.provider
            : provider // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ApiKeyMissingFailureImpl implements ApiKeyMissingFailure {
  const _$ApiKeyMissingFailureImpl({required this.provider});

  @override
  final String provider;

  @override
  String toString() {
    return 'AppFailure.apiKeyMissing(provider: $provider)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiKeyMissingFailureImpl &&
            (identical(other.provider, provider) ||
                other.provider == provider));
  }

  @override
  int get hashCode => Object.hash(runtimeType, provider);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiKeyMissingFailureImplCopyWith<_$ApiKeyMissingFailureImpl>
  get copyWith =>
      __$$ApiKeyMissingFailureImplCopyWithImpl<_$ApiKeyMissingFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) network,
    required TResult Function(String message) cache,
    required TResult Function(String message) parsing,
    required TResult Function(String path) fileNotFound,
    required TResult Function(String format) unsupportedFormat,
    required TResult Function(String provider) apiKeyMissing,
    required TResult Function(String message) quotaExceeded,
    required TResult Function(String message) translation,
    required TResult Function(String message) unknown,
  }) {
    return apiKeyMissing(provider);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? network,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? parsing,
    TResult? Function(String path)? fileNotFound,
    TResult? Function(String format)? unsupportedFormat,
    TResult? Function(String provider)? apiKeyMissing,
    TResult? Function(String message)? quotaExceeded,
    TResult? Function(String message)? translation,
    TResult? Function(String message)? unknown,
  }) {
    return apiKeyMissing?.call(provider);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? network,
    TResult Function(String message)? cache,
    TResult Function(String message)? parsing,
    TResult Function(String path)? fileNotFound,
    TResult Function(String format)? unsupportedFormat,
    TResult Function(String provider)? apiKeyMissing,
    TResult Function(String message)? quotaExceeded,
    TResult Function(String message)? translation,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (apiKeyMissing != null) {
      return apiKeyMissing(provider);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(ParsingFailure value) parsing,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(UnsupportedFormatFailure value) unsupportedFormat,
    required TResult Function(ApiKeyMissingFailure value) apiKeyMissing,
    required TResult Function(QuotaExceededFailure value) quotaExceeded,
    required TResult Function(TranslationFailure value) translation,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return apiKeyMissing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(ParsingFailure value)? parsing,
    TResult? Function(FileNotFoundFailure value)? fileNotFound,
    TResult? Function(UnsupportedFormatFailure value)? unsupportedFormat,
    TResult? Function(ApiKeyMissingFailure value)? apiKeyMissing,
    TResult? Function(QuotaExceededFailure value)? quotaExceeded,
    TResult? Function(TranslationFailure value)? translation,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return apiKeyMissing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(NetworkFailure value)? network,
    TResult Function(CacheFailure value)? cache,
    TResult Function(ParsingFailure value)? parsing,
    TResult Function(FileNotFoundFailure value)? fileNotFound,
    TResult Function(UnsupportedFormatFailure value)? unsupportedFormat,
    TResult Function(ApiKeyMissingFailure value)? apiKeyMissing,
    TResult Function(QuotaExceededFailure value)? quotaExceeded,
    TResult Function(TranslationFailure value)? translation,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (apiKeyMissing != null) {
      return apiKeyMissing(this);
    }
    return orElse();
  }
}

abstract class ApiKeyMissingFailure implements AppFailure {
  const factory ApiKeyMissingFailure({required final String provider}) =
      _$ApiKeyMissingFailureImpl;

  String get provider;

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiKeyMissingFailureImplCopyWith<_$ApiKeyMissingFailureImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QuotaExceededFailureImplCopyWith<$Res> {
  factory _$$QuotaExceededFailureImplCopyWith(
    _$QuotaExceededFailureImpl value,
    $Res Function(_$QuotaExceededFailureImpl) then,
  ) = __$$QuotaExceededFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$QuotaExceededFailureImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$QuotaExceededFailureImpl>
    implements _$$QuotaExceededFailureImplCopyWith<$Res> {
  __$$QuotaExceededFailureImplCopyWithImpl(
    _$QuotaExceededFailureImpl _value,
    $Res Function(_$QuotaExceededFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$QuotaExceededFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$QuotaExceededFailureImpl implements QuotaExceededFailure {
  const _$QuotaExceededFailureImpl({this.message = 'API quota exceeded'});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AppFailure.quotaExceeded(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuotaExceededFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuotaExceededFailureImplCopyWith<_$QuotaExceededFailureImpl>
  get copyWith =>
      __$$QuotaExceededFailureImplCopyWithImpl<_$QuotaExceededFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) network,
    required TResult Function(String message) cache,
    required TResult Function(String message) parsing,
    required TResult Function(String path) fileNotFound,
    required TResult Function(String format) unsupportedFormat,
    required TResult Function(String provider) apiKeyMissing,
    required TResult Function(String message) quotaExceeded,
    required TResult Function(String message) translation,
    required TResult Function(String message) unknown,
  }) {
    return quotaExceeded(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? network,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? parsing,
    TResult? Function(String path)? fileNotFound,
    TResult? Function(String format)? unsupportedFormat,
    TResult? Function(String provider)? apiKeyMissing,
    TResult? Function(String message)? quotaExceeded,
    TResult? Function(String message)? translation,
    TResult? Function(String message)? unknown,
  }) {
    return quotaExceeded?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? network,
    TResult Function(String message)? cache,
    TResult Function(String message)? parsing,
    TResult Function(String path)? fileNotFound,
    TResult Function(String format)? unsupportedFormat,
    TResult Function(String provider)? apiKeyMissing,
    TResult Function(String message)? quotaExceeded,
    TResult Function(String message)? translation,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (quotaExceeded != null) {
      return quotaExceeded(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(ParsingFailure value) parsing,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(UnsupportedFormatFailure value) unsupportedFormat,
    required TResult Function(ApiKeyMissingFailure value) apiKeyMissing,
    required TResult Function(QuotaExceededFailure value) quotaExceeded,
    required TResult Function(TranslationFailure value) translation,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return quotaExceeded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(ParsingFailure value)? parsing,
    TResult? Function(FileNotFoundFailure value)? fileNotFound,
    TResult? Function(UnsupportedFormatFailure value)? unsupportedFormat,
    TResult? Function(ApiKeyMissingFailure value)? apiKeyMissing,
    TResult? Function(QuotaExceededFailure value)? quotaExceeded,
    TResult? Function(TranslationFailure value)? translation,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return quotaExceeded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(NetworkFailure value)? network,
    TResult Function(CacheFailure value)? cache,
    TResult Function(ParsingFailure value)? parsing,
    TResult Function(FileNotFoundFailure value)? fileNotFound,
    TResult Function(UnsupportedFormatFailure value)? unsupportedFormat,
    TResult Function(ApiKeyMissingFailure value)? apiKeyMissing,
    TResult Function(QuotaExceededFailure value)? quotaExceeded,
    TResult Function(TranslationFailure value)? translation,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (quotaExceeded != null) {
      return quotaExceeded(this);
    }
    return orElse();
  }
}

abstract class QuotaExceededFailure implements AppFailure {
  const factory QuotaExceededFailure({final String message}) =
      _$QuotaExceededFailureImpl;

  String get message;

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuotaExceededFailureImplCopyWith<_$QuotaExceededFailureImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TranslationFailureImplCopyWith<$Res> {
  factory _$$TranslationFailureImplCopyWith(
    _$TranslationFailureImpl value,
    $Res Function(_$TranslationFailureImpl) then,
  ) = __$$TranslationFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TranslationFailureImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$TranslationFailureImpl>
    implements _$$TranslationFailureImplCopyWith<$Res> {
  __$$TranslationFailureImplCopyWithImpl(
    _$TranslationFailureImpl _value,
    $Res Function(_$TranslationFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$TranslationFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$TranslationFailureImpl implements TranslationFailure {
  const _$TranslationFailureImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'AppFailure.translation(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranslationFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranslationFailureImplCopyWith<_$TranslationFailureImpl> get copyWith =>
      __$$TranslationFailureImplCopyWithImpl<_$TranslationFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) network,
    required TResult Function(String message) cache,
    required TResult Function(String message) parsing,
    required TResult Function(String path) fileNotFound,
    required TResult Function(String format) unsupportedFormat,
    required TResult Function(String provider) apiKeyMissing,
    required TResult Function(String message) quotaExceeded,
    required TResult Function(String message) translation,
    required TResult Function(String message) unknown,
  }) {
    return translation(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? network,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? parsing,
    TResult? Function(String path)? fileNotFound,
    TResult? Function(String format)? unsupportedFormat,
    TResult? Function(String provider)? apiKeyMissing,
    TResult? Function(String message)? quotaExceeded,
    TResult? Function(String message)? translation,
    TResult? Function(String message)? unknown,
  }) {
    return translation?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? network,
    TResult Function(String message)? cache,
    TResult Function(String message)? parsing,
    TResult Function(String path)? fileNotFound,
    TResult Function(String format)? unsupportedFormat,
    TResult Function(String provider)? apiKeyMissing,
    TResult Function(String message)? quotaExceeded,
    TResult Function(String message)? translation,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (translation != null) {
      return translation(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(ParsingFailure value) parsing,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(UnsupportedFormatFailure value) unsupportedFormat,
    required TResult Function(ApiKeyMissingFailure value) apiKeyMissing,
    required TResult Function(QuotaExceededFailure value) quotaExceeded,
    required TResult Function(TranslationFailure value) translation,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return translation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(ParsingFailure value)? parsing,
    TResult? Function(FileNotFoundFailure value)? fileNotFound,
    TResult? Function(UnsupportedFormatFailure value)? unsupportedFormat,
    TResult? Function(ApiKeyMissingFailure value)? apiKeyMissing,
    TResult? Function(QuotaExceededFailure value)? quotaExceeded,
    TResult? Function(TranslationFailure value)? translation,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return translation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(NetworkFailure value)? network,
    TResult Function(CacheFailure value)? cache,
    TResult Function(ParsingFailure value)? parsing,
    TResult Function(FileNotFoundFailure value)? fileNotFound,
    TResult Function(UnsupportedFormatFailure value)? unsupportedFormat,
    TResult Function(ApiKeyMissingFailure value)? apiKeyMissing,
    TResult Function(QuotaExceededFailure value)? quotaExceeded,
    TResult Function(TranslationFailure value)? translation,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (translation != null) {
      return translation(this);
    }
    return orElse();
  }
}

abstract class TranslationFailure implements AppFailure {
  const factory TranslationFailure({required final String message}) =
      _$TranslationFailureImpl;

  String get message;

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranslationFailureImplCopyWith<_$TranslationFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownFailureImplCopyWith<$Res> {
  factory _$$UnknownFailureImplCopyWith(
    _$UnknownFailureImpl value,
    $Res Function(_$UnknownFailureImpl) then,
  ) = __$$UnknownFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnknownFailureImplCopyWithImpl<$Res>
    extends _$AppFailureCopyWithImpl<$Res, _$UnknownFailureImpl>
    implements _$$UnknownFailureImplCopyWith<$Res> {
  __$$UnknownFailureImplCopyWithImpl(
    _$UnknownFailureImpl _value,
    $Res Function(_$UnknownFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$UnknownFailureImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$UnknownFailureImpl implements UnknownFailure {
  const _$UnknownFailureImpl({this.message = 'An unexpected error occurred'});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AppFailure.unknown(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownFailureImplCopyWith<_$UnknownFailureImpl> get copyWith =>
      __$$UnknownFailureImplCopyWithImpl<_$UnknownFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message, int? statusCode) server,
    required TResult Function(String message) network,
    required TResult Function(String message) cache,
    required TResult Function(String message) parsing,
    required TResult Function(String path) fileNotFound,
    required TResult Function(String format) unsupportedFormat,
    required TResult Function(String provider) apiKeyMissing,
    required TResult Function(String message) quotaExceeded,
    required TResult Function(String message) translation,
    required TResult Function(String message) unknown,
  }) {
    return unknown(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message, int? statusCode)? server,
    TResult? Function(String message)? network,
    TResult? Function(String message)? cache,
    TResult? Function(String message)? parsing,
    TResult? Function(String path)? fileNotFound,
    TResult? Function(String format)? unsupportedFormat,
    TResult? Function(String provider)? apiKeyMissing,
    TResult? Function(String message)? quotaExceeded,
    TResult? Function(String message)? translation,
    TResult? Function(String message)? unknown,
  }) {
    return unknown?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message, int? statusCode)? server,
    TResult Function(String message)? network,
    TResult Function(String message)? cache,
    TResult Function(String message)? parsing,
    TResult Function(String path)? fileNotFound,
    TResult Function(String format)? unsupportedFormat,
    TResult Function(String provider)? apiKeyMissing,
    TResult Function(String message)? quotaExceeded,
    TResult Function(String message)? translation,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(CacheFailure value) cache,
    required TResult Function(ParsingFailure value) parsing,
    required TResult Function(FileNotFoundFailure value) fileNotFound,
    required TResult Function(UnsupportedFormatFailure value) unsupportedFormat,
    required TResult Function(ApiKeyMissingFailure value) apiKeyMissing,
    required TResult Function(QuotaExceededFailure value) quotaExceeded,
    required TResult Function(TranslationFailure value) translation,
    required TResult Function(UnknownFailure value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(CacheFailure value)? cache,
    TResult? Function(ParsingFailure value)? parsing,
    TResult? Function(FileNotFoundFailure value)? fileNotFound,
    TResult? Function(UnsupportedFormatFailure value)? unsupportedFormat,
    TResult? Function(ApiKeyMissingFailure value)? apiKeyMissing,
    TResult? Function(QuotaExceededFailure value)? quotaExceeded,
    TResult? Function(TranslationFailure value)? translation,
    TResult? Function(UnknownFailure value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(NetworkFailure value)? network,
    TResult Function(CacheFailure value)? cache,
    TResult Function(ParsingFailure value)? parsing,
    TResult Function(FileNotFoundFailure value)? fileNotFound,
    TResult Function(UnsupportedFormatFailure value)? unsupportedFormat,
    TResult Function(ApiKeyMissingFailure value)? apiKeyMissing,
    TResult Function(QuotaExceededFailure value)? quotaExceeded,
    TResult Function(TranslationFailure value)? translation,
    TResult Function(UnknownFailure value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class UnknownFailure implements AppFailure {
  const factory UnknownFailure({final String message}) = _$UnknownFailureImpl;

  String get message;

  /// Create a copy of AppFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnknownFailureImplCopyWith<_$UnknownFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

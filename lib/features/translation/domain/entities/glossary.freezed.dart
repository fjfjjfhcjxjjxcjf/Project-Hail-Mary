// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'glossary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GlossaryEntry _$GlossaryEntryFromJson(Map<String, dynamic> json) {
  return _GlossaryEntry.fromJson(json);
}

/// @nodoc
mixin _$GlossaryEntry {
  String get id => throw _privateConstructorUsedError;
  String get sourceTerm => throw _privateConstructorUsedError;
  String get targetTerm => throw _privateConstructorUsedError;
  String get context => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  bool get caseSensitive => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this GlossaryEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GlossaryEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GlossaryEntryCopyWith<GlossaryEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlossaryEntryCopyWith<$Res> {
  factory $GlossaryEntryCopyWith(
    GlossaryEntry value,
    $Res Function(GlossaryEntry) then,
  ) = _$GlossaryEntryCopyWithImpl<$Res, GlossaryEntry>;
  @useResult
  $Res call({
    String id,
    String sourceTerm,
    String targetTerm,
    String context,
    String notes,
    bool caseSensitive,
    DateTime createdAt,
  });
}

/// @nodoc
class _$GlossaryEntryCopyWithImpl<$Res, $Val extends GlossaryEntry>
    implements $GlossaryEntryCopyWith<$Res> {
  _$GlossaryEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GlossaryEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sourceTerm = null,
    Object? targetTerm = null,
    Object? context = null,
    Object? notes = null,
    Object? caseSensitive = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            sourceTerm: null == sourceTerm
                ? _value.sourceTerm
                : sourceTerm // ignore: cast_nullable_to_non_nullable
                      as String,
            targetTerm: null == targetTerm
                ? _value.targetTerm
                : targetTerm // ignore: cast_nullable_to_non_nullable
                      as String,
            context: null == context
                ? _value.context
                : context // ignore: cast_nullable_to_non_nullable
                      as String,
            notes: null == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String,
            caseSensitive: null == caseSensitive
                ? _value.caseSensitive
                : caseSensitive // ignore: cast_nullable_to_non_nullable
                      as bool,
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
abstract class _$$GlossaryEntryImplCopyWith<$Res>
    implements $GlossaryEntryCopyWith<$Res> {
  factory _$$GlossaryEntryImplCopyWith(
    _$GlossaryEntryImpl value,
    $Res Function(_$GlossaryEntryImpl) then,
  ) = __$$GlossaryEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String sourceTerm,
    String targetTerm,
    String context,
    String notes,
    bool caseSensitive,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$GlossaryEntryImplCopyWithImpl<$Res>
    extends _$GlossaryEntryCopyWithImpl<$Res, _$GlossaryEntryImpl>
    implements _$$GlossaryEntryImplCopyWith<$Res> {
  __$$GlossaryEntryImplCopyWithImpl(
    _$GlossaryEntryImpl _value,
    $Res Function(_$GlossaryEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GlossaryEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sourceTerm = null,
    Object? targetTerm = null,
    Object? context = null,
    Object? notes = null,
    Object? caseSensitive = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$GlossaryEntryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        sourceTerm: null == sourceTerm
            ? _value.sourceTerm
            : sourceTerm // ignore: cast_nullable_to_non_nullable
                  as String,
        targetTerm: null == targetTerm
            ? _value.targetTerm
            : targetTerm // ignore: cast_nullable_to_non_nullable
                  as String,
        context: null == context
            ? _value.context
            : context // ignore: cast_nullable_to_non_nullable
                  as String,
        notes: null == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String,
        caseSensitive: null == caseSensitive
            ? _value.caseSensitive
            : caseSensitive // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$GlossaryEntryImpl implements _GlossaryEntry {
  const _$GlossaryEntryImpl({
    required this.id,
    required this.sourceTerm,
    required this.targetTerm,
    this.context = '',
    this.notes = '',
    this.caseSensitive = false,
    required this.createdAt,
  });

  factory _$GlossaryEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$GlossaryEntryImplFromJson(json);

  @override
  final String id;
  @override
  final String sourceTerm;
  @override
  final String targetTerm;
  @override
  @JsonKey()
  final String context;
  @override
  @JsonKey()
  final String notes;
  @override
  @JsonKey()
  final bool caseSensitive;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'GlossaryEntry(id: $id, sourceTerm: $sourceTerm, targetTerm: $targetTerm, context: $context, notes: $notes, caseSensitive: $caseSensitive, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlossaryEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sourceTerm, sourceTerm) ||
                other.sourceTerm == sourceTerm) &&
            (identical(other.targetTerm, targetTerm) ||
                other.targetTerm == targetTerm) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.caseSensitive, caseSensitive) ||
                other.caseSensitive == caseSensitive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    sourceTerm,
    targetTerm,
    context,
    notes,
    caseSensitive,
    createdAt,
  );

  /// Create a copy of GlossaryEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GlossaryEntryImplCopyWith<_$GlossaryEntryImpl> get copyWith =>
      __$$GlossaryEntryImplCopyWithImpl<_$GlossaryEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GlossaryEntryImplToJson(this);
  }
}

abstract class _GlossaryEntry implements GlossaryEntry {
  const factory _GlossaryEntry({
    required final String id,
    required final String sourceTerm,
    required final String targetTerm,
    final String context,
    final String notes,
    final bool caseSensitive,
    required final DateTime createdAt,
  }) = _$GlossaryEntryImpl;

  factory _GlossaryEntry.fromJson(Map<String, dynamic> json) =
      _$GlossaryEntryImpl.fromJson;

  @override
  String get id;
  @override
  String get sourceTerm;
  @override
  String get targetTerm;
  @override
  String get context;
  @override
  String get notes;
  @override
  bool get caseSensitive;
  @override
  DateTime get createdAt;

  /// Create a copy of GlossaryEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GlossaryEntryImplCopyWith<_$GlossaryEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Glossary _$GlossaryFromJson(Map<String, dynamic> json) {
  return _Glossary.fromJson(json);
}

/// @nodoc
mixin _$Glossary {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get sourceLanguage => throw _privateConstructorUsedError;
  String get targetLanguage => throw _privateConstructorUsedError;
  List<GlossaryEntry> get entries => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Glossary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Glossary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GlossaryCopyWith<Glossary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlossaryCopyWith<$Res> {
  factory $GlossaryCopyWith(Glossary value, $Res Function(Glossary) then) =
      _$GlossaryCopyWithImpl<$Res, Glossary>;
  @useResult
  $Res call({
    String id,
    String name,
    String sourceLanguage,
    String targetLanguage,
    List<GlossaryEntry> entries,
    DateTime createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$GlossaryCopyWithImpl<$Res, $Val extends Glossary>
    implements $GlossaryCopyWith<$Res> {
  _$GlossaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Glossary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sourceLanguage = null,
    Object? targetLanguage = null,
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
            sourceLanguage: null == sourceLanguage
                ? _value.sourceLanguage
                : sourceLanguage // ignore: cast_nullable_to_non_nullable
                      as String,
            targetLanguage: null == targetLanguage
                ? _value.targetLanguage
                : targetLanguage // ignore: cast_nullable_to_non_nullable
                      as String,
            entries: null == entries
                ? _value.entries
                : entries // ignore: cast_nullable_to_non_nullable
                      as List<GlossaryEntry>,
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
abstract class _$$GlossaryImplCopyWith<$Res>
    implements $GlossaryCopyWith<$Res> {
  factory _$$GlossaryImplCopyWith(
    _$GlossaryImpl value,
    $Res Function(_$GlossaryImpl) then,
  ) = __$$GlossaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String sourceLanguage,
    String targetLanguage,
    List<GlossaryEntry> entries,
    DateTime createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$GlossaryImplCopyWithImpl<$Res>
    extends _$GlossaryCopyWithImpl<$Res, _$GlossaryImpl>
    implements _$$GlossaryImplCopyWith<$Res> {
  __$$GlossaryImplCopyWithImpl(
    _$GlossaryImpl _value,
    $Res Function(_$GlossaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Glossary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? sourceLanguage = null,
    Object? targetLanguage = null,
    Object? entries = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$GlossaryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        sourceLanguage: null == sourceLanguage
            ? _value.sourceLanguage
            : sourceLanguage // ignore: cast_nullable_to_non_nullable
                  as String,
        targetLanguage: null == targetLanguage
            ? _value.targetLanguage
            : targetLanguage // ignore: cast_nullable_to_non_nullable
                  as String,
        entries: null == entries
            ? _value._entries
            : entries // ignore: cast_nullable_to_non_nullable
                  as List<GlossaryEntry>,
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
class _$GlossaryImpl implements _Glossary {
  const _$GlossaryImpl({
    required this.id,
    required this.name,
    required this.sourceLanguage,
    required this.targetLanguage,
    final List<GlossaryEntry> entries = const [],
    required this.createdAt,
    this.updatedAt,
  }) : _entries = entries;

  factory _$GlossaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$GlossaryImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String sourceLanguage;
  @override
  final String targetLanguage;
  final List<GlossaryEntry> _entries;
  @override
  @JsonKey()
  List<GlossaryEntry> get entries {
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
    return 'Glossary(id: $id, name: $name, sourceLanguage: $sourceLanguage, targetLanguage: $targetLanguage, entries: $entries, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlossaryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sourceLanguage, sourceLanguage) ||
                other.sourceLanguage == sourceLanguage) &&
            (identical(other.targetLanguage, targetLanguage) ||
                other.targetLanguage == targetLanguage) &&
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
    sourceLanguage,
    targetLanguage,
    const DeepCollectionEquality().hash(_entries),
    createdAt,
    updatedAt,
  );

  /// Create a copy of Glossary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GlossaryImplCopyWith<_$GlossaryImpl> get copyWith =>
      __$$GlossaryImplCopyWithImpl<_$GlossaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GlossaryImplToJson(this);
  }
}

abstract class _Glossary implements Glossary {
  const factory _Glossary({
    required final String id,
    required final String name,
    required final String sourceLanguage,
    required final String targetLanguage,
    final List<GlossaryEntry> entries,
    required final DateTime createdAt,
    final DateTime? updatedAt,
  }) = _$GlossaryImpl;

  factory _Glossary.fromJson(Map<String, dynamic> json) =
      _$GlossaryImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get sourceLanguage;
  @override
  String get targetLanguage;
  @override
  List<GlossaryEntry> get entries;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Glossary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GlossaryImplCopyWith<_$GlossaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

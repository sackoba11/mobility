// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeatureContext _$FeatureContextFromJson(Map<String, dynamic> json) {
  return _FeatureContext.fromJson(json);
}

/// @nodoc
mixin _$FeatureContext {
  String get id => throw _privateConstructorUsedError;
  String get mapboxId => throw _privateConstructorUsedError;
  String? get wikidata => throw _privateConstructorUsedError;
  String get shortCode => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeatureContextCopyWith<FeatureContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatureContextCopyWith<$Res> {
  factory $FeatureContextCopyWith(
          FeatureContext value, $Res Function(FeatureContext) then) =
      _$FeatureContextCopyWithImpl<$Res, FeatureContext>;
  @useResult
  $Res call(
      {String id,
      String mapboxId,
      String? wikidata,
      String shortCode,
      String text});
}

/// @nodoc
class _$FeatureContextCopyWithImpl<$Res, $Val extends FeatureContext>
    implements $FeatureContextCopyWith<$Res> {
  _$FeatureContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mapboxId = null,
    Object? wikidata = freezed,
    Object? shortCode = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mapboxId: null == mapboxId
          ? _value.mapboxId
          : mapboxId // ignore: cast_nullable_to_non_nullable
              as String,
      wikidata: freezed == wikidata
          ? _value.wikidata
          : wikidata // ignore: cast_nullable_to_non_nullable
              as String?,
      shortCode: null == shortCode
          ? _value.shortCode
          : shortCode // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeatureContextImplCopyWith<$Res>
    implements $FeatureContextCopyWith<$Res> {
  factory _$$FeatureContextImplCopyWith(_$FeatureContextImpl value,
          $Res Function(_$FeatureContextImpl) then) =
      __$$FeatureContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String mapboxId,
      String? wikidata,
      String shortCode,
      String text});
}

/// @nodoc
class __$$FeatureContextImplCopyWithImpl<$Res>
    extends _$FeatureContextCopyWithImpl<$Res, _$FeatureContextImpl>
    implements _$$FeatureContextImplCopyWith<$Res> {
  __$$FeatureContextImplCopyWithImpl(
      _$FeatureContextImpl _value, $Res Function(_$FeatureContextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mapboxId = null,
    Object? wikidata = freezed,
    Object? shortCode = null,
    Object? text = null,
  }) {
    return _then(_$FeatureContextImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mapboxId: null == mapboxId
          ? _value.mapboxId
          : mapboxId // ignore: cast_nullable_to_non_nullable
              as String,
      wikidata: freezed == wikidata
          ? _value.wikidata
          : wikidata // ignore: cast_nullable_to_non_nullable
              as String?,
      shortCode: null == shortCode
          ? _value.shortCode
          : shortCode // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeatureContextImpl implements _FeatureContext {
  _$FeatureContextImpl(
      {required this.id,
      required this.mapboxId,
      this.wikidata,
      required this.shortCode,
      required this.text});

  factory _$FeatureContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeatureContextImplFromJson(json);

  @override
  final String id;
  @override
  final String mapboxId;
  @override
  final String? wikidata;
  @override
  final String shortCode;
  @override
  final String text;

  @override
  String toString() {
    return 'FeatureContext(id: $id, mapboxId: $mapboxId, wikidata: $wikidata, shortCode: $shortCode, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeatureContextImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mapboxId, mapboxId) ||
                other.mapboxId == mapboxId) &&
            (identical(other.wikidata, wikidata) ||
                other.wikidata == wikidata) &&
            (identical(other.shortCode, shortCode) ||
                other.shortCode == shortCode) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, mapboxId, wikidata, shortCode, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeatureContextImplCopyWith<_$FeatureContextImpl> get copyWith =>
      __$$FeatureContextImplCopyWithImpl<_$FeatureContextImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeatureContextImplToJson(
      this,
    );
  }
}

abstract class _FeatureContext implements FeatureContext {
  factory _FeatureContext(
      {required final String id,
      required final String mapboxId,
      final String? wikidata,
      required final String shortCode,
      required final String text}) = _$FeatureContextImpl;

  factory _FeatureContext.fromJson(Map<String, dynamic> json) =
      _$FeatureContextImpl.fromJson;

  @override
  String get id;
  @override
  String get mapboxId;
  @override
  String? get wikidata;
  @override
  String get shortCode;
  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$FeatureContextImplCopyWith<_$FeatureContextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

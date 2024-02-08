// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Stop _$StopFromJson(Map<String, dynamic> json) {
  return _Stop.fromJson(json);
}

/// @nodoc
mixin _$Stop {
  String? get label => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get long => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StopCopyWith<Stop> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StopCopyWith<$Res> {
  factory $StopCopyWith(Stop value, $Res Function(Stop) then) =
      _$StopCopyWithImpl<$Res, Stop>;
  @useResult
  $Res call({String? label, double lat, double long});
}

/// @nodoc
class _$StopCopyWithImpl<$Res, $Val extends Stop>
    implements $StopCopyWith<$Res> {
  _$StopCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = freezed,
    Object? lat = null,
    Object? long = null,
  }) {
    return _then(_value.copyWith(
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StopImplCopyWith<$Res> implements $StopCopyWith<$Res> {
  factory _$$StopImplCopyWith(
          _$StopImpl value, $Res Function(_$StopImpl) then) =
      __$$StopImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? label, double lat, double long});
}

/// @nodoc
class __$$StopImplCopyWithImpl<$Res>
    extends _$StopCopyWithImpl<$Res, _$StopImpl>
    implements _$$StopImplCopyWith<$Res> {
  __$$StopImplCopyWithImpl(_$StopImpl _value, $Res Function(_$StopImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = freezed,
    Object? lat = null,
    Object? long = null,
  }) {
    return _then(_$StopImpl(
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StopImpl implements _Stop {
  _$StopImpl({this.label, required this.lat, required this.long});

  factory _$StopImpl.fromJson(Map<String, dynamic> json) =>
      _$$StopImplFromJson(json);

  @override
  final String? label;
  @override
  final double lat;
  @override
  final double long;

  @override
  String toString() {
    return 'Stop(label: $label, lat: $lat, long: $long)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StopImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label, lat, long);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StopImplCopyWith<_$StopImpl> get copyWith =>
      __$$StopImplCopyWithImpl<_$StopImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StopImplToJson(
      this,
    );
  }
}

abstract class _Stop implements Stop {
  factory _Stop(
      {final String? label,
      required final double lat,
      required final double long}) = _$StopImpl;

  factory _Stop.fromJson(Map<String, dynamic> json) = _$StopImpl.fromJson;

  @override
  String? get label;
  @override
  double get lat;
  @override
  double get long;
  @override
  @JsonKey(ignore: true)
  _$$StopImplCopyWith<_$StopImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

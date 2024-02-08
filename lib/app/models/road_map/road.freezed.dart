// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'road.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Road _$RoadFromJson(Map<String, dynamic> json) {
  return _Road.fromJson(json);
}

/// @nodoc
mixin _$Road {
  double get latitude => throw _privateConstructorUsedError;
  double get longitue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoadCopyWith<Road> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoadCopyWith<$Res> {
  factory $RoadCopyWith(Road value, $Res Function(Road) then) =
      _$RoadCopyWithImpl<$Res, Road>;
  @useResult
  $Res call({double latitude, double longitue});
}

/// @nodoc
class _$RoadCopyWithImpl<$Res, $Val extends Road>
    implements $RoadCopyWith<$Res> {
  _$RoadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitue = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitue: null == longitue
          ? _value.longitue
          : longitue // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoadImplCopyWith<$Res> implements $RoadCopyWith<$Res> {
  factory _$$RoadImplCopyWith(
          _$RoadImpl value, $Res Function(_$RoadImpl) then) =
      __$$RoadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitue});
}

/// @nodoc
class __$$RoadImplCopyWithImpl<$Res>
    extends _$RoadCopyWithImpl<$Res, _$RoadImpl>
    implements _$$RoadImplCopyWith<$Res> {
  __$$RoadImplCopyWithImpl(_$RoadImpl _value, $Res Function(_$RoadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitue = null,
  }) {
    return _then(_$RoadImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitue: null == longitue
          ? _value.longitue
          : longitue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoadImpl implements _Road {
  _$RoadImpl({required this.latitude, required this.longitue});

  factory _$RoadImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoadImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitue;

  @override
  String toString() {
    return 'Road(latitude: $latitude, longitue: $longitue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoadImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitue, longitue) ||
                other.longitue == longitue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoadImplCopyWith<_$RoadImpl> get copyWith =>
      __$$RoadImplCopyWithImpl<_$RoadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoadImplToJson(
      this,
    );
  }
}

abstract class _Road implements Road {
  factory _Road(
      {required final double latitude,
      required final double longitue}) = _$RoadImpl;

  factory _Road.fromJson(Map<String, dynamic> json) = _$RoadImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitue;
  @override
  @JsonKey(ignore: true)
  _$$RoadImplCopyWith<_$RoadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

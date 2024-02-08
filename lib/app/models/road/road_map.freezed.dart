// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'road_map.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoadMap _$RoadMapFromJson(Map<String, dynamic> json) {
  return _RoadMap.fromJson(json);
}

/// @nodoc
mixin _$RoadMap {
  Map<String, dynamic> get roadMap => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoadMapCopyWith<RoadMap> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoadMapCopyWith<$Res> {
  factory $RoadMapCopyWith(RoadMap value, $Res Function(RoadMap) then) =
      _$RoadMapCopyWithImpl<$Res, RoadMap>;
  @useResult
  $Res call({Map<String, dynamic> roadMap});
}

/// @nodoc
class _$RoadMapCopyWithImpl<$Res, $Val extends RoadMap>
    implements $RoadMapCopyWith<$Res> {
  _$RoadMapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roadMap = null,
  }) {
    return _then(_value.copyWith(
      roadMap: null == roadMap
          ? _value.roadMap
          : roadMap // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoadMapImplCopyWith<$Res> implements $RoadMapCopyWith<$Res> {
  factory _$$RoadMapImplCopyWith(
          _$RoadMapImpl value, $Res Function(_$RoadMapImpl) then) =
      __$$RoadMapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> roadMap});
}

/// @nodoc
class __$$RoadMapImplCopyWithImpl<$Res>
    extends _$RoadMapCopyWithImpl<$Res, _$RoadMapImpl>
    implements _$$RoadMapImplCopyWith<$Res> {
  __$$RoadMapImplCopyWithImpl(
      _$RoadMapImpl _value, $Res Function(_$RoadMapImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roadMap = null,
  }) {
    return _then(_$RoadMapImpl(
      roadMap: null == roadMap
          ? _value._roadMap
          : roadMap // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoadMapImpl implements _RoadMap {
  _$RoadMapImpl({required final Map<String, dynamic> roadMap})
      : _roadMap = roadMap;

  factory _$RoadMapImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoadMapImplFromJson(json);

  final Map<String, dynamic> _roadMap;
  @override
  Map<String, dynamic> get roadMap {
    if (_roadMap is EqualUnmodifiableMapView) return _roadMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_roadMap);
  }

  @override
  String toString() {
    return 'RoadMap(roadMap: $roadMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoadMapImpl &&
            const DeepCollectionEquality().equals(other._roadMap, _roadMap));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_roadMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoadMapImplCopyWith<_$RoadMapImpl> get copyWith =>
      __$$RoadMapImplCopyWithImpl<_$RoadMapImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoadMapImplToJson(
      this,
    );
  }
}

abstract class _RoadMap implements RoadMap {
  factory _RoadMap({required final Map<String, dynamic> roadMap}) =
      _$RoadMapImpl;

  factory _RoadMap.fromJson(Map<String, dynamic> json) = _$RoadMapImpl.fromJson;

  @override
  Map<String, dynamic> get roadMap;
  @override
  @JsonKey(ignore: true)
  _$$RoadMapImplCopyWith<_$RoadMapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

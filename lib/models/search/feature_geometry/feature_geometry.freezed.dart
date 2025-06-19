// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_geometry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeatureGeometry _$FeatureGeometryFromJson(Map<String, dynamic> json) {
  return _FeatureGeometry.fromJson(json);
}

/// @nodoc
mixin _$FeatureGeometry {
  String get type => throw _privateConstructorUsedError;
  List<double> get coordinates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeatureGeometryCopyWith<FeatureGeometry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatureGeometryCopyWith<$Res> {
  factory $FeatureGeometryCopyWith(
          FeatureGeometry value, $Res Function(FeatureGeometry) then) =
      _$FeatureGeometryCopyWithImpl<$Res, FeatureGeometry>;
  @useResult
  $Res call({String type, List<double> coordinates});
}

/// @nodoc
class _$FeatureGeometryCopyWithImpl<$Res, $Val extends FeatureGeometry>
    implements $FeatureGeometryCopyWith<$Res> {
  _$FeatureGeometryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? coordinates = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeatureGeometryImplCopyWith<$Res>
    implements $FeatureGeometryCopyWith<$Res> {
  factory _$$FeatureGeometryImplCopyWith(_$FeatureGeometryImpl value,
          $Res Function(_$FeatureGeometryImpl) then) =
      __$$FeatureGeometryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, List<double> coordinates});
}

/// @nodoc
class __$$FeatureGeometryImplCopyWithImpl<$Res>
    extends _$FeatureGeometryCopyWithImpl<$Res, _$FeatureGeometryImpl>
    implements _$$FeatureGeometryImplCopyWith<$Res> {
  __$$FeatureGeometryImplCopyWithImpl(
      _$FeatureGeometryImpl _value, $Res Function(_$FeatureGeometryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? coordinates = null,
  }) {
    return _then(_$FeatureGeometryImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _value._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeatureGeometryImpl implements _FeatureGeometry {
  _$FeatureGeometryImpl(
      {required this.type, required final List<double> coordinates})
      : _coordinates = coordinates;

  factory _$FeatureGeometryImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeatureGeometryImplFromJson(json);

  @override
  final String type;
  final List<double> _coordinates;
  @override
  List<double> get coordinates {
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coordinates);
  }

  @override
  String toString() {
    return 'FeatureGeometry(type: $type, coordinates: $coordinates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeatureGeometryImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._coordinates, _coordinates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(_coordinates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeatureGeometryImplCopyWith<_$FeatureGeometryImpl> get copyWith =>
      __$$FeatureGeometryImplCopyWithImpl<_$FeatureGeometryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeatureGeometryImplToJson(
      this,
    );
  }
}

abstract class _FeatureGeometry implements FeatureGeometry {
  factory _FeatureGeometry(
      {required final String type,
      required final List<double> coordinates}) = _$FeatureGeometryImpl;

  factory _FeatureGeometry.fromJson(Map<String, dynamic> json) =
      _$FeatureGeometryImpl.fromJson;

  @override
  String get type;
  @override
  List<double> get coordinates;
  @override
  @JsonKey(ignore: true)
  _$$FeatureGeometryImplCopyWith<_$FeatureGeometryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

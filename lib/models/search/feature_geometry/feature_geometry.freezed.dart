// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_geometry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeatureGeometry {
  String get type;
  List<double> get coordinates;

  /// Create a copy of FeatureGeometry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeatureGeometryCopyWith<FeatureGeometry> get copyWith =>
      _$FeatureGeometryCopyWithImpl<FeatureGeometry>(
          this as FeatureGeometry, _$identity);

  /// Serializes this FeatureGeometry to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeatureGeometry &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other.coordinates, coordinates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(coordinates));

  @override
  String toString() {
    return 'FeatureGeometry(type: $type, coordinates: $coordinates)';
  }
}

/// @nodoc
abstract mixin class $FeatureGeometryCopyWith<$Res> {
  factory $FeatureGeometryCopyWith(
          FeatureGeometry value, $Res Function(FeatureGeometry) _then) =
      _$FeatureGeometryCopyWithImpl;
  @useResult
  $Res call({String type, List<double> coordinates});
}

/// @nodoc
class _$FeatureGeometryCopyWithImpl<$Res>
    implements $FeatureGeometryCopyWith<$Res> {
  _$FeatureGeometryCopyWithImpl(this._self, this._then);

  final FeatureGeometry _self;
  final $Res Function(FeatureGeometry) _then;

  /// Create a copy of FeatureGeometry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? coordinates = null,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _self.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _FeatureGeometry implements FeatureGeometry {
  _FeatureGeometry(
      {required this.type, required final List<double> coordinates})
      : _coordinates = coordinates;
  factory _FeatureGeometry.fromJson(Map<String, dynamic> json) =>
      _$FeatureGeometryFromJson(json);

  @override
  final String type;
  final List<double> _coordinates;
  @override
  List<double> get coordinates {
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coordinates);
  }

  /// Create a copy of FeatureGeometry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FeatureGeometryCopyWith<_FeatureGeometry> get copyWith =>
      __$FeatureGeometryCopyWithImpl<_FeatureGeometry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FeatureGeometryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FeatureGeometry &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._coordinates, _coordinates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(_coordinates));

  @override
  String toString() {
    return 'FeatureGeometry(type: $type, coordinates: $coordinates)';
  }
}

/// @nodoc
abstract mixin class _$FeatureGeometryCopyWith<$Res>
    implements $FeatureGeometryCopyWith<$Res> {
  factory _$FeatureGeometryCopyWith(
          _FeatureGeometry value, $Res Function(_FeatureGeometry) _then) =
      __$FeatureGeometryCopyWithImpl;
  @override
  @useResult
  $Res call({String type, List<double> coordinates});
}

/// @nodoc
class __$FeatureGeometryCopyWithImpl<$Res>
    implements _$FeatureGeometryCopyWith<$Res> {
  __$FeatureGeometryCopyWithImpl(this._self, this._then);

  final _FeatureGeometry _self;
  final $Res Function(_FeatureGeometry) _then;

  /// Create a copy of FeatureGeometry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? coordinates = null,
  }) {
    return _then(_FeatureGeometry(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _self._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

// dart format on

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DataModel _$DataModelFromJson(Map<String, dynamic> json) {
  return _DataModel.fromJson(json);
}

/// @nodoc
mixin _$DataModel {
  List<Waypoints>? get waypoints => throw _privateConstructorUsedError;
  List<Routes>? get routes => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataModelCopyWith<DataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataModelCopyWith<$Res> {
  factory $DataModelCopyWith(DataModel value, $Res Function(DataModel) then) =
      _$DataModelCopyWithImpl<$Res, DataModel>;
  @useResult
  $Res call({List<Waypoints>? waypoints, List<Routes>? routes, String? code});
}

/// @nodoc
class _$DataModelCopyWithImpl<$Res, $Val extends DataModel>
    implements $DataModelCopyWith<$Res> {
  _$DataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? waypoints = freezed,
    Object? routes = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      waypoints: freezed == waypoints
          ? _value.waypoints
          : waypoints // ignore: cast_nullable_to_non_nullable
              as List<Waypoints>?,
      routes: freezed == routes
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<Routes>?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataModelImplCopyWith<$Res>
    implements $DataModelCopyWith<$Res> {
  factory _$$DataModelImplCopyWith(
          _$DataModelImpl value, $Res Function(_$DataModelImpl) then) =
      __$$DataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Waypoints>? waypoints, List<Routes>? routes, String? code});
}

/// @nodoc
class __$$DataModelImplCopyWithImpl<$Res>
    extends _$DataModelCopyWithImpl<$Res, _$DataModelImpl>
    implements _$$DataModelImplCopyWith<$Res> {
  __$$DataModelImplCopyWithImpl(
      _$DataModelImpl _value, $Res Function(_$DataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? waypoints = freezed,
    Object? routes = freezed,
    Object? code = freezed,
  }) {
    return _then(_$DataModelImpl(
      waypoints: freezed == waypoints
          ? _value._waypoints
          : waypoints // ignore: cast_nullable_to_non_nullable
              as List<Waypoints>?,
      routes: freezed == routes
          ? _value._routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<Routes>?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataModelImpl implements _DataModel {
  _$DataModelImpl(
      {final List<Waypoints>? waypoints, final List<Routes>? routes, this.code})
      : _waypoints = waypoints,
        _routes = routes;

  factory _$DataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataModelImplFromJson(json);

  final List<Waypoints>? _waypoints;
  @override
  List<Waypoints>? get waypoints {
    final value = _waypoints;
    if (value == null) return null;
    if (_waypoints is EqualUnmodifiableListView) return _waypoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Routes>? _routes;
  @override
  List<Routes>? get routes {
    final value = _routes;
    if (value == null) return null;
    if (_routes is EqualUnmodifiableListView) return _routes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? code;

  @override
  String toString() {
    return 'DataModel(waypoints: $waypoints, routes: $routes, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataModelImpl &&
            const DeepCollectionEquality()
                .equals(other._waypoints, _waypoints) &&
            const DeepCollectionEquality().equals(other._routes, _routes) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_waypoints),
      const DeepCollectionEquality().hash(_routes),
      code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataModelImplCopyWith<_$DataModelImpl> get copyWith =>
      __$$DataModelImplCopyWithImpl<_$DataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataModelImplToJson(
      this,
    );
  }
}

abstract class _DataModel implements DataModel {
  factory _DataModel(
      {final List<Waypoints>? waypoints,
      final List<Routes>? routes,
      final String? code}) = _$DataModelImpl;

  factory _DataModel.fromJson(Map<String, dynamic> json) =
      _$DataModelImpl.fromJson;

  @override
  List<Waypoints>? get waypoints;
  @override
  List<Routes>? get routes;
  @override
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$DataModelImplCopyWith<_$DataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Waypoints _$WaypointsFromJson(Map<String, dynamic> json) {
  return _Waypoints.fromJson(json);
}

/// @nodoc
mixin _$Waypoints {
  List<double>? get location => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WaypointsCopyWith<Waypoints> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WaypointsCopyWith<$Res> {
  factory $WaypointsCopyWith(Waypoints value, $Res Function(Waypoints) then) =
      _$WaypointsCopyWithImpl<$Res, Waypoints>;
  @useResult
  $Res call({List<double>? location, String? name});
}

/// @nodoc
class _$WaypointsCopyWithImpl<$Res, $Val extends Waypoints>
    implements $WaypointsCopyWith<$Res> {
  _$WaypointsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WaypointsImplCopyWith<$Res>
    implements $WaypointsCopyWith<$Res> {
  factory _$$WaypointsImplCopyWith(
          _$WaypointsImpl value, $Res Function(_$WaypointsImpl) then) =
      __$$WaypointsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<double>? location, String? name});
}

/// @nodoc
class __$$WaypointsImplCopyWithImpl<$Res>
    extends _$WaypointsCopyWithImpl<$Res, _$WaypointsImpl>
    implements _$$WaypointsImplCopyWith<$Res> {
  __$$WaypointsImplCopyWithImpl(
      _$WaypointsImpl _value, $Res Function(_$WaypointsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = freezed,
    Object? name = freezed,
  }) {
    return _then(_$WaypointsImpl(
      location: freezed == location
          ? _value._location
          : location // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WaypointsImpl implements _Waypoints {
  _$WaypointsImpl({final List<double>? location, this.name})
      : _location = location;

  factory _$WaypointsImpl.fromJson(Map<String, dynamic> json) =>
      _$$WaypointsImplFromJson(json);

  final List<double>? _location;
  @override
  List<double>? get location {
    final value = _location;
    if (value == null) return null;
    if (_location is EqualUnmodifiableListView) return _location;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? name;

  @override
  String toString() {
    return 'Waypoints(location: $location, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WaypointsImpl &&
            const DeepCollectionEquality().equals(other._location, _location) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_location), name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WaypointsImplCopyWith<_$WaypointsImpl> get copyWith =>
      __$$WaypointsImplCopyWithImpl<_$WaypointsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WaypointsImplToJson(
      this,
    );
  }
}

abstract class _Waypoints implements Waypoints {
  factory _Waypoints({final List<double>? location, final String? name}) =
      _$WaypointsImpl;

  factory _Waypoints.fromJson(Map<String, dynamic> json) =
      _$WaypointsImpl.fromJson;

  @override
  List<double>? get location;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$WaypointsImplCopyWith<_$WaypointsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Routes _$RoutesFromJson(Map<String, dynamic> json) {
  return _Routes.fromJson(json);
}

/// @nodoc
mixin _$Routes {
  List<Legs>? get legs => throw _privateConstructorUsedError;
  String? get weightName => throw _privateConstructorUsedError;
  Geometry? get geometry => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;
  double? get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoutesCopyWith<Routes> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutesCopyWith<$Res> {
  factory $RoutesCopyWith(Routes value, $Res Function(Routes) then) =
      _$RoutesCopyWithImpl<$Res, Routes>;
  @useResult
  $Res call(
      {List<Legs>? legs,
      String? weightName,
      Geometry? geometry,
      double? weight,
      double? distance,
      double? duration});

  $GeometryCopyWith<$Res>? get geometry;
}

/// @nodoc
class _$RoutesCopyWithImpl<$Res, $Val extends Routes>
    implements $RoutesCopyWith<$Res> {
  _$RoutesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? legs = freezed,
    Object? weightName = freezed,
    Object? geometry = freezed,
    Object? weight = freezed,
    Object? distance = freezed,
    Object? duration = freezed,
  }) {
    return _then(_value.copyWith(
      legs: freezed == legs
          ? _value.legs
          : legs // ignore: cast_nullable_to_non_nullable
              as List<Legs>?,
      weightName: freezed == weightName
          ? _value.weightName
          : weightName // ignore: cast_nullable_to_non_nullable
              as String?,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geometry?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GeometryCopyWith<$Res>? get geometry {
    if (_value.geometry == null) {
      return null;
    }

    return $GeometryCopyWith<$Res>(_value.geometry!, (value) {
      return _then(_value.copyWith(geometry: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RoutesImplCopyWith<$Res> implements $RoutesCopyWith<$Res> {
  factory _$$RoutesImplCopyWith(
          _$RoutesImpl value, $Res Function(_$RoutesImpl) then) =
      __$$RoutesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Legs>? legs,
      String? weightName,
      Geometry? geometry,
      double? weight,
      double? distance,
      double? duration});

  @override
  $GeometryCopyWith<$Res>? get geometry;
}

/// @nodoc
class __$$RoutesImplCopyWithImpl<$Res>
    extends _$RoutesCopyWithImpl<$Res, _$RoutesImpl>
    implements _$$RoutesImplCopyWith<$Res> {
  __$$RoutesImplCopyWithImpl(
      _$RoutesImpl _value, $Res Function(_$RoutesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? legs = freezed,
    Object? weightName = freezed,
    Object? geometry = freezed,
    Object? weight = freezed,
    Object? distance = freezed,
    Object? duration = freezed,
  }) {
    return _then(_$RoutesImpl(
      legs: freezed == legs
          ? _value._legs
          : legs // ignore: cast_nullable_to_non_nullable
              as List<Legs>?,
      weightName: freezed == weightName
          ? _value.weightName
          : weightName // ignore: cast_nullable_to_non_nullable
              as String?,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geometry?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoutesImpl implements _Routes {
  _$RoutesImpl(
      {final List<Legs>? legs,
      this.weightName,
      this.geometry,
      this.weight,
      this.distance,
      this.duration})
      : _legs = legs;

  factory _$RoutesImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoutesImplFromJson(json);

  final List<Legs>? _legs;
  @override
  List<Legs>? get legs {
    final value = _legs;
    if (value == null) return null;
    if (_legs is EqualUnmodifiableListView) return _legs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? weightName;
  @override
  final Geometry? geometry;
  @override
  final double? weight;
  @override
  final double? distance;
  @override
  final double? duration;

  @override
  String toString() {
    return 'Routes(legs: $legs, weightName: $weightName, geometry: $geometry, weight: $weight, distance: $distance, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoutesImpl &&
            const DeepCollectionEquality().equals(other._legs, _legs) &&
            (identical(other.weightName, weightName) ||
                other.weightName == weightName) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_legs),
      weightName,
      geometry,
      weight,
      distance,
      duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoutesImplCopyWith<_$RoutesImpl> get copyWith =>
      __$$RoutesImplCopyWithImpl<_$RoutesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoutesImplToJson(
      this,
    );
  }
}

abstract class _Routes implements Routes {
  factory _Routes(
      {final List<Legs>? legs,
      final String? weightName,
      final Geometry? geometry,
      final double? weight,
      final double? distance,
      final double? duration}) = _$RoutesImpl;

  factory _Routes.fromJson(Map<String, dynamic> json) = _$RoutesImpl.fromJson;

  @override
  List<Legs>? get legs;
  @override
  String? get weightName;
  @override
  Geometry? get geometry;
  @override
  double? get weight;
  @override
  double? get distance;
  @override
  double? get duration;
  @override
  @JsonKey(ignore: true)
  _$$RoutesImplCopyWith<_$RoutesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Legs _$LegsFromJson(Map<String, dynamic> json) {
  return _Legs.fromJson(json);
}

/// @nodoc
mixin _$Legs {
  List<dynamic>? get steps => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;
  String? get summary => throw _privateConstructorUsedError;
  double? get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LegsCopyWith<Legs> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LegsCopyWith<$Res> {
  factory $LegsCopyWith(Legs value, $Res Function(Legs) then) =
      _$LegsCopyWithImpl<$Res, Legs>;
  @useResult
  $Res call(
      {List<dynamic>? steps,
      double? weight,
      double? distance,
      String? summary,
      double? duration});
}

/// @nodoc
class _$LegsCopyWithImpl<$Res, $Val extends Legs>
    implements $LegsCopyWith<$Res> {
  _$LegsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steps = freezed,
    Object? weight = freezed,
    Object? distance = freezed,
    Object? summary = freezed,
    Object? duration = freezed,
  }) {
    return _then(_value.copyWith(
      steps: freezed == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LegsImplCopyWith<$Res> implements $LegsCopyWith<$Res> {
  factory _$$LegsImplCopyWith(
          _$LegsImpl value, $Res Function(_$LegsImpl) then) =
      __$$LegsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<dynamic>? steps,
      double? weight,
      double? distance,
      String? summary,
      double? duration});
}

/// @nodoc
class __$$LegsImplCopyWithImpl<$Res>
    extends _$LegsCopyWithImpl<$Res, _$LegsImpl>
    implements _$$LegsImplCopyWith<$Res> {
  __$$LegsImplCopyWithImpl(_$LegsImpl _value, $Res Function(_$LegsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steps = freezed,
    Object? weight = freezed,
    Object? distance = freezed,
    Object? summary = freezed,
    Object? duration = freezed,
  }) {
    return _then(_$LegsImpl(
      steps: freezed == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LegsImpl implements _Legs {
  _$LegsImpl(
      {final List<dynamic>? steps,
      this.weight,
      this.distance,
      this.summary,
      this.duration})
      : _steps = steps;

  factory _$LegsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LegsImplFromJson(json);

  final List<dynamic>? _steps;
  @override
  List<dynamic>? get steps {
    final value = _steps;
    if (value == null) return null;
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? weight;
  @override
  final double? distance;
  @override
  final String? summary;
  @override
  final double? duration;

  @override
  String toString() {
    return 'Legs(steps: $steps, weight: $weight, distance: $distance, summary: $summary, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LegsImpl &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_steps),
      weight,
      distance,
      summary,
      duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LegsImplCopyWith<_$LegsImpl> get copyWith =>
      __$$LegsImplCopyWithImpl<_$LegsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LegsImplToJson(
      this,
    );
  }
}

abstract class _Legs implements Legs {
  factory _Legs(
      {final List<dynamic>? steps,
      final double? weight,
      final double? distance,
      final String? summary,
      final double? duration}) = _$LegsImpl;

  factory _Legs.fromJson(Map<String, dynamic> json) = _$LegsImpl.fromJson;

  @override
  List<dynamic>? get steps;
  @override
  double? get weight;
  @override
  double? get distance;
  @override
  String? get summary;
  @override
  double? get duration;
  @override
  @JsonKey(ignore: true)
  _$$LegsImplCopyWith<_$LegsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Geometry _$GeometryFromJson(Map<String, dynamic> json) {
  return _Geometry.fromJson(json);
}

/// @nodoc
mixin _$Geometry {
  List<List>? get coordinates => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeometryCopyWith<Geometry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeometryCopyWith<$Res> {
  factory $GeometryCopyWith(Geometry value, $Res Function(Geometry) then) =
      _$GeometryCopyWithImpl<$Res, Geometry>;
  @useResult
  $Res call({List<List>? coordinates, String? type});
}

/// @nodoc
class _$GeometryCopyWithImpl<$Res, $Val extends Geometry>
    implements $GeometryCopyWith<$Res> {
  _$GeometryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coordinates = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      coordinates: freezed == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<List>?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeometryImplCopyWith<$Res>
    implements $GeometryCopyWith<$Res> {
  factory _$$GeometryImplCopyWith(
          _$GeometryImpl value, $Res Function(_$GeometryImpl) then) =
      __$$GeometryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<List>? coordinates, String? type});
}

/// @nodoc
class __$$GeometryImplCopyWithImpl<$Res>
    extends _$GeometryCopyWithImpl<$Res, _$GeometryImpl>
    implements _$$GeometryImplCopyWith<$Res> {
  __$$GeometryImplCopyWithImpl(
      _$GeometryImpl _value, $Res Function(_$GeometryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coordinates = freezed,
    Object? type = freezed,
  }) {
    return _then(_$GeometryImpl(
      coordinates: freezed == coordinates
          ? _value._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<List>?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeometryImpl implements _Geometry {
  _$GeometryImpl({final List<List>? coordinates, this.type})
      : _coordinates = coordinates;

  factory _$GeometryImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeometryImplFromJson(json);

  final List<List>? _coordinates;
  @override
  List<List>? get coordinates {
    final value = _coordinates;
    if (value == null) return null;
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? type;

  @override
  String toString() {
    return 'Geometry(coordinates: $coordinates, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeometryImpl &&
            const DeepCollectionEquality()
                .equals(other._coordinates, _coordinates) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_coordinates), type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeometryImplCopyWith<_$GeometryImpl> get copyWith =>
      __$$GeometryImplCopyWithImpl<_$GeometryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeometryImplToJson(
      this,
    );
  }
}

abstract class _Geometry implements Geometry {
  factory _Geometry({final List<List>? coordinates, final String? type}) =
      _$GeometryImpl;

  factory _Geometry.fromJson(Map<String, dynamic> json) =
      _$GeometryImpl.fromJson;

  @override
  List<List>? get coordinates;
  @override
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$GeometryImplCopyWith<_$GeometryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

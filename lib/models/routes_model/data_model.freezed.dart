// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DataModel {
  List<Waypoints>? get waypoints;
  List<Routes>? get routes;
  String? get code;

  /// Create a copy of DataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DataModelCopyWith<DataModel> get copyWith =>
      _$DataModelCopyWithImpl<DataModel>(this as DataModel, _$identity);

  /// Serializes this DataModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataModel &&
            const DeepCollectionEquality().equals(other.waypoints, waypoints) &&
            const DeepCollectionEquality().equals(other.routes, routes) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(waypoints),
      const DeepCollectionEquality().hash(routes),
      code);

  @override
  String toString() {
    return 'DataModel(waypoints: $waypoints, routes: $routes, code: $code)';
  }
}

/// @nodoc
abstract mixin class $DataModelCopyWith<$Res> {
  factory $DataModelCopyWith(DataModel value, $Res Function(DataModel) _then) =
      _$DataModelCopyWithImpl;
  @useResult
  $Res call({List<Waypoints>? waypoints, List<Routes>? routes, String? code});
}

/// @nodoc
class _$DataModelCopyWithImpl<$Res> implements $DataModelCopyWith<$Res> {
  _$DataModelCopyWithImpl(this._self, this._then);

  final DataModel _self;
  final $Res Function(DataModel) _then;

  /// Create a copy of DataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? waypoints = freezed,
    Object? routes = freezed,
    Object? code = freezed,
  }) {
    return _then(_self.copyWith(
      waypoints: freezed == waypoints
          ? _self.waypoints
          : waypoints // ignore: cast_nullable_to_non_nullable
              as List<Waypoints>?,
      routes: freezed == routes
          ? _self.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<Routes>?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DataModel implements DataModel {
  _DataModel(
      {final List<Waypoints>? waypoints, final List<Routes>? routes, this.code})
      : _waypoints = waypoints,
        _routes = routes;
  factory _DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

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

  /// Create a copy of DataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DataModelCopyWith<_DataModel> get copyWith =>
      __$DataModelCopyWithImpl<_DataModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DataModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DataModel &&
            const DeepCollectionEquality()
                .equals(other._waypoints, _waypoints) &&
            const DeepCollectionEquality().equals(other._routes, _routes) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_waypoints),
      const DeepCollectionEquality().hash(_routes),
      code);

  @override
  String toString() {
    return 'DataModel(waypoints: $waypoints, routes: $routes, code: $code)';
  }
}

/// @nodoc
abstract mixin class _$DataModelCopyWith<$Res>
    implements $DataModelCopyWith<$Res> {
  factory _$DataModelCopyWith(
          _DataModel value, $Res Function(_DataModel) _then) =
      __$DataModelCopyWithImpl;
  @override
  @useResult
  $Res call({List<Waypoints>? waypoints, List<Routes>? routes, String? code});
}

/// @nodoc
class __$DataModelCopyWithImpl<$Res> implements _$DataModelCopyWith<$Res> {
  __$DataModelCopyWithImpl(this._self, this._then);

  final _DataModel _self;
  final $Res Function(_DataModel) _then;

  /// Create a copy of DataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? waypoints = freezed,
    Object? routes = freezed,
    Object? code = freezed,
  }) {
    return _then(_DataModel(
      waypoints: freezed == waypoints
          ? _self._waypoints
          : waypoints // ignore: cast_nullable_to_non_nullable
              as List<Waypoints>?,
      routes: freezed == routes
          ? _self._routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<Routes>?,
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$Waypoints {
  List<double>? get location;
  String? get name;

  /// Create a copy of Waypoints
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WaypointsCopyWith<Waypoints> get copyWith =>
      _$WaypointsCopyWithImpl<Waypoints>(this as Waypoints, _$identity);

  /// Serializes this Waypoints to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Waypoints &&
            const DeepCollectionEquality().equals(other.location, location) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(location), name);

  @override
  String toString() {
    return 'Waypoints(location: $location, name: $name)';
  }
}

/// @nodoc
abstract mixin class $WaypointsCopyWith<$Res> {
  factory $WaypointsCopyWith(Waypoints value, $Res Function(Waypoints) _then) =
      _$WaypointsCopyWithImpl;
  @useResult
  $Res call({List<double>? location, String? name});
}

/// @nodoc
class _$WaypointsCopyWithImpl<$Res> implements $WaypointsCopyWith<$Res> {
  _$WaypointsCopyWithImpl(this._self, this._then);

  final Waypoints _self;
  final $Res Function(Waypoints) _then;

  /// Create a copy of Waypoints
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = freezed,
    Object? name = freezed,
  }) {
    return _then(_self.copyWith(
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Waypoints implements Waypoints {
  _Waypoints({final List<double>? location, this.name}) : _location = location;
  factory _Waypoints.fromJson(Map<String, dynamic> json) =>
      _$WaypointsFromJson(json);

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

  /// Create a copy of Waypoints
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WaypointsCopyWith<_Waypoints> get copyWith =>
      __$WaypointsCopyWithImpl<_Waypoints>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WaypointsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Waypoints &&
            const DeepCollectionEquality().equals(other._location, _location) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_location), name);

  @override
  String toString() {
    return 'Waypoints(location: $location, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$WaypointsCopyWith<$Res>
    implements $WaypointsCopyWith<$Res> {
  factory _$WaypointsCopyWith(
          _Waypoints value, $Res Function(_Waypoints) _then) =
      __$WaypointsCopyWithImpl;
  @override
  @useResult
  $Res call({List<double>? location, String? name});
}

/// @nodoc
class __$WaypointsCopyWithImpl<$Res> implements _$WaypointsCopyWith<$Res> {
  __$WaypointsCopyWithImpl(this._self, this._then);

  final _Waypoints _self;
  final $Res Function(_Waypoints) _then;

  /// Create a copy of Waypoints
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? location = freezed,
    Object? name = freezed,
  }) {
    return _then(_Waypoints(
      location: freezed == location
          ? _self._location
          : location // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$Routes {
  List<Legs>? get legs;
  String? get weightName;
  Geometry? get geometry;
  double? get weight;
  double? get distance;
  double? get duration;

  /// Create a copy of Routes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RoutesCopyWith<Routes> get copyWith =>
      _$RoutesCopyWithImpl<Routes>(this as Routes, _$identity);

  /// Serializes this Routes to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Routes &&
            const DeepCollectionEquality().equals(other.legs, legs) &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(legs),
      weightName,
      geometry,
      weight,
      distance,
      duration);

  @override
  String toString() {
    return 'Routes(legs: $legs, weightName: $weightName, geometry: $geometry, weight: $weight, distance: $distance, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $RoutesCopyWith<$Res> {
  factory $RoutesCopyWith(Routes value, $Res Function(Routes) _then) =
      _$RoutesCopyWithImpl;
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
class _$RoutesCopyWithImpl<$Res> implements $RoutesCopyWith<$Res> {
  _$RoutesCopyWithImpl(this._self, this._then);

  final Routes _self;
  final $Res Function(Routes) _then;

  /// Create a copy of Routes
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      legs: freezed == legs
          ? _self.legs
          : legs // ignore: cast_nullable_to_non_nullable
              as List<Legs>?,
      weightName: freezed == weightName
          ? _self.weightName
          : weightName // ignore: cast_nullable_to_non_nullable
              as String?,
      geometry: freezed == geometry
          ? _self.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geometry?,
      weight: freezed == weight
          ? _self.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: freezed == distance
          ? _self.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      duration: freezed == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }

  /// Create a copy of Routes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeometryCopyWith<$Res>? get geometry {
    if (_self.geometry == null) {
      return null;
    }

    return $GeometryCopyWith<$Res>(_self.geometry!, (value) {
      return _then(_self.copyWith(geometry: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Routes implements Routes {
  _Routes(
      {final List<Legs>? legs,
      this.weightName,
      this.geometry,
      this.weight,
      this.distance,
      this.duration})
      : _legs = legs;
  factory _Routes.fromJson(Map<String, dynamic> json) => _$RoutesFromJson(json);

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

  /// Create a copy of Routes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RoutesCopyWith<_Routes> get copyWith =>
      __$RoutesCopyWithImpl<_Routes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RoutesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Routes &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_legs),
      weightName,
      geometry,
      weight,
      distance,
      duration);

  @override
  String toString() {
    return 'Routes(legs: $legs, weightName: $weightName, geometry: $geometry, weight: $weight, distance: $distance, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class _$RoutesCopyWith<$Res> implements $RoutesCopyWith<$Res> {
  factory _$RoutesCopyWith(_Routes value, $Res Function(_Routes) _then) =
      __$RoutesCopyWithImpl;
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
class __$RoutesCopyWithImpl<$Res> implements _$RoutesCopyWith<$Res> {
  __$RoutesCopyWithImpl(this._self, this._then);

  final _Routes _self;
  final $Res Function(_Routes) _then;

  /// Create a copy of Routes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? legs = freezed,
    Object? weightName = freezed,
    Object? geometry = freezed,
    Object? weight = freezed,
    Object? distance = freezed,
    Object? duration = freezed,
  }) {
    return _then(_Routes(
      legs: freezed == legs
          ? _self._legs
          : legs // ignore: cast_nullable_to_non_nullable
              as List<Legs>?,
      weightName: freezed == weightName
          ? _self.weightName
          : weightName // ignore: cast_nullable_to_non_nullable
              as String?,
      geometry: freezed == geometry
          ? _self.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geometry?,
      weight: freezed == weight
          ? _self.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: freezed == distance
          ? _self.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      duration: freezed == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }

  /// Create a copy of Routes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeometryCopyWith<$Res>? get geometry {
    if (_self.geometry == null) {
      return null;
    }

    return $GeometryCopyWith<$Res>(_self.geometry!, (value) {
      return _then(_self.copyWith(geometry: value));
    });
  }
}

/// @nodoc
mixin _$Legs {
  List? get steps;
  double? get weight;
  double? get distance;
  String? get summary;
  double? get duration;

  /// Create a copy of Legs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LegsCopyWith<Legs> get copyWith =>
      _$LegsCopyWithImpl<Legs>(this as Legs, _$identity);

  /// Serializes this Legs to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Legs &&
            const DeepCollectionEquality().equals(other.steps, steps) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(steps),
      weight,
      distance,
      summary,
      duration);

  @override
  String toString() {
    return 'Legs(steps: $steps, weight: $weight, distance: $distance, summary: $summary, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class $LegsCopyWith<$Res> {
  factory $LegsCopyWith(Legs value, $Res Function(Legs) _then) =
      _$LegsCopyWithImpl;
  @useResult
  $Res call(
      {List? steps,
      double? weight,
      double? distance,
      String? summary,
      double? duration});
}

/// @nodoc
class _$LegsCopyWithImpl<$Res> implements $LegsCopyWith<$Res> {
  _$LegsCopyWithImpl(this._self, this._then);

  final Legs _self;
  final $Res Function(Legs) _then;

  /// Create a copy of Legs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? steps = freezed,
    Object? weight = freezed,
    Object? distance = freezed,
    Object? summary = freezed,
    Object? duration = freezed,
  }) {
    return _then(_self.copyWith(
      steps: freezed == steps
          ? _self.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List?,
      weight: freezed == weight
          ? _self.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: freezed == distance
          ? _self.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      summary: freezed == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Legs implements Legs {
  _Legs(
      {final List? steps,
      this.weight,
      this.distance,
      this.summary,
      this.duration})
      : _steps = steps;
  factory _Legs.fromJson(Map<String, dynamic> json) => _$LegsFromJson(json);

  final List? _steps;
  @override
  List? get steps {
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

  /// Create a copy of Legs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LegsCopyWith<_Legs> get copyWith =>
      __$LegsCopyWithImpl<_Legs>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LegsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Legs &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_steps),
      weight,
      distance,
      summary,
      duration);

  @override
  String toString() {
    return 'Legs(steps: $steps, weight: $weight, distance: $distance, summary: $summary, duration: $duration)';
  }
}

/// @nodoc
abstract mixin class _$LegsCopyWith<$Res> implements $LegsCopyWith<$Res> {
  factory _$LegsCopyWith(_Legs value, $Res Function(_Legs) _then) =
      __$LegsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List? steps,
      double? weight,
      double? distance,
      String? summary,
      double? duration});
}

/// @nodoc
class __$LegsCopyWithImpl<$Res> implements _$LegsCopyWith<$Res> {
  __$LegsCopyWithImpl(this._self, this._then);

  final _Legs _self;
  final $Res Function(_Legs) _then;

  /// Create a copy of Legs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? steps = freezed,
    Object? weight = freezed,
    Object? distance = freezed,
    Object? summary = freezed,
    Object? duration = freezed,
  }) {
    return _then(_Legs(
      steps: freezed == steps
          ? _self._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List?,
      weight: freezed == weight
          ? _self.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: freezed == distance
          ? _self.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      summary: freezed == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
mixin _$Geometry {
  List<List>? get coordinates;
  String? get type;

  /// Create a copy of Geometry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GeometryCopyWith<Geometry> get copyWith =>
      _$GeometryCopyWithImpl<Geometry>(this as Geometry, _$identity);

  /// Serializes this Geometry to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Geometry &&
            const DeepCollectionEquality()
                .equals(other.coordinates, coordinates) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(coordinates), type);

  @override
  String toString() {
    return 'Geometry(coordinates: $coordinates, type: $type)';
  }
}

/// @nodoc
abstract mixin class $GeometryCopyWith<$Res> {
  factory $GeometryCopyWith(Geometry value, $Res Function(Geometry) _then) =
      _$GeometryCopyWithImpl;
  @useResult
  $Res call({List<List>? coordinates, String? type});
}

/// @nodoc
class _$GeometryCopyWithImpl<$Res> implements $GeometryCopyWith<$Res> {
  _$GeometryCopyWithImpl(this._self, this._then);

  final Geometry _self;
  final $Res Function(Geometry) _then;

  /// Create a copy of Geometry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coordinates = freezed,
    Object? type = freezed,
  }) {
    return _then(_self.copyWith(
      coordinates: freezed == coordinates
          ? _self.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<List>?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Geometry implements Geometry {
  _Geometry({final List<List>? coordinates, this.type})
      : _coordinates = coordinates;
  factory _Geometry.fromJson(Map<String, dynamic> json) =>
      _$GeometryFromJson(json);

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

  /// Create a copy of Geometry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GeometryCopyWith<_Geometry> get copyWith =>
      __$GeometryCopyWithImpl<_Geometry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GeometryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Geometry &&
            const DeepCollectionEquality()
                .equals(other._coordinates, _coordinates) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_coordinates), type);

  @override
  String toString() {
    return 'Geometry(coordinates: $coordinates, type: $type)';
  }
}

/// @nodoc
abstract mixin class _$GeometryCopyWith<$Res>
    implements $GeometryCopyWith<$Res> {
  factory _$GeometryCopyWith(_Geometry value, $Res Function(_Geometry) _then) =
      __$GeometryCopyWithImpl;
  @override
  @useResult
  $Res call({List<List>? coordinates, String? type});
}

/// @nodoc
class __$GeometryCopyWithImpl<$Res> implements _$GeometryCopyWith<$Res> {
  __$GeometryCopyWithImpl(this._self, this._then);

  final _Geometry _self;
  final $Res Function(_Geometry) _then;

  /// Create a copy of Geometry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? coordinates = freezed,
    Object? type = freezed,
  }) {
    return _then(_Geometry(
      coordinates: freezed == coordinates
          ? _self._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<List>?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

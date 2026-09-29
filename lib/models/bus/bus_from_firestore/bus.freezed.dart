// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bus.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Bus {

 int get number; String get source; String get destination; bool get isActive; List<Stop> get roadMap;// Référentiel `bus` (scripts/import-bus) : voir BusFromDb.
 String get lineLabel; String get category; String get direction; int get variantIndex; List<String> get stopIds;// Tracé précalculé ([[lng, lat], ...] en mémoire, objets {lng, lat}
// en Firestore). Null tant que le backfill n'est pas passé.
@RouteGeometryConverter() List<List<double>>? get routeGeometry;
/// Create a copy of Bus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BusCopyWith<Bus> get copyWith => _$BusCopyWithImpl<Bus>(this as Bus, _$identity);

  /// Serializes this Bus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Bus&&(identical(other.number, number) || other.number == number)&&(identical(other.source, source) || other.source == source)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other.roadMap, roadMap)&&(identical(other.lineLabel, lineLabel) || other.lineLabel == lineLabel)&&(identical(other.category, category) || other.category == category)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.variantIndex, variantIndex) || other.variantIndex == variantIndex)&&const DeepCollectionEquality().equals(other.stopIds, stopIds)&&const DeepCollectionEquality().equals(other.routeGeometry, routeGeometry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number,source,destination,isActive,const DeepCollectionEquality().hash(roadMap),lineLabel,category,direction,variantIndex,const DeepCollectionEquality().hash(stopIds),const DeepCollectionEquality().hash(routeGeometry));

@override
String toString() {
  return 'Bus(number: $number, source: $source, destination: $destination, isActive: $isActive, roadMap: $roadMap, lineLabel: $lineLabel, category: $category, direction: $direction, variantIndex: $variantIndex, stopIds: $stopIds, routeGeometry: $routeGeometry)';
}


}

/// @nodoc
abstract mixin class $BusCopyWith<$Res>  {
  factory $BusCopyWith(Bus value, $Res Function(Bus) _then) = _$BusCopyWithImpl;
@useResult
$Res call({
 int number, String source, String destination, bool isActive, List<Stop> roadMap, String lineLabel, String category, String direction, int variantIndex, List<String> stopIds,@RouteGeometryConverter() List<List<double>>? routeGeometry
});




}
/// @nodoc
class _$BusCopyWithImpl<$Res>
    implements $BusCopyWith<$Res> {
  _$BusCopyWithImpl(this._self, this._then);

  final Bus _self;
  final $Res Function(Bus) _then;

/// Create a copy of Bus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,Object? source = null,Object? destination = null,Object? isActive = null,Object? roadMap = null,Object? lineLabel = null,Object? category = null,Object? direction = null,Object? variantIndex = null,Object? stopIds = null,Object? routeGeometry = freezed,}) {
  return _then(_self.copyWith(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,roadMap: null == roadMap ? _self.roadMap : roadMap // ignore: cast_nullable_to_non_nullable
as List<Stop>,lineLabel: null == lineLabel ? _self.lineLabel : lineLabel // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as String,variantIndex: null == variantIndex ? _self.variantIndex : variantIndex // ignore: cast_nullable_to_non_nullable
as int,stopIds: null == stopIds ? _self.stopIds : stopIds // ignore: cast_nullable_to_non_nullable
as List<String>,routeGeometry: freezed == routeGeometry ? _self.routeGeometry : routeGeometry // ignore: cast_nullable_to_non_nullable
as List<List<double>>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Bus].
extension BusPatterns on Bus {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Bus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Bus() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Bus value)  $default,){
final _that = this;
switch (_that) {
case _Bus():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Bus value)?  $default,){
final _that = this;
switch (_that) {
case _Bus() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int number,  String source,  String destination,  bool isActive,  List<Stop> roadMap,  String lineLabel,  String category,  String direction,  int variantIndex,  List<String> stopIds, @RouteGeometryConverter()  List<List<double>>? routeGeometry)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Bus() when $default != null:
return $default(_that.number,_that.source,_that.destination,_that.isActive,_that.roadMap,_that.lineLabel,_that.category,_that.direction,_that.variantIndex,_that.stopIds,_that.routeGeometry);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int number,  String source,  String destination,  bool isActive,  List<Stop> roadMap,  String lineLabel,  String category,  String direction,  int variantIndex,  List<String> stopIds, @RouteGeometryConverter()  List<List<double>>? routeGeometry)  $default,) {final _that = this;
switch (_that) {
case _Bus():
return $default(_that.number,_that.source,_that.destination,_that.isActive,_that.roadMap,_that.lineLabel,_that.category,_that.direction,_that.variantIndex,_that.stopIds,_that.routeGeometry);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int number,  String source,  String destination,  bool isActive,  List<Stop> roadMap,  String lineLabel,  String category,  String direction,  int variantIndex,  List<String> stopIds, @RouteGeometryConverter()  List<List<double>>? routeGeometry)?  $default,) {final _that = this;
switch (_that) {
case _Bus() when $default != null:
return $default(_that.number,_that.source,_that.destination,_that.isActive,_that.roadMap,_that.lineLabel,_that.category,_that.direction,_that.variantIndex,_that.stopIds,_that.routeGeometry);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Bus implements Bus {
   _Bus({required this.number, required this.source, required this.destination, required this.isActive, required final  List<Stop> roadMap, this.lineLabel = '', this.category = '', this.direction = '', this.variantIndex = 1, final  List<String> stopIds = const [], @RouteGeometryConverter() required final  List<List<double>>? routeGeometry}): _roadMap = roadMap,_stopIds = stopIds,_routeGeometry = routeGeometry;
  factory _Bus.fromJson(Map<String, dynamic> json) => _$BusFromJson(json);

@override final  int number;
@override final  String source;
@override final  String destination;
@override final  bool isActive;
 final  List<Stop> _roadMap;
@override List<Stop> get roadMap {
  if (_roadMap is EqualUnmodifiableListView) return _roadMap;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roadMap);
}

// Référentiel `bus` (scripts/import-bus) : voir BusFromDb.
@override@JsonKey() final  String lineLabel;
@override@JsonKey() final  String category;
@override@JsonKey() final  String direction;
@override@JsonKey() final  int variantIndex;
 final  List<String> _stopIds;
@override@JsonKey() List<String> get stopIds {
  if (_stopIds is EqualUnmodifiableListView) return _stopIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stopIds);
}

// Tracé précalculé ([[lng, lat], ...] en mémoire, objets {lng, lat}
// en Firestore). Null tant que le backfill n'est pas passé.
 final  List<List<double>>? _routeGeometry;
// Tracé précalculé ([[lng, lat], ...] en mémoire, objets {lng, lat}
// en Firestore). Null tant que le backfill n'est pas passé.
@override@RouteGeometryConverter() List<List<double>>? get routeGeometry {
  final value = _routeGeometry;
  if (value == null) return null;
  if (_routeGeometry is EqualUnmodifiableListView) return _routeGeometry;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Bus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BusCopyWith<_Bus> get copyWith => __$BusCopyWithImpl<_Bus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Bus&&(identical(other.number, number) || other.number == number)&&(identical(other.source, source) || other.source == source)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other._roadMap, _roadMap)&&(identical(other.lineLabel, lineLabel) || other.lineLabel == lineLabel)&&(identical(other.category, category) || other.category == category)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.variantIndex, variantIndex) || other.variantIndex == variantIndex)&&const DeepCollectionEquality().equals(other._stopIds, _stopIds)&&const DeepCollectionEquality().equals(other._routeGeometry, _routeGeometry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number,source,destination,isActive,const DeepCollectionEquality().hash(_roadMap),lineLabel,category,direction,variantIndex,const DeepCollectionEquality().hash(_stopIds),const DeepCollectionEquality().hash(_routeGeometry));

@override
String toString() {
  return 'Bus(number: $number, source: $source, destination: $destination, isActive: $isActive, roadMap: $roadMap, lineLabel: $lineLabel, category: $category, direction: $direction, variantIndex: $variantIndex, stopIds: $stopIds, routeGeometry: $routeGeometry)';
}


}

/// @nodoc
abstract mixin class _$BusCopyWith<$Res> implements $BusCopyWith<$Res> {
  factory _$BusCopyWith(_Bus value, $Res Function(_Bus) _then) = __$BusCopyWithImpl;
@override @useResult
$Res call({
 int number, String source, String destination, bool isActive, List<Stop> roadMap, String lineLabel, String category, String direction, int variantIndex, List<String> stopIds,@RouteGeometryConverter() List<List<double>>? routeGeometry
});




}
/// @nodoc
class __$BusCopyWithImpl<$Res>
    implements _$BusCopyWith<$Res> {
  __$BusCopyWithImpl(this._self, this._then);

  final _Bus _self;
  final $Res Function(_Bus) _then;

/// Create a copy of Bus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,Object? source = null,Object? destination = null,Object? isActive = null,Object? roadMap = null,Object? lineLabel = null,Object? category = null,Object? direction = null,Object? variantIndex = null,Object? stopIds = null,Object? routeGeometry = freezed,}) {
  return _then(_Bus(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,roadMap: null == roadMap ? _self._roadMap : roadMap // ignore: cast_nullable_to_non_nullable
as List<Stop>,lineLabel: null == lineLabel ? _self.lineLabel : lineLabel // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as String,variantIndex: null == variantIndex ? _self.variantIndex : variantIndex // ignore: cast_nullable_to_non_nullable
as int,stopIds: null == stopIds ? _self._stopIds : stopIds // ignore: cast_nullable_to_non_nullable
as List<String>,routeGeometry: freezed == routeGeometry ? _self._routeGeometry : routeGeometry // ignore: cast_nullable_to_non_nullable
as List<List<double>>?,
  ));
}


}

// dart format on

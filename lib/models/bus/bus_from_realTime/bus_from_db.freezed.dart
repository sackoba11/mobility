// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bus_from_db.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BusFromDb {

 int get number; String get source; String get destination; bool get isActive; List<Stop> get roadMap; Stop? get position; DateTime? get startDate;// Chauffeur propriétaire du service (lien service <-> conducteur).
// Null pour les docs historiques (compat ascendante).
 String? get driverUid;// Heartbeat : mis à jour à chaque position (serverTimestamp).
// Null pour les docs historiques.
@TimestampConverter() DateTime? get lastSeen;// Tracé précalculé de la ligne ([[lng, lat], ...], voir
// scripts/backfill-route-geometry). Évite tout appel routing
// au runtime. Null tant que le backfill n'est pas passé.
@RouteGeometryConverter() List<List<double>>? get routeGeometry;// Référentiel `bus` (scripts/import-bus) : affichage fidèle
// ("02"), catégorie (Express/Monbus/...), sens et variante.
// @Default : les docs historiques/activeBus anciens restent lisibles.
 String get lineLabel; String get category; String get direction; int get variantIndex;// Ids OSM des arrêts dans l'ordre (scripts/import-bus/enrich).
// Sert aux requêtes "bus par ici" (arrayContains côté console).
 List<String> get stopIds;
/// Create a copy of BusFromDb
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BusFromDbCopyWith<BusFromDb> get copyWith => _$BusFromDbCopyWithImpl<BusFromDb>(this as BusFromDb, _$identity);

  /// Serializes this BusFromDb to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BusFromDb&&(identical(other.number, number) || other.number == number)&&(identical(other.source, source) || other.source == source)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other.roadMap, roadMap)&&(identical(other.position, position) || other.position == position)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.driverUid, driverUid) || other.driverUid == driverUid)&&(identical(other.lastSeen, lastSeen) || other.lastSeen == lastSeen)&&const DeepCollectionEquality().equals(other.routeGeometry, routeGeometry)&&(identical(other.lineLabel, lineLabel) || other.lineLabel == lineLabel)&&(identical(other.category, category) || other.category == category)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.variantIndex, variantIndex) || other.variantIndex == variantIndex)&&const DeepCollectionEquality().equals(other.stopIds, stopIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number,source,destination,isActive,const DeepCollectionEquality().hash(roadMap),position,startDate,driverUid,lastSeen,const DeepCollectionEquality().hash(routeGeometry),lineLabel,category,direction,variantIndex,const DeepCollectionEquality().hash(stopIds));

@override
String toString() {
  return 'BusFromDb(number: $number, source: $source, destination: $destination, isActive: $isActive, roadMap: $roadMap, position: $position, startDate: $startDate, driverUid: $driverUid, lastSeen: $lastSeen, routeGeometry: $routeGeometry, lineLabel: $lineLabel, category: $category, direction: $direction, variantIndex: $variantIndex, stopIds: $stopIds)';
}


}

/// @nodoc
abstract mixin class $BusFromDbCopyWith<$Res>  {
  factory $BusFromDbCopyWith(BusFromDb value, $Res Function(BusFromDb) _then) = _$BusFromDbCopyWithImpl;
@useResult
$Res call({
 int number, String source, String destination, bool isActive, List<Stop> roadMap, Stop? position, DateTime? startDate, String? driverUid,@TimestampConverter() DateTime? lastSeen,@RouteGeometryConverter() List<List<double>>? routeGeometry, String lineLabel, String category, String direction, int variantIndex, List<String> stopIds
});


$StopCopyWith<$Res>? get position;

}
/// @nodoc
class _$BusFromDbCopyWithImpl<$Res>
    implements $BusFromDbCopyWith<$Res> {
  _$BusFromDbCopyWithImpl(this._self, this._then);

  final BusFromDb _self;
  final $Res Function(BusFromDb) _then;

/// Create a copy of BusFromDb
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,Object? source = null,Object? destination = null,Object? isActive = null,Object? roadMap = null,Object? position = freezed,Object? startDate = freezed,Object? driverUid = freezed,Object? lastSeen = freezed,Object? routeGeometry = freezed,Object? lineLabel = null,Object? category = null,Object? direction = null,Object? variantIndex = null,Object? stopIds = null,}) {
  return _then(_self.copyWith(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,roadMap: null == roadMap ? _self.roadMap : roadMap // ignore: cast_nullable_to_non_nullable
as List<Stop>,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Stop?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,driverUid: freezed == driverUid ? _self.driverUid : driverUid // ignore: cast_nullable_to_non_nullable
as String?,lastSeen: freezed == lastSeen ? _self.lastSeen : lastSeen // ignore: cast_nullable_to_non_nullable
as DateTime?,routeGeometry: freezed == routeGeometry ? _self.routeGeometry : routeGeometry // ignore: cast_nullable_to_non_nullable
as List<List<double>>?,lineLabel: null == lineLabel ? _self.lineLabel : lineLabel // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as String,variantIndex: null == variantIndex ? _self.variantIndex : variantIndex // ignore: cast_nullable_to_non_nullable
as int,stopIds: null == stopIds ? _self.stopIds : stopIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of BusFromDb
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StopCopyWith<$Res>? get position {
    if (_self.position == null) {
    return null;
  }

  return $StopCopyWith<$Res>(_self.position!, (value) {
    return _then(_self.copyWith(position: value));
  });
}
}


/// Adds pattern-matching-related methods to [BusFromDb].
extension BusFromDbPatterns on BusFromDb {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BusFromDb value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BusFromDb() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BusFromDb value)  $default,){
final _that = this;
switch (_that) {
case _BusFromDb():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BusFromDb value)?  $default,){
final _that = this;
switch (_that) {
case _BusFromDb() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int number,  String source,  String destination,  bool isActive,  List<Stop> roadMap,  Stop? position,  DateTime? startDate,  String? driverUid, @TimestampConverter()  DateTime? lastSeen, @RouteGeometryConverter()  List<List<double>>? routeGeometry,  String lineLabel,  String category,  String direction,  int variantIndex,  List<String> stopIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BusFromDb() when $default != null:
return $default(_that.number,_that.source,_that.destination,_that.isActive,_that.roadMap,_that.position,_that.startDate,_that.driverUid,_that.lastSeen,_that.routeGeometry,_that.lineLabel,_that.category,_that.direction,_that.variantIndex,_that.stopIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int number,  String source,  String destination,  bool isActive,  List<Stop> roadMap,  Stop? position,  DateTime? startDate,  String? driverUid, @TimestampConverter()  DateTime? lastSeen, @RouteGeometryConverter()  List<List<double>>? routeGeometry,  String lineLabel,  String category,  String direction,  int variantIndex,  List<String> stopIds)  $default,) {final _that = this;
switch (_that) {
case _BusFromDb():
return $default(_that.number,_that.source,_that.destination,_that.isActive,_that.roadMap,_that.position,_that.startDate,_that.driverUid,_that.lastSeen,_that.routeGeometry,_that.lineLabel,_that.category,_that.direction,_that.variantIndex,_that.stopIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int number,  String source,  String destination,  bool isActive,  List<Stop> roadMap,  Stop? position,  DateTime? startDate,  String? driverUid, @TimestampConverter()  DateTime? lastSeen, @RouteGeometryConverter()  List<List<double>>? routeGeometry,  String lineLabel,  String category,  String direction,  int variantIndex,  List<String> stopIds)?  $default,) {final _that = this;
switch (_that) {
case _BusFromDb() when $default != null:
return $default(_that.number,_that.source,_that.destination,_that.isActive,_that.roadMap,_that.position,_that.startDate,_that.driverUid,_that.lastSeen,_that.routeGeometry,_that.lineLabel,_that.category,_that.direction,_that.variantIndex,_that.stopIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BusFromDb implements BusFromDb {
   _BusFromDb({required this.number, required this.source, required this.destination, required this.isActive, required final  List<Stop> roadMap, required this.position, required this.startDate, required this.driverUid, @TimestampConverter() required this.lastSeen, @RouteGeometryConverter() required final  List<List<double>>? routeGeometry, this.lineLabel = '', this.category = '', this.direction = '', this.variantIndex = 1, final  List<String> stopIds = const []}): _roadMap = roadMap,_routeGeometry = routeGeometry,_stopIds = stopIds;
  factory _BusFromDb.fromJson(Map<String, dynamic> json) => _$BusFromDbFromJson(json);

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

@override final  Stop? position;
@override final  DateTime? startDate;
// Chauffeur propriétaire du service (lien service <-> conducteur).
// Null pour les docs historiques (compat ascendante).
@override final  String? driverUid;
// Heartbeat : mis à jour à chaque position (serverTimestamp).
// Null pour les docs historiques.
@override@TimestampConverter() final  DateTime? lastSeen;
// Tracé précalculé de la ligne ([[lng, lat], ...], voir
// scripts/backfill-route-geometry). Évite tout appel routing
// au runtime. Null tant que le backfill n'est pas passé.
 final  List<List<double>>? _routeGeometry;
// Tracé précalculé de la ligne ([[lng, lat], ...], voir
// scripts/backfill-route-geometry). Évite tout appel routing
// au runtime. Null tant que le backfill n'est pas passé.
@override@RouteGeometryConverter() List<List<double>>? get routeGeometry {
  final value = _routeGeometry;
  if (value == null) return null;
  if (_routeGeometry is EqualUnmodifiableListView) return _routeGeometry;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

// Référentiel `bus` (scripts/import-bus) : affichage fidèle
// ("02"), catégorie (Express/Monbus/...), sens et variante.
// @Default : les docs historiques/activeBus anciens restent lisibles.
@override@JsonKey() final  String lineLabel;
@override@JsonKey() final  String category;
@override@JsonKey() final  String direction;
@override@JsonKey() final  int variantIndex;
// Ids OSM des arrêts dans l'ordre (scripts/import-bus/enrich).
// Sert aux requêtes "bus par ici" (arrayContains côté console).
 final  List<String> _stopIds;
// Ids OSM des arrêts dans l'ordre (scripts/import-bus/enrich).
// Sert aux requêtes "bus par ici" (arrayContains côté console).
@override@JsonKey() List<String> get stopIds {
  if (_stopIds is EqualUnmodifiableListView) return _stopIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stopIds);
}


/// Create a copy of BusFromDb
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BusFromDbCopyWith<_BusFromDb> get copyWith => __$BusFromDbCopyWithImpl<_BusFromDb>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BusFromDbToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BusFromDb&&(identical(other.number, number) || other.number == number)&&(identical(other.source, source) || other.source == source)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other._roadMap, _roadMap)&&(identical(other.position, position) || other.position == position)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.driverUid, driverUid) || other.driverUid == driverUid)&&(identical(other.lastSeen, lastSeen) || other.lastSeen == lastSeen)&&const DeepCollectionEquality().equals(other._routeGeometry, _routeGeometry)&&(identical(other.lineLabel, lineLabel) || other.lineLabel == lineLabel)&&(identical(other.category, category) || other.category == category)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.variantIndex, variantIndex) || other.variantIndex == variantIndex)&&const DeepCollectionEquality().equals(other._stopIds, _stopIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number,source,destination,isActive,const DeepCollectionEquality().hash(_roadMap),position,startDate,driverUid,lastSeen,const DeepCollectionEquality().hash(_routeGeometry),lineLabel,category,direction,variantIndex,const DeepCollectionEquality().hash(_stopIds));

@override
String toString() {
  return 'BusFromDb(number: $number, source: $source, destination: $destination, isActive: $isActive, roadMap: $roadMap, position: $position, startDate: $startDate, driverUid: $driverUid, lastSeen: $lastSeen, routeGeometry: $routeGeometry, lineLabel: $lineLabel, category: $category, direction: $direction, variantIndex: $variantIndex, stopIds: $stopIds)';
}


}

/// @nodoc
abstract mixin class _$BusFromDbCopyWith<$Res> implements $BusFromDbCopyWith<$Res> {
  factory _$BusFromDbCopyWith(_BusFromDb value, $Res Function(_BusFromDb) _then) = __$BusFromDbCopyWithImpl;
@override @useResult
$Res call({
 int number, String source, String destination, bool isActive, List<Stop> roadMap, Stop? position, DateTime? startDate, String? driverUid,@TimestampConverter() DateTime? lastSeen,@RouteGeometryConverter() List<List<double>>? routeGeometry, String lineLabel, String category, String direction, int variantIndex, List<String> stopIds
});


@override $StopCopyWith<$Res>? get position;

}
/// @nodoc
class __$BusFromDbCopyWithImpl<$Res>
    implements _$BusFromDbCopyWith<$Res> {
  __$BusFromDbCopyWithImpl(this._self, this._then);

  final _BusFromDb _self;
  final $Res Function(_BusFromDb) _then;

/// Create a copy of BusFromDb
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,Object? source = null,Object? destination = null,Object? isActive = null,Object? roadMap = null,Object? position = freezed,Object? startDate = freezed,Object? driverUid = freezed,Object? lastSeen = freezed,Object? routeGeometry = freezed,Object? lineLabel = null,Object? category = null,Object? direction = null,Object? variantIndex = null,Object? stopIds = null,}) {
  return _then(_BusFromDb(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,roadMap: null == roadMap ? _self._roadMap : roadMap // ignore: cast_nullable_to_non_nullable
as List<Stop>,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Stop?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,driverUid: freezed == driverUid ? _self.driverUid : driverUid // ignore: cast_nullable_to_non_nullable
as String?,lastSeen: freezed == lastSeen ? _self.lastSeen : lastSeen // ignore: cast_nullable_to_non_nullable
as DateTime?,routeGeometry: freezed == routeGeometry ? _self._routeGeometry : routeGeometry // ignore: cast_nullable_to_non_nullable
as List<List<double>>?,lineLabel: null == lineLabel ? _self.lineLabel : lineLabel // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as String,variantIndex: null == variantIndex ? _self.variantIndex : variantIndex // ignore: cast_nullable_to_non_nullable
as int,stopIds: null == stopIds ? _self._stopIds : stopIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of BusFromDb
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StopCopyWith<$Res>? get position {
    if (_self.position == null) {
    return null;
  }

  return $StopCopyWith<$Res>(_self.position!, (value) {
    return _then(_self.copyWith(position: value));
  });
}
}

// dart format on

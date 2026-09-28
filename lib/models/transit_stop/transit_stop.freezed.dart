// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transit_stop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransitStop {

 String get osmId; String get name;// 'stop' | 'gare' | 'boat' (voir scripts/import-sotra-stops).
 String get kind; double get lat; double get lng;
/// Create a copy of TransitStop
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransitStopCopyWith<TransitStop> get copyWith => _$TransitStopCopyWithImpl<TransitStop>(this as TransitStop, _$identity);

  /// Serializes this TransitStop to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransitStop&&(identical(other.osmId, osmId) || other.osmId == osmId)&&(identical(other.name, name) || other.name == name)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,osmId,name,kind,lat,lng);

@override
String toString() {
  return 'TransitStop(osmId: $osmId, name: $name, kind: $kind, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class $TransitStopCopyWith<$Res>  {
  factory $TransitStopCopyWith(TransitStop value, $Res Function(TransitStop) _then) = _$TransitStopCopyWithImpl;
@useResult
$Res call({
 String osmId, String name, String kind, double lat, double lng
});




}
/// @nodoc
class _$TransitStopCopyWithImpl<$Res>
    implements $TransitStopCopyWith<$Res> {
  _$TransitStopCopyWithImpl(this._self, this._then);

  final TransitStop _self;
  final $Res Function(TransitStop) _then;

/// Create a copy of TransitStop
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? osmId = null,Object? name = null,Object? kind = null,Object? lat = null,Object? lng = null,}) {
  return _then(_self.copyWith(
osmId: null == osmId ? _self.osmId : osmId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [TransitStop].
extension TransitStopPatterns on TransitStop {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransitStop value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransitStop() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransitStop value)  $default,){
final _that = this;
switch (_that) {
case _TransitStop():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransitStop value)?  $default,){
final _that = this;
switch (_that) {
case _TransitStop() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String osmId,  String name,  String kind,  double lat,  double lng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransitStop() when $default != null:
return $default(_that.osmId,_that.name,_that.kind,_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String osmId,  String name,  String kind,  double lat,  double lng)  $default,) {final _that = this;
switch (_that) {
case _TransitStop():
return $default(_that.osmId,_that.name,_that.kind,_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String osmId,  String name,  String kind,  double lat,  double lng)?  $default,) {final _that = this;
switch (_that) {
case _TransitStop() when $default != null:
return $default(_that.osmId,_that.name,_that.kind,_that.lat,_that.lng);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransitStop implements TransitStop {
   _TransitStop({required this.osmId, required this.name, required this.kind, required this.lat, required this.lng});
  factory _TransitStop.fromJson(Map<String, dynamic> json) => _$TransitStopFromJson(json);

@override final  String osmId;
@override final  String name;
// 'stop' | 'gare' | 'boat' (voir scripts/import-sotra-stops).
@override final  String kind;
@override final  double lat;
@override final  double lng;

/// Create a copy of TransitStop
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransitStopCopyWith<_TransitStop> get copyWith => __$TransitStopCopyWithImpl<_TransitStop>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransitStopToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransitStop&&(identical(other.osmId, osmId) || other.osmId == osmId)&&(identical(other.name, name) || other.name == name)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,osmId,name,kind,lat,lng);

@override
String toString() {
  return 'TransitStop(osmId: $osmId, name: $name, kind: $kind, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class _$TransitStopCopyWith<$Res> implements $TransitStopCopyWith<$Res> {
  factory _$TransitStopCopyWith(_TransitStop value, $Res Function(_TransitStop) _then) = __$TransitStopCopyWithImpl;
@override @useResult
$Res call({
 String osmId, String name, String kind, double lat, double lng
});




}
/// @nodoc
class __$TransitStopCopyWithImpl<$Res>
    implements _$TransitStopCopyWith<$Res> {
  __$TransitStopCopyWithImpl(this._self, this._then);

  final _TransitStop _self;
  final $Res Function(_TransitStop) _then;

/// Create a copy of TransitStop
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? osmId = null,Object? name = null,Object? kind = null,Object? lat = null,Object? lng = null,}) {
  return _then(_TransitStop(
osmId: null == osmId ? _self.osmId : osmId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on

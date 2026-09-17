// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gare_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GareLocation {

 String? get label; double get lat; double get long;
/// Create a copy of GareLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GareLocationCopyWith<GareLocation> get copyWith => _$GareLocationCopyWithImpl<GareLocation>(this as GareLocation, _$identity);

  /// Serializes this GareLocation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GareLocation&&(identical(other.label, label) || other.label == label)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.long, long) || other.long == long));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,lat,long);

@override
String toString() {
  return 'GareLocation(label: $label, lat: $lat, long: $long)';
}


}

/// @nodoc
abstract mixin class $GareLocationCopyWith<$Res>  {
  factory $GareLocationCopyWith(GareLocation value, $Res Function(GareLocation) _then) = _$GareLocationCopyWithImpl;
@useResult
$Res call({
 String? label, double lat, double long
});




}
/// @nodoc
class _$GareLocationCopyWithImpl<$Res>
    implements $GareLocationCopyWith<$Res> {
  _$GareLocationCopyWithImpl(this._self, this._then);

  final GareLocation _self;
  final $Res Function(GareLocation) _then;

/// Create a copy of GareLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = freezed,Object? lat = null,Object? long = null,}) {
  return _then(_self.copyWith(
label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,long: null == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [GareLocation].
extension GareLocationPatterns on GareLocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GareLocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GareLocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GareLocation value)  $default,){
final _that = this;
switch (_that) {
case _GareLocation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GareLocation value)?  $default,){
final _that = this;
switch (_that) {
case _GareLocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? label,  double lat,  double long)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GareLocation() when $default != null:
return $default(_that.label,_that.lat,_that.long);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? label,  double lat,  double long)  $default,) {final _that = this;
switch (_that) {
case _GareLocation():
return $default(_that.label,_that.lat,_that.long);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? label,  double lat,  double long)?  $default,) {final _that = this;
switch (_that) {
case _GareLocation() when $default != null:
return $default(_that.label,_that.lat,_that.long);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GareLocation implements GareLocation {
   _GareLocation({this.label, required this.lat, required this.long});
  factory _GareLocation.fromJson(Map<String, dynamic> json) => _$GareLocationFromJson(json);

@override final  String? label;
@override final  double lat;
@override final  double long;

/// Create a copy of GareLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GareLocationCopyWith<_GareLocation> get copyWith => __$GareLocationCopyWithImpl<_GareLocation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GareLocationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GareLocation&&(identical(other.label, label) || other.label == label)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.long, long) || other.long == long));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,lat,long);

@override
String toString() {
  return 'GareLocation(label: $label, lat: $lat, long: $long)';
}


}

/// @nodoc
abstract mixin class _$GareLocationCopyWith<$Res> implements $GareLocationCopyWith<$Res> {
  factory _$GareLocationCopyWith(_GareLocation value, $Res Function(_GareLocation) _then) = __$GareLocationCopyWithImpl;
@override @useResult
$Res call({
 String? label, double lat, double long
});




}
/// @nodoc
class __$GareLocationCopyWithImpl<$Res>
    implements _$GareLocationCopyWith<$Res> {
  __$GareLocationCopyWithImpl(this._self, this._then);

  final _GareLocation _self;
  final $Res Function(_GareLocation) _then;

/// Create a copy of GareLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = freezed,Object? lat = null,Object? long = null,}) {
  return _then(_GareLocation(
label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,long: null == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on

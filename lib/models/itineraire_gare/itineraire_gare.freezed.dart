// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'itineraire_gare.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ItineraireGare {

 Gare get source; Gare get destination;@TransportTypeConverter() TransportType get type; String get commune;
/// Create a copy of ItineraireGare
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItineraireGareCopyWith<ItineraireGare> get copyWith => _$ItineraireGareCopyWithImpl<ItineraireGare>(this as ItineraireGare, _$identity);

  /// Serializes this ItineraireGare to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItineraireGare&&(identical(other.source, source) || other.source == source)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.type, type) || other.type == type)&&(identical(other.commune, commune) || other.commune == commune));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,source,destination,type,commune);

@override
String toString() {
  return 'ItineraireGare(source: $source, destination: $destination, type: $type, commune: $commune)';
}


}

/// @nodoc
abstract mixin class $ItineraireGareCopyWith<$Res>  {
  factory $ItineraireGareCopyWith(ItineraireGare value, $Res Function(ItineraireGare) _then) = _$ItineraireGareCopyWithImpl;
@useResult
$Res call({
 Gare source, Gare destination,@TransportTypeConverter() TransportType type, String commune
});


$GareCopyWith<$Res> get source;$GareCopyWith<$Res> get destination;

}
/// @nodoc
class _$ItineraireGareCopyWithImpl<$Res>
    implements $ItineraireGareCopyWith<$Res> {
  _$ItineraireGareCopyWithImpl(this._self, this._then);

  final ItineraireGare _self;
  final $Res Function(ItineraireGare) _then;

/// Create a copy of ItineraireGare
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? source = null,Object? destination = null,Object? type = null,Object? commune = null,}) {
  return _then(_self.copyWith(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as Gare,destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as Gare,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransportType,commune: null == commune ? _self.commune : commune // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of ItineraireGare
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GareCopyWith<$Res> get source {
  
  return $GareCopyWith<$Res>(_self.source, (value) {
    return _then(_self.copyWith(source: value));
  });
}/// Create a copy of ItineraireGare
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GareCopyWith<$Res> get destination {
  
  return $GareCopyWith<$Res>(_self.destination, (value) {
    return _then(_self.copyWith(destination: value));
  });
}
}


/// Adds pattern-matching-related methods to [ItineraireGare].
extension ItineraireGarePatterns on ItineraireGare {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ItineraireGare value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ItineraireGare() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ItineraireGare value)  $default,){
final _that = this;
switch (_that) {
case _ItineraireGare():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ItineraireGare value)?  $default,){
final _that = this;
switch (_that) {
case _ItineraireGare() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Gare source,  Gare destination, @TransportTypeConverter()  TransportType type,  String commune)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItineraireGare() when $default != null:
return $default(_that.source,_that.destination,_that.type,_that.commune);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Gare source,  Gare destination, @TransportTypeConverter()  TransportType type,  String commune)  $default,) {final _that = this;
switch (_that) {
case _ItineraireGare():
return $default(_that.source,_that.destination,_that.type,_that.commune);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Gare source,  Gare destination, @TransportTypeConverter()  TransportType type,  String commune)?  $default,) {final _that = this;
switch (_that) {
case _ItineraireGare() when $default != null:
return $default(_that.source,_that.destination,_that.type,_that.commune);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ItineraireGare implements ItineraireGare {
   _ItineraireGare({required this.source, required this.destination, @TransportTypeConverter() required this.type, required this.commune});
  factory _ItineraireGare.fromJson(Map<String, dynamic> json) => _$ItineraireGareFromJson(json);

@override final  Gare source;
@override final  Gare destination;
@override@TransportTypeConverter() final  TransportType type;
@override final  String commune;

/// Create a copy of ItineraireGare
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItineraireGareCopyWith<_ItineraireGare> get copyWith => __$ItineraireGareCopyWithImpl<_ItineraireGare>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItineraireGareToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItineraireGare&&(identical(other.source, source) || other.source == source)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.type, type) || other.type == type)&&(identical(other.commune, commune) || other.commune == commune));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,source,destination,type,commune);

@override
String toString() {
  return 'ItineraireGare(source: $source, destination: $destination, type: $type, commune: $commune)';
}


}

/// @nodoc
abstract mixin class _$ItineraireGareCopyWith<$Res> implements $ItineraireGareCopyWith<$Res> {
  factory _$ItineraireGareCopyWith(_ItineraireGare value, $Res Function(_ItineraireGare) _then) = __$ItineraireGareCopyWithImpl;
@override @useResult
$Res call({
 Gare source, Gare destination,@TransportTypeConverter() TransportType type, String commune
});


@override $GareCopyWith<$Res> get source;@override $GareCopyWith<$Res> get destination;

}
/// @nodoc
class __$ItineraireGareCopyWithImpl<$Res>
    implements _$ItineraireGareCopyWith<$Res> {
  __$ItineraireGareCopyWithImpl(this._self, this._then);

  final _ItineraireGare _self;
  final $Res Function(_ItineraireGare) _then;

/// Create a copy of ItineraireGare
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? source = null,Object? destination = null,Object? type = null,Object? commune = null,}) {
  return _then(_ItineraireGare(
source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as Gare,destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as Gare,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransportType,commune: null == commune ? _self.commune : commune // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ItineraireGare
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GareCopyWith<$Res> get source {
  
  return $GareCopyWith<$Res>(_self.source, (value) {
    return _then(_self.copyWith(source: value));
  });
}/// Create a copy of ItineraireGare
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GareCopyWith<$Res> get destination {
  
  return $GareCopyWith<$Res>(_self.destination, (value) {
    return _then(_self.copyWith(destination: value));
  });
}
}

// dart format on

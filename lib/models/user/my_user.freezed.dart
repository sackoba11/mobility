// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyUser {

 String get uid; String get name; String get email; bool get isDriver;
/// Create a copy of MyUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyUserCopyWith<MyUser> get copyWith => _$MyUserCopyWithImpl<MyUser>(this as MyUser, _$identity);

  /// Serializes this MyUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyUser&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.isDriver, isDriver) || other.isDriver == isDriver));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,name,email,isDriver);

@override
String toString() {
  return 'MyUser(uid: $uid, name: $name, email: $email, isDriver: $isDriver)';
}


}

/// @nodoc
abstract mixin class $MyUserCopyWith<$Res>  {
  factory $MyUserCopyWith(MyUser value, $Res Function(MyUser) _then) = _$MyUserCopyWithImpl;
@useResult
$Res call({
 String uid, String name, String email, bool isDriver
});




}
/// @nodoc
class _$MyUserCopyWithImpl<$Res>
    implements $MyUserCopyWith<$Res> {
  _$MyUserCopyWithImpl(this._self, this._then);

  final MyUser _self;
  final $Res Function(MyUser) _then;

/// Create a copy of MyUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? name = null,Object? email = null,Object? isDriver = null,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,isDriver: null == isDriver ? _self.isDriver : isDriver // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MyUser].
extension MyUserPatterns on MyUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyUser value)  $default,){
final _that = this;
switch (_that) {
case _MyUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyUser value)?  $default,){
final _that = this;
switch (_that) {
case _MyUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  String name,  String email,  bool isDriver)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyUser() when $default != null:
return $default(_that.uid,_that.name,_that.email,_that.isDriver);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  String name,  String email,  bool isDriver)  $default,) {final _that = this;
switch (_that) {
case _MyUser():
return $default(_that.uid,_that.name,_that.email,_that.isDriver);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  String name,  String email,  bool isDriver)?  $default,) {final _that = this;
switch (_that) {
case _MyUser() when $default != null:
return $default(_that.uid,_that.name,_that.email,_that.isDriver);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyUser implements MyUser {
   _MyUser({required this.uid, required this.name, required this.email, required this.isDriver});
  factory _MyUser.fromJson(Map<String, dynamic> json) => _$MyUserFromJson(json);

@override final  String uid;
@override final  String name;
@override final  String email;
@override final  bool isDriver;

/// Create a copy of MyUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyUserCopyWith<_MyUser> get copyWith => __$MyUserCopyWithImpl<_MyUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyUser&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.isDriver, isDriver) || other.isDriver == isDriver));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,name,email,isDriver);

@override
String toString() {
  return 'MyUser(uid: $uid, name: $name, email: $email, isDriver: $isDriver)';
}


}

/// @nodoc
abstract mixin class _$MyUserCopyWith<$Res> implements $MyUserCopyWith<$Res> {
  factory _$MyUserCopyWith(_MyUser value, $Res Function(_MyUser) _then) = __$MyUserCopyWithImpl;
@override @useResult
$Res call({
 String uid, String name, String email, bool isDriver
});




}
/// @nodoc
class __$MyUserCopyWithImpl<$Res>
    implements _$MyUserCopyWith<$Res> {
  __$MyUserCopyWithImpl(this._self, this._then);

  final _MyUser _self;
  final $Res Function(_MyUser) _then;

/// Create a copy of MyUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? name = null,Object? email = null,Object? isDriver = null,}) {
  return _then(_MyUser(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,isDriver: null == isDriver ? _self.isDriver : isDriver // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

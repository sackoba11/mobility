// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gare.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Gare _$GareFromJson(Map<String, dynamic> json) {
  return _Gare.fromJson(json);
}

/// @nodoc
mixin _$Gare {
  String get name => throw _privateConstructorUsedError;
  String get commune => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  Stop get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GareCopyWith<Gare> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GareCopyWith<$Res> {
  factory $GareCopyWith(Gare value, $Res Function(Gare) then) =
      _$GareCopyWithImpl<$Res, Gare>;
  @useResult
  $Res call({String name, String commune, String type, Stop location});

  $StopCopyWith<$Res> get location;
}

/// @nodoc
class _$GareCopyWithImpl<$Res, $Val extends Gare>
    implements $GareCopyWith<$Res> {
  _$GareCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? commune = null,
    Object? type = null,
    Object? location = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      commune: null == commune
          ? _value.commune
          : commune // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Stop,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StopCopyWith<$Res> get location {
    return $StopCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GareImplCopyWith<$Res> implements $GareCopyWith<$Res> {
  factory _$$GareImplCopyWith(
          _$GareImpl value, $Res Function(_$GareImpl) then) =
      __$$GareImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String commune, String type, Stop location});

  @override
  $StopCopyWith<$Res> get location;
}

/// @nodoc
class __$$GareImplCopyWithImpl<$Res>
    extends _$GareCopyWithImpl<$Res, _$GareImpl>
    implements _$$GareImplCopyWith<$Res> {
  __$$GareImplCopyWithImpl(_$GareImpl _value, $Res Function(_$GareImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? commune = null,
    Object? type = null,
    Object? location = null,
  }) {
    return _then(_$GareImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      commune: null == commune
          ? _value.commune
          : commune // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Stop,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GareImpl implements _Gare {
  _$GareImpl(
      {required this.name,
      required this.commune,
      required this.type,
      required this.location});

  factory _$GareImpl.fromJson(Map<String, dynamic> json) =>
      _$$GareImplFromJson(json);

  @override
  final String name;
  @override
  final String commune;
  @override
  final String type;
  @override
  final Stop location;

  @override
  String toString() {
    return 'Gare(name: $name, commune: $commune, type: $type, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GareImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.commune, commune) || other.commune == commune) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, commune, type, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GareImplCopyWith<_$GareImpl> get copyWith =>
      __$$GareImplCopyWithImpl<_$GareImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GareImplToJson(
      this,
    );
  }
}

abstract class _Gare implements Gare {
  factory _Gare(
      {required final String name,
      required final String commune,
      required final String type,
      required final Stop location}) = _$GareImpl;

  factory _Gare.fromJson(Map<String, dynamic> json) = _$GareImpl.fromJson;

  @override
  String get name;
  @override
  String get commune;
  @override
  String get type;
  @override
  Stop get location;
  @override
  @JsonKey(ignore: true)
  _$$GareImplCopyWith<_$GareImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'itineraire_gare.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItineraireGare _$ItineraireGareFromJson(Map<String, dynamic> json) {
  return _ItineraireGare.fromJson(json);
}

/// @nodoc
mixin _$ItineraireGare {
  Map<String, dynamic> get source => throw _privateConstructorUsedError;
  Map<String, dynamic> get destination => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get commune => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItineraireGareCopyWith<ItineraireGare> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItineraireGareCopyWith<$Res> {
  factory $ItineraireGareCopyWith(
          ItineraireGare value, $Res Function(ItineraireGare) then) =
      _$ItineraireGareCopyWithImpl<$Res, ItineraireGare>;
  @useResult
  $Res call(
      {Map<String, dynamic> source,
      Map<String, dynamic> destination,
      String type,
      String commune});
}

/// @nodoc
class _$ItineraireGareCopyWithImpl<$Res, $Val extends ItineraireGare>
    implements $ItineraireGareCopyWith<$Res> {
  _$ItineraireGareCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? destination = null,
    Object? type = null,
    Object? commune = null,
  }) {
    return _then(_value.copyWith(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      commune: null == commune
          ? _value.commune
          : commune // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItineraireGareImplCopyWith<$Res>
    implements $ItineraireGareCopyWith<$Res> {
  factory _$$ItineraireGareImplCopyWith(_$ItineraireGareImpl value,
          $Res Function(_$ItineraireGareImpl) then) =
      __$$ItineraireGareImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, dynamic> source,
      Map<String, dynamic> destination,
      String type,
      String commune});
}

/// @nodoc
class __$$ItineraireGareImplCopyWithImpl<$Res>
    extends _$ItineraireGareCopyWithImpl<$Res, _$ItineraireGareImpl>
    implements _$$ItineraireGareImplCopyWith<$Res> {
  __$$ItineraireGareImplCopyWithImpl(
      _$ItineraireGareImpl _value, $Res Function(_$ItineraireGareImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? destination = null,
    Object? type = null,
    Object? commune = null,
  }) {
    return _then(_$ItineraireGareImpl(
      source: null == source
          ? _value._source
          : source // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      destination: null == destination
          ? _value._destination
          : destination // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      commune: null == commune
          ? _value.commune
          : commune // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItineraireGareImpl implements _ItineraireGare {
  _$ItineraireGareImpl(
      {required final Map<String, dynamic> source,
      required final Map<String, dynamic> destination,
      required this.type,
      required this.commune})
      : _source = source,
        _destination = destination;

  factory _$ItineraireGareImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItineraireGareImplFromJson(json);

  final Map<String, dynamic> _source;
  @override
  Map<String, dynamic> get source {
    if (_source is EqualUnmodifiableMapView) return _source;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_source);
  }

  final Map<String, dynamic> _destination;
  @override
  Map<String, dynamic> get destination {
    if (_destination is EqualUnmodifiableMapView) return _destination;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_destination);
  }

  @override
  final String type;
  @override
  final String commune;

  @override
  String toString() {
    return 'ItineraireGare(source: $source, destination: $destination, type: $type, commune: $commune)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItineraireGareImpl &&
            const DeepCollectionEquality().equals(other._source, _source) &&
            const DeepCollectionEquality()
                .equals(other._destination, _destination) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.commune, commune) || other.commune == commune));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_source),
      const DeepCollectionEquality().hash(_destination),
      type,
      commune);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItineraireGareImplCopyWith<_$ItineraireGareImpl> get copyWith =>
      __$$ItineraireGareImplCopyWithImpl<_$ItineraireGareImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItineraireGareImplToJson(
      this,
    );
  }
}

abstract class _ItineraireGare implements ItineraireGare {
  factory _ItineraireGare(
      {required final Map<String, dynamic> source,
      required final Map<String, dynamic> destination,
      required final String type,
      required final String commune}) = _$ItineraireGareImpl;

  factory _ItineraireGare.fromJson(Map<String, dynamic> json) =
      _$ItineraireGareImpl.fromJson;

  @override
  Map<String, dynamic> get source;
  @override
  Map<String, dynamic> get destination;
  @override
  String get type;
  @override
  String get commune;
  @override
  @JsonKey(ignore: true)
  _$$ItineraireGareImplCopyWith<_$ItineraireGareImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

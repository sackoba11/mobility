// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
  Map<String, dynamic> get source;
  Map<String, dynamic> get destination;
  String get type;
  String get commune;

  /// Create a copy of ItineraireGare
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ItineraireGareCopyWith<ItineraireGare> get copyWith =>
      _$ItineraireGareCopyWithImpl<ItineraireGare>(
          this as ItineraireGare, _$identity);

  /// Serializes this ItineraireGare to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ItineraireGare &&
            const DeepCollectionEquality().equals(other.source, source) &&
            const DeepCollectionEquality()
                .equals(other.destination, destination) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.commune, commune) || other.commune == commune));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(source),
      const DeepCollectionEquality().hash(destination),
      type,
      commune);

  @override
  String toString() {
    return 'ItineraireGare(source: $source, destination: $destination, type: $type, commune: $commune)';
  }
}

/// @nodoc
abstract mixin class $ItineraireGareCopyWith<$Res> {
  factory $ItineraireGareCopyWith(
          ItineraireGare value, $Res Function(ItineraireGare) _then) =
      _$ItineraireGareCopyWithImpl;
  @useResult
  $Res call(
      {Map<String, dynamic> source,
      Map<String, dynamic> destination,
      String type,
      String commune});
}

/// @nodoc
class _$ItineraireGareCopyWithImpl<$Res>
    implements $ItineraireGareCopyWith<$Res> {
  _$ItineraireGareCopyWithImpl(this._self, this._then);

  final ItineraireGare _self;
  final $Res Function(ItineraireGare) _then;

  /// Create a copy of ItineraireGare
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? destination = null,
    Object? type = null,
    Object? commune = null,
  }) {
    return _then(_self.copyWith(
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      destination: null == destination
          ? _self.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      commune: null == commune
          ? _self.commune
          : commune // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ItineraireGare implements ItineraireGare {
  _ItineraireGare(
      {required final Map<String, dynamic> source,
      required final Map<String, dynamic> destination,
      required this.type,
      required this.commune})
      : _source = source,
        _destination = destination;
  factory _ItineraireGare.fromJson(Map<String, dynamic> json) =>
      _$ItineraireGareFromJson(json);

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

  /// Create a copy of ItineraireGare
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ItineraireGareCopyWith<_ItineraireGare> get copyWith =>
      __$ItineraireGareCopyWithImpl<_ItineraireGare>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ItineraireGareToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ItineraireGare &&
            const DeepCollectionEquality().equals(other._source, _source) &&
            const DeepCollectionEquality()
                .equals(other._destination, _destination) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.commune, commune) || other.commune == commune));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_source),
      const DeepCollectionEquality().hash(_destination),
      type,
      commune);

  @override
  String toString() {
    return 'ItineraireGare(source: $source, destination: $destination, type: $type, commune: $commune)';
  }
}

/// @nodoc
abstract mixin class _$ItineraireGareCopyWith<$Res>
    implements $ItineraireGareCopyWith<$Res> {
  factory _$ItineraireGareCopyWith(
          _ItineraireGare value, $Res Function(_ItineraireGare) _then) =
      __$ItineraireGareCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Map<String, dynamic> source,
      Map<String, dynamic> destination,
      String type,
      String commune});
}

/// @nodoc
class __$ItineraireGareCopyWithImpl<$Res>
    implements _$ItineraireGareCopyWith<$Res> {
  __$ItineraireGareCopyWithImpl(this._self, this._then);

  final _ItineraireGare _self;
  final $Res Function(_ItineraireGare) _then;

  /// Create a copy of ItineraireGare
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? source = null,
    Object? destination = null,
    Object? type = null,
    Object? commune = null,
  }) {
    return _then(_ItineraireGare(
      source: null == source
          ? _self._source
          : source // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      destination: null == destination
          ? _self._destination
          : destination // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      commune: null == commune
          ? _self.commune
          : commune // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

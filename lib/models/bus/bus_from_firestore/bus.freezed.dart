// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
  int get number;
  String get source;
  String get destination;
  bool get isActive;
  List<Stop> get roadMap;

  /// Create a copy of Bus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BusCopyWith<Bus> get copyWith =>
      _$BusCopyWithImpl<Bus>(this as Bus, _$identity);

  /// Serializes this Bus to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Bus &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality().equals(other.roadMap, roadMap));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, number, source, destination,
      isActive, const DeepCollectionEquality().hash(roadMap));

  @override
  String toString() {
    return 'Bus(number: $number, source: $source, destination: $destination, isActive: $isActive, roadMap: $roadMap)';
  }
}

/// @nodoc
abstract mixin class $BusCopyWith<$Res> {
  factory $BusCopyWith(Bus value, $Res Function(Bus) _then) = _$BusCopyWithImpl;
  @useResult
  $Res call(
      {int number,
      String source,
      String destination,
      bool isActive,
      List<Stop> roadMap});
}

/// @nodoc
class _$BusCopyWithImpl<$Res> implements $BusCopyWith<$Res> {
  _$BusCopyWithImpl(this._self, this._then);

  final Bus _self;
  final $Res Function(Bus) _then;

  /// Create a copy of Bus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? source = null,
    Object? destination = null,
    Object? isActive = null,
    Object? roadMap = null,
  }) {
    return _then(_self.copyWith(
      number: null == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _self.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      roadMap: null == roadMap
          ? _self.roadMap
          : roadMap // ignore: cast_nullable_to_non_nullable
              as List<Stop>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Bus implements Bus {
  _Bus(
      {required this.number,
      required this.source,
      required this.destination,
      required this.isActive,
      required final List<Stop> roadMap})
      : _roadMap = roadMap;
  factory _Bus.fromJson(Map<String, dynamic> json) => _$BusFromJson(json);

  @override
  final int number;
  @override
  final String source;
  @override
  final String destination;
  @override
  final bool isActive;
  final List<Stop> _roadMap;
  @override
  List<Stop> get roadMap {
    if (_roadMap is EqualUnmodifiableListView) return _roadMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roadMap);
  }

  /// Create a copy of Bus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BusCopyWith<_Bus> get copyWith =>
      __$BusCopyWithImpl<_Bus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BusToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Bus &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality().equals(other._roadMap, _roadMap));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, number, source, destination,
      isActive, const DeepCollectionEquality().hash(_roadMap));

  @override
  String toString() {
    return 'Bus(number: $number, source: $source, destination: $destination, isActive: $isActive, roadMap: $roadMap)';
  }
}

/// @nodoc
abstract mixin class _$BusCopyWith<$Res> implements $BusCopyWith<$Res> {
  factory _$BusCopyWith(_Bus value, $Res Function(_Bus) _then) =
      __$BusCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int number,
      String source,
      String destination,
      bool isActive,
      List<Stop> roadMap});
}

/// @nodoc
class __$BusCopyWithImpl<$Res> implements _$BusCopyWith<$Res> {
  __$BusCopyWithImpl(this._self, this._then);

  final _Bus _self;
  final $Res Function(_Bus) _then;

  /// Create a copy of Bus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? number = null,
    Object? source = null,
    Object? destination = null,
    Object? isActive = null,
    Object? roadMap = null,
  }) {
    return _then(_Bus(
      number: null == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _self.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      roadMap: null == roadMap
          ? _self._roadMap
          : roadMap // ignore: cast_nullable_to_non_nullable
              as List<Stop>,
    ));
  }
}

// dart format on

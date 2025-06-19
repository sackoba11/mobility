// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
  int get number;
  String get source;
  String get destination;
  bool get isActive;
  List<Stop> get roadMap;
  Stop? get position;
  DateTime? get startDate;

  /// Create a copy of BusFromDb
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BusFromDbCopyWith<BusFromDb> get copyWith =>
      _$BusFromDbCopyWithImpl<BusFromDb>(this as BusFromDb, _$identity);

  /// Serializes this BusFromDb to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BusFromDb &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality().equals(other.roadMap, roadMap) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      number,
      source,
      destination,
      isActive,
      const DeepCollectionEquality().hash(roadMap),
      position,
      startDate);

  @override
  String toString() {
    return 'BusFromDb(number: $number, source: $source, destination: $destination, isActive: $isActive, roadMap: $roadMap, position: $position, startDate: $startDate)';
  }
}

/// @nodoc
abstract mixin class $BusFromDbCopyWith<$Res> {
  factory $BusFromDbCopyWith(BusFromDb value, $Res Function(BusFromDb) _then) =
      _$BusFromDbCopyWithImpl;
  @useResult
  $Res call(
      {int number,
      String source,
      String destination,
      bool isActive,
      List<Stop> roadMap,
      Stop? position,
      DateTime? startDate});

  $StopCopyWith<$Res>? get position;
}

/// @nodoc
class _$BusFromDbCopyWithImpl<$Res> implements $BusFromDbCopyWith<$Res> {
  _$BusFromDbCopyWithImpl(this._self, this._then);

  final BusFromDb _self;
  final $Res Function(BusFromDb) _then;

  /// Create a copy of BusFromDb
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? source = null,
    Object? destination = null,
    Object? isActive = null,
    Object? roadMap = null,
    Object? position = freezed,
    Object? startDate = freezed,
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
      position: freezed == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as Stop?,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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

/// @nodoc
@JsonSerializable()
class _BusFromDb implements BusFromDb {
  _BusFromDb(
      {required this.number,
      required this.source,
      required this.destination,
      required this.isActive,
      required final List<Stop> roadMap,
      required this.position,
      required this.startDate})
      : _roadMap = roadMap;
  factory _BusFromDb.fromJson(Map<String, dynamic> json) =>
      _$BusFromDbFromJson(json);

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

  @override
  final Stop? position;
  @override
  final DateTime? startDate;

  /// Create a copy of BusFromDb
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BusFromDbCopyWith<_BusFromDb> get copyWith =>
      __$BusFromDbCopyWithImpl<_BusFromDb>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BusFromDbToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BusFromDb &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality().equals(other._roadMap, _roadMap) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      number,
      source,
      destination,
      isActive,
      const DeepCollectionEquality().hash(_roadMap),
      position,
      startDate);

  @override
  String toString() {
    return 'BusFromDb(number: $number, source: $source, destination: $destination, isActive: $isActive, roadMap: $roadMap, position: $position, startDate: $startDate)';
  }
}

/// @nodoc
abstract mixin class _$BusFromDbCopyWith<$Res>
    implements $BusFromDbCopyWith<$Res> {
  factory _$BusFromDbCopyWith(
          _BusFromDb value, $Res Function(_BusFromDb) _then) =
      __$BusFromDbCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int number,
      String source,
      String destination,
      bool isActive,
      List<Stop> roadMap,
      Stop? position,
      DateTime? startDate});

  @override
  $StopCopyWith<$Res>? get position;
}

/// @nodoc
class __$BusFromDbCopyWithImpl<$Res> implements _$BusFromDbCopyWith<$Res> {
  __$BusFromDbCopyWithImpl(this._self, this._then);

  final _BusFromDb _self;
  final $Res Function(_BusFromDb) _then;

  /// Create a copy of BusFromDb
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? number = null,
    Object? source = null,
    Object? destination = null,
    Object? isActive = null,
    Object? roadMap = null,
    Object? position = freezed,
    Object? startDate = freezed,
  }) {
    return _then(_BusFromDb(
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
      position: freezed == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as Stop?,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bus_from_db.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BusFromDb _$BusFromDbFromJson(Map<String, dynamic> json) {
  return _BusFromDb.fromJson(json);
}

/// @nodoc
mixin _$BusFromDb {
  int get number => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  String get destination => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  List<Stop> get roadMap => throw _privateConstructorUsedError;
  Stop get position => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BusFromDbCopyWith<BusFromDb> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusFromDbCopyWith<$Res> {
  factory $BusFromDbCopyWith(BusFromDb value, $Res Function(BusFromDb) then) =
      _$BusFromDbCopyWithImpl<$Res, BusFromDb>;
  @useResult
  $Res call(
      {int number,
      String source,
      String destination,
      bool isActive,
      List<Stop> roadMap,
      Stop position,
      DateTime startDate});

  $StopCopyWith<$Res> get position;
}

/// @nodoc
class _$BusFromDbCopyWithImpl<$Res, $Val extends BusFromDb>
    implements $BusFromDbCopyWith<$Res> {
  _$BusFromDbCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? source = null,
    Object? destination = null,
    Object? isActive = null,
    Object? roadMap = null,
    Object? position = null,
    Object? startDate = null,
  }) {
    return _then(_value.copyWith(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      roadMap: null == roadMap
          ? _value.roadMap
          : roadMap // ignore: cast_nullable_to_non_nullable
              as List<Stop>,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Stop,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StopCopyWith<$Res> get position {
    return $StopCopyWith<$Res>(_value.position, (value) {
      return _then(_value.copyWith(position: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BusFromDbImplCopyWith<$Res>
    implements $BusFromDbCopyWith<$Res> {
  factory _$$BusFromDbImplCopyWith(
          _$BusFromDbImpl value, $Res Function(_$BusFromDbImpl) then) =
      __$$BusFromDbImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int number,
      String source,
      String destination,
      bool isActive,
      List<Stop> roadMap,
      Stop position,
      DateTime startDate});

  @override
  $StopCopyWith<$Res> get position;
}

/// @nodoc
class __$$BusFromDbImplCopyWithImpl<$Res>
    extends _$BusFromDbCopyWithImpl<$Res, _$BusFromDbImpl>
    implements _$$BusFromDbImplCopyWith<$Res> {
  __$$BusFromDbImplCopyWithImpl(
      _$BusFromDbImpl _value, $Res Function(_$BusFromDbImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? source = null,
    Object? destination = null,
    Object? isActive = null,
    Object? roadMap = null,
    Object? position = null,
    Object? startDate = null,
  }) {
    return _then(_$BusFromDbImpl(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      roadMap: null == roadMap
          ? _value._roadMap
          : roadMap // ignore: cast_nullable_to_non_nullable
              as List<Stop>,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Stop,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BusFromDbImpl implements _BusFromDb {
  _$BusFromDbImpl(
      {required this.number,
      required this.source,
      required this.destination,
      required this.isActive,
      required final List<Stop> roadMap,
      required this.position,
      required this.startDate})
      : _roadMap = roadMap;

  factory _$BusFromDbImpl.fromJson(Map<String, dynamic> json) =>
      _$$BusFromDbImplFromJson(json);

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
  final Stop position;
  @override
  final DateTime startDate;

  @override
  String toString() {
    return 'BusFromDb(number: $number, source: $source, destination: $destination, isActive: $isActive, roadMap: $roadMap, position: $position, startDate: $startDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusFromDbImpl &&
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

  @JsonKey(ignore: true)
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BusFromDbImplCopyWith<_$BusFromDbImpl> get copyWith =>
      __$$BusFromDbImplCopyWithImpl<_$BusFromDbImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BusFromDbImplToJson(
      this,
    );
  }
}

abstract class _BusFromDb implements BusFromDb {
  factory _BusFromDb(
      {required final int number,
      required final String source,
      required final String destination,
      required final bool isActive,
      required final List<Stop> roadMap,
      required final Stop position,
      required final DateTime startDate}) = _$BusFromDbImpl;

  factory _BusFromDb.fromJson(Map<String, dynamic> json) =
      _$BusFromDbImpl.fromJson;

  @override
  int get number;
  @override
  String get source;
  @override
  String get destination;
  @override
  bool get isActive;
  @override
  List<Stop> get roadMap;
  @override
  Stop get position;
  @override
  DateTime get startDate;
  @override
  @JsonKey(ignore: true)
  _$$BusFromDbImplCopyWith<_$BusFromDbImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

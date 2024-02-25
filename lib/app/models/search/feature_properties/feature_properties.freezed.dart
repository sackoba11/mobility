// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_properties.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeatureProperties _$FeaturePropertiesFromJson(Map<String, dynamic> json) {
  return _FeatureProperties.fromJson(json);
}

/// @nodoc
mixin _$FeatureProperties {
  String get mapboxId => throw _privateConstructorUsedError;
  String? get wikidata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeaturePropertiesCopyWith<FeatureProperties> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeaturePropertiesCopyWith<$Res> {
  factory $FeaturePropertiesCopyWith(
          FeatureProperties value, $Res Function(FeatureProperties) then) =
      _$FeaturePropertiesCopyWithImpl<$Res, FeatureProperties>;
  @useResult
  $Res call({String mapboxId, String? wikidata});
}

/// @nodoc
class _$FeaturePropertiesCopyWithImpl<$Res, $Val extends FeatureProperties>
    implements $FeaturePropertiesCopyWith<$Res> {
  _$FeaturePropertiesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mapboxId = null,
    Object? wikidata = freezed,
  }) {
    return _then(_value.copyWith(
      mapboxId: null == mapboxId
          ? _value.mapboxId
          : mapboxId // ignore: cast_nullable_to_non_nullable
              as String,
      wikidata: freezed == wikidata
          ? _value.wikidata
          : wikidata // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeaturePropertiesImplCopyWith<$Res>
    implements $FeaturePropertiesCopyWith<$Res> {
  factory _$$FeaturePropertiesImplCopyWith(_$FeaturePropertiesImpl value,
          $Res Function(_$FeaturePropertiesImpl) then) =
      __$$FeaturePropertiesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String mapboxId, String? wikidata});
}

/// @nodoc
class __$$FeaturePropertiesImplCopyWithImpl<$Res>
    extends _$FeaturePropertiesCopyWithImpl<$Res, _$FeaturePropertiesImpl>
    implements _$$FeaturePropertiesImplCopyWith<$Res> {
  __$$FeaturePropertiesImplCopyWithImpl(_$FeaturePropertiesImpl _value,
      $Res Function(_$FeaturePropertiesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mapboxId = null,
    Object? wikidata = freezed,
  }) {
    return _then(_$FeaturePropertiesImpl(
      mapboxId: null == mapboxId
          ? _value.mapboxId
          : mapboxId // ignore: cast_nullable_to_non_nullable
              as String,
      wikidata: freezed == wikidata
          ? _value.wikidata
          : wikidata // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeaturePropertiesImpl implements _FeatureProperties {
  _$FeaturePropertiesImpl({required this.mapboxId, this.wikidata});

  factory _$FeaturePropertiesImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeaturePropertiesImplFromJson(json);

  @override
  final String mapboxId;
  @override
  final String? wikidata;

  @override
  String toString() {
    return 'FeatureProperties(mapboxId: $mapboxId, wikidata: $wikidata)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeaturePropertiesImpl &&
            (identical(other.mapboxId, mapboxId) ||
                other.mapboxId == mapboxId) &&
            (identical(other.wikidata, wikidata) ||
                other.wikidata == wikidata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mapboxId, wikidata);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeaturePropertiesImplCopyWith<_$FeaturePropertiesImpl> get copyWith =>
      __$$FeaturePropertiesImplCopyWithImpl<_$FeaturePropertiesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeaturePropertiesImplToJson(
      this,
    );
  }
}

abstract class _FeatureProperties implements FeatureProperties {
  factory _FeatureProperties(
      {required final String mapboxId,
      final String? wikidata}) = _$FeaturePropertiesImpl;

  factory _FeatureProperties.fromJson(Map<String, dynamic> json) =
      _$FeaturePropertiesImpl.fromJson;

  @override
  String get mapboxId;
  @override
  String? get wikidata;
  @override
  @JsonKey(ignore: true)
  _$$FeaturePropertiesImplCopyWith<_$FeaturePropertiesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

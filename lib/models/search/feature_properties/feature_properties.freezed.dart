// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_properties.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeatureProperties {
  String get mapboxId;
  String? get wikidata;

  /// Create a copy of FeatureProperties
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeaturePropertiesCopyWith<FeatureProperties> get copyWith =>
      _$FeaturePropertiesCopyWithImpl<FeatureProperties>(
          this as FeatureProperties, _$identity);

  /// Serializes this FeatureProperties to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeatureProperties &&
            (identical(other.mapboxId, mapboxId) ||
                other.mapboxId == mapboxId) &&
            (identical(other.wikidata, wikidata) ||
                other.wikidata == wikidata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mapboxId, wikidata);

  @override
  String toString() {
    return 'FeatureProperties(mapboxId: $mapboxId, wikidata: $wikidata)';
  }
}

/// @nodoc
abstract mixin class $FeaturePropertiesCopyWith<$Res> {
  factory $FeaturePropertiesCopyWith(
          FeatureProperties value, $Res Function(FeatureProperties) _then) =
      _$FeaturePropertiesCopyWithImpl;
  @useResult
  $Res call({String mapboxId, String? wikidata});
}

/// @nodoc
class _$FeaturePropertiesCopyWithImpl<$Res>
    implements $FeaturePropertiesCopyWith<$Res> {
  _$FeaturePropertiesCopyWithImpl(this._self, this._then);

  final FeatureProperties _self;
  final $Res Function(FeatureProperties) _then;

  /// Create a copy of FeatureProperties
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mapboxId = null,
    Object? wikidata = freezed,
  }) {
    return _then(_self.copyWith(
      mapboxId: null == mapboxId
          ? _self.mapboxId
          : mapboxId // ignore: cast_nullable_to_non_nullable
              as String,
      wikidata: freezed == wikidata
          ? _self.wikidata
          : wikidata // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _FeatureProperties implements FeatureProperties {
  _FeatureProperties({required this.mapboxId, this.wikidata});
  factory _FeatureProperties.fromJson(Map<String, dynamic> json) =>
      _$FeaturePropertiesFromJson(json);

  @override
  final String mapboxId;
  @override
  final String? wikidata;

  /// Create a copy of FeatureProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FeaturePropertiesCopyWith<_FeatureProperties> get copyWith =>
      __$FeaturePropertiesCopyWithImpl<_FeatureProperties>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FeaturePropertiesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FeatureProperties &&
            (identical(other.mapboxId, mapboxId) ||
                other.mapboxId == mapboxId) &&
            (identical(other.wikidata, wikidata) ||
                other.wikidata == wikidata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mapboxId, wikidata);

  @override
  String toString() {
    return 'FeatureProperties(mapboxId: $mapboxId, wikidata: $wikidata)';
  }
}

/// @nodoc
abstract mixin class _$FeaturePropertiesCopyWith<$Res>
    implements $FeaturePropertiesCopyWith<$Res> {
  factory _$FeaturePropertiesCopyWith(
          _FeatureProperties value, $Res Function(_FeatureProperties) _then) =
      __$FeaturePropertiesCopyWithImpl;
  @override
  @useResult
  $Res call({String mapboxId, String? wikidata});
}

/// @nodoc
class __$FeaturePropertiesCopyWithImpl<$Res>
    implements _$FeaturePropertiesCopyWith<$Res> {
  __$FeaturePropertiesCopyWithImpl(this._self, this._then);

  final _FeatureProperties _self;
  final $Res Function(_FeatureProperties) _then;

  /// Create a copy of FeatureProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? mapboxId = null,
    Object? wikidata = freezed,
  }) {
    return _then(_FeatureProperties(
      mapboxId: null == mapboxId
          ? _self.mapboxId
          : mapboxId // ignore: cast_nullable_to_non_nullable
              as String,
      wikidata: freezed == wikidata
          ? _self.wikidata
          : wikidata // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeatureContext {
  String get id;
  String get mapboxId;
  String? get wikidata;
  String get shortCode;
  String get text;

  /// Create a copy of FeatureContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeatureContextCopyWith<FeatureContext> get copyWith =>
      _$FeatureContextCopyWithImpl<FeatureContext>(
          this as FeatureContext, _$identity);

  /// Serializes this FeatureContext to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeatureContext &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mapboxId, mapboxId) ||
                other.mapboxId == mapboxId) &&
            (identical(other.wikidata, wikidata) ||
                other.wikidata == wikidata) &&
            (identical(other.shortCode, shortCode) ||
                other.shortCode == shortCode) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, mapboxId, wikidata, shortCode, text);

  @override
  String toString() {
    return 'FeatureContext(id: $id, mapboxId: $mapboxId, wikidata: $wikidata, shortCode: $shortCode, text: $text)';
  }
}

/// @nodoc
abstract mixin class $FeatureContextCopyWith<$Res> {
  factory $FeatureContextCopyWith(
          FeatureContext value, $Res Function(FeatureContext) _then) =
      _$FeatureContextCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String mapboxId,
      String? wikidata,
      String shortCode,
      String text});
}

/// @nodoc
class _$FeatureContextCopyWithImpl<$Res>
    implements $FeatureContextCopyWith<$Res> {
  _$FeatureContextCopyWithImpl(this._self, this._then);

  final FeatureContext _self;
  final $Res Function(FeatureContext) _then;

  /// Create a copy of FeatureContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mapboxId = null,
    Object? wikidata = freezed,
    Object? shortCode = null,
    Object? text = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mapboxId: null == mapboxId
          ? _self.mapboxId
          : mapboxId // ignore: cast_nullable_to_non_nullable
              as String,
      wikidata: freezed == wikidata
          ? _self.wikidata
          : wikidata // ignore: cast_nullable_to_non_nullable
              as String?,
      shortCode: null == shortCode
          ? _self.shortCode
          : shortCode // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _FeatureContext implements FeatureContext {
  _FeatureContext(
      {required this.id,
      required this.mapboxId,
      this.wikidata,
      required this.shortCode,
      required this.text});
  factory _FeatureContext.fromJson(Map<String, dynamic> json) =>
      _$FeatureContextFromJson(json);

  @override
  final String id;
  @override
  final String mapboxId;
  @override
  final String? wikidata;
  @override
  final String shortCode;
  @override
  final String text;

  /// Create a copy of FeatureContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FeatureContextCopyWith<_FeatureContext> get copyWith =>
      __$FeatureContextCopyWithImpl<_FeatureContext>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FeatureContextToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FeatureContext &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mapboxId, mapboxId) ||
                other.mapboxId == mapboxId) &&
            (identical(other.wikidata, wikidata) ||
                other.wikidata == wikidata) &&
            (identical(other.shortCode, shortCode) ||
                other.shortCode == shortCode) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, mapboxId, wikidata, shortCode, text);

  @override
  String toString() {
    return 'FeatureContext(id: $id, mapboxId: $mapboxId, wikidata: $wikidata, shortCode: $shortCode, text: $text)';
  }
}

/// @nodoc
abstract mixin class _$FeatureContextCopyWith<$Res>
    implements $FeatureContextCopyWith<$Res> {
  factory _$FeatureContextCopyWith(
          _FeatureContext value, $Res Function(_FeatureContext) _then) =
      __$FeatureContextCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String mapboxId,
      String? wikidata,
      String shortCode,
      String text});
}

/// @nodoc
class __$FeatureContextCopyWithImpl<$Res>
    implements _$FeatureContextCopyWith<$Res> {
  __$FeatureContextCopyWithImpl(this._self, this._then);

  final _FeatureContext _self;
  final $Res Function(_FeatureContext) _then;

  /// Create a copy of FeatureContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? mapboxId = null,
    Object? wikidata = freezed,
    Object? shortCode = null,
    Object? text = null,
  }) {
    return _then(_FeatureContext(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mapboxId: null == mapboxId
          ? _self.mapboxId
          : mapboxId // ignore: cast_nullable_to_non_nullable
              as String,
      wikidata: freezed == wikidata
          ? _self.wikidata
          : wikidata // ignore: cast_nullable_to_non_nullable
              as String?,
      shortCode: null == shortCode
          ? _self.shortCode
          : shortCode // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_collection_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeatureCollectionResponse {
  String get type;
  List<String> get query;
  List<FeatureModel> get features;
  String get attribution;

  /// Create a copy of FeatureCollectionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeatureCollectionResponseCopyWith<FeatureCollectionResponse> get copyWith =>
      _$FeatureCollectionResponseCopyWithImpl<FeatureCollectionResponse>(
          this as FeatureCollectionResponse, _$identity);

  /// Serializes this FeatureCollectionResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeatureCollectionResponse &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.query, query) &&
            const DeepCollectionEquality().equals(other.features, features) &&
            (identical(other.attribution, attribution) ||
                other.attribution == attribution));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      const DeepCollectionEquality().hash(query),
      const DeepCollectionEquality().hash(features),
      attribution);

  @override
  String toString() {
    return 'FeatureCollectionResponse(type: $type, query: $query, features: $features, attribution: $attribution)';
  }
}

/// @nodoc
abstract mixin class $FeatureCollectionResponseCopyWith<$Res> {
  factory $FeatureCollectionResponseCopyWith(FeatureCollectionResponse value,
          $Res Function(FeatureCollectionResponse) _then) =
      _$FeatureCollectionResponseCopyWithImpl;
  @useResult
  $Res call(
      {String type,
      List<String> query,
      List<FeatureModel> features,
      String attribution});
}

/// @nodoc
class _$FeatureCollectionResponseCopyWithImpl<$Res>
    implements $FeatureCollectionResponseCopyWith<$Res> {
  _$FeatureCollectionResponseCopyWithImpl(this._self, this._then);

  final FeatureCollectionResponse _self;
  final $Res Function(FeatureCollectionResponse) _then;

  /// Create a copy of FeatureCollectionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? query = null,
    Object? features = null,
    Object? attribution = null,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as List<String>,
      features: null == features
          ? _self.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<FeatureModel>,
      attribution: null == attribution
          ? _self.attribution
          : attribution // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _FeatureCollectionResponse implements FeatureCollectionResponse {
  _FeatureCollectionResponse(
      {required this.type,
      required final List<String> query,
      required final List<FeatureModel> features,
      required this.attribution})
      : _query = query,
        _features = features;
  factory _FeatureCollectionResponse.fromJson(Map<String, dynamic> json) =>
      _$FeatureCollectionResponseFromJson(json);

  @override
  final String type;
  final List<String> _query;
  @override
  List<String> get query {
    if (_query is EqualUnmodifiableListView) return _query;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_query);
  }

  final List<FeatureModel> _features;
  @override
  List<FeatureModel> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  final String attribution;

  /// Create a copy of FeatureCollectionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FeatureCollectionResponseCopyWith<_FeatureCollectionResponse>
      get copyWith =>
          __$FeatureCollectionResponseCopyWithImpl<_FeatureCollectionResponse>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FeatureCollectionResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FeatureCollectionResponse &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._query, _query) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            (identical(other.attribution, attribution) ||
                other.attribution == attribution));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      const DeepCollectionEquality().hash(_query),
      const DeepCollectionEquality().hash(_features),
      attribution);

  @override
  String toString() {
    return 'FeatureCollectionResponse(type: $type, query: $query, features: $features, attribution: $attribution)';
  }
}

/// @nodoc
abstract mixin class _$FeatureCollectionResponseCopyWith<$Res>
    implements $FeatureCollectionResponseCopyWith<$Res> {
  factory _$FeatureCollectionResponseCopyWith(_FeatureCollectionResponse value,
          $Res Function(_FeatureCollectionResponse) _then) =
      __$FeatureCollectionResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String type,
      List<String> query,
      List<FeatureModel> features,
      String attribution});
}

/// @nodoc
class __$FeatureCollectionResponseCopyWithImpl<$Res>
    implements _$FeatureCollectionResponseCopyWith<$Res> {
  __$FeatureCollectionResponseCopyWithImpl(this._self, this._then);

  final _FeatureCollectionResponse _self;
  final $Res Function(_FeatureCollectionResponse) _then;

  /// Create a copy of FeatureCollectionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? query = null,
    Object? features = null,
    Object? attribution = null,
  }) {
    return _then(_FeatureCollectionResponse(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      query: null == query
          ? _self._query
          : query // ignore: cast_nullable_to_non_nullable
              as List<String>,
      features: null == features
          ? _self._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<FeatureModel>,
      attribution: null == attribution
          ? _self.attribution
          : attribution // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_collection_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeatureCollectionResponse _$FeatureCollectionResponseFromJson(
    Map<String, dynamic> json) {
  return _FeatureCollectionResponse.fromJson(json);
}

/// @nodoc
mixin _$FeatureCollectionResponse {
  String get type => throw _privateConstructorUsedError;
  List<String> get query => throw _privateConstructorUsedError;
  List<FeatureModel> get features => throw _privateConstructorUsedError;
  String get attribution => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeatureCollectionResponseCopyWith<FeatureCollectionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatureCollectionResponseCopyWith<$Res> {
  factory $FeatureCollectionResponseCopyWith(FeatureCollectionResponse value,
          $Res Function(FeatureCollectionResponse) then) =
      _$FeatureCollectionResponseCopyWithImpl<$Res, FeatureCollectionResponse>;
  @useResult
  $Res call(
      {String type,
      List<String> query,
      List<FeatureModel> features,
      String attribution});
}

/// @nodoc
class _$FeatureCollectionResponseCopyWithImpl<$Res,
        $Val extends FeatureCollectionResponse>
    implements $FeatureCollectionResponseCopyWith<$Res> {
  _$FeatureCollectionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? query = null,
    Object? features = null,
    Object? attribution = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as List<String>,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<FeatureModel>,
      attribution: null == attribution
          ? _value.attribution
          : attribution // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeatureCollectionResponseImplCopyWith<$Res>
    implements $FeatureCollectionResponseCopyWith<$Res> {
  factory _$$FeatureCollectionResponseImplCopyWith(
          _$FeatureCollectionResponseImpl value,
          $Res Function(_$FeatureCollectionResponseImpl) then) =
      __$$FeatureCollectionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String type,
      List<String> query,
      List<FeatureModel> features,
      String attribution});
}

/// @nodoc
class __$$FeatureCollectionResponseImplCopyWithImpl<$Res>
    extends _$FeatureCollectionResponseCopyWithImpl<$Res,
        _$FeatureCollectionResponseImpl>
    implements _$$FeatureCollectionResponseImplCopyWith<$Res> {
  __$$FeatureCollectionResponseImplCopyWithImpl(
      _$FeatureCollectionResponseImpl _value,
      $Res Function(_$FeatureCollectionResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? query = null,
    Object? features = null,
    Object? attribution = null,
  }) {
    return _then(_$FeatureCollectionResponseImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      query: null == query
          ? _value._query
          : query // ignore: cast_nullable_to_non_nullable
              as List<String>,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<FeatureModel>,
      attribution: null == attribution
          ? _value.attribution
          : attribution // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeatureCollectionResponseImpl implements _FeatureCollectionResponse {
  _$FeatureCollectionResponseImpl(
      {required this.type,
      required final List<String> query,
      required final List<FeatureModel> features,
      required this.attribution})
      : _query = query,
        _features = features;

  factory _$FeatureCollectionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeatureCollectionResponseImplFromJson(json);

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

  @override
  String toString() {
    return 'FeatureCollectionResponse(type: $type, query: $query, features: $features, attribution: $attribution)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeatureCollectionResponseImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._query, _query) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            (identical(other.attribution, attribution) ||
                other.attribution == attribution));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      const DeepCollectionEquality().hash(_query),
      const DeepCollectionEquality().hash(_features),
      attribution);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeatureCollectionResponseImplCopyWith<_$FeatureCollectionResponseImpl>
      get copyWith => __$$FeatureCollectionResponseImplCopyWithImpl<
          _$FeatureCollectionResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeatureCollectionResponseImplToJson(
      this,
    );
  }
}

abstract class _FeatureCollectionResponse implements FeatureCollectionResponse {
  factory _FeatureCollectionResponse(
      {required final String type,
      required final List<String> query,
      required final List<FeatureModel> features,
      required final String attribution}) = _$FeatureCollectionResponseImpl;

  factory _FeatureCollectionResponse.fromJson(Map<String, dynamic> json) =
      _$FeatureCollectionResponseImpl.fromJson;

  @override
  String get type;
  @override
  List<String> get query;
  @override
  List<FeatureModel> get features;
  @override
  String get attribution;
  @override
  @JsonKey(ignore: true)
  _$$FeatureCollectionResponseImplCopyWith<_$FeatureCollectionResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeatureModel _$FeatureModelFromJson(Map<String, dynamic> json) {
  return _FeatureModel.fromJson(json);
}

/// @nodoc
mixin _$FeatureModel {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  List<String> get placeType => throw _privateConstructorUsedError;
  double get relevance => throw _privateConstructorUsedError;
  FeatureProperties get properties => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get placeName => throw _privateConstructorUsedError;
  List<double> get center => throw _privateConstructorUsedError;
  FeatureGeometry get geometry => throw _privateConstructorUsedError;
  List<FeatureContext> get context => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeatureModelCopyWith<FeatureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatureModelCopyWith<$Res> {
  factory $FeatureModelCopyWith(
          FeatureModel value, $Res Function(FeatureModel) then) =
      _$FeatureModelCopyWithImpl<$Res, FeatureModel>;
  @useResult
  $Res call(
      {String id,
      String type,
      List<String> placeType,
      double relevance,
      FeatureProperties properties,
      String text,
      String placeName,
      List<double> center,
      FeatureGeometry geometry,
      List<FeatureContext> context});

  $FeaturePropertiesCopyWith<$Res> get properties;
  $FeatureGeometryCopyWith<$Res> get geometry;
}

/// @nodoc
class _$FeatureModelCopyWithImpl<$Res, $Val extends FeatureModel>
    implements $FeatureModelCopyWith<$Res> {
  _$FeatureModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? placeType = null,
    Object? relevance = null,
    Object? properties = null,
    Object? text = null,
    Object? placeName = null,
    Object? center = null,
    Object? geometry = null,
    Object? context = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      placeType: null == placeType
          ? _value.placeType
          : placeType // ignore: cast_nullable_to_non_nullable
              as List<String>,
      relevance: null == relevance
          ? _value.relevance
          : relevance // ignore: cast_nullable_to_non_nullable
              as double,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as FeatureProperties,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      placeName: null == placeName
          ? _value.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String,
      center: null == center
          ? _value.center
          : center // ignore: cast_nullable_to_non_nullable
              as List<double>,
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as FeatureGeometry,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as List<FeatureContext>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FeaturePropertiesCopyWith<$Res> get properties {
    return $FeaturePropertiesCopyWith<$Res>(_value.properties, (value) {
      return _then(_value.copyWith(properties: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FeatureGeometryCopyWith<$Res> get geometry {
    return $FeatureGeometryCopyWith<$Res>(_value.geometry, (value) {
      return _then(_value.copyWith(geometry: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FeatureModelImplCopyWith<$Res>
    implements $FeatureModelCopyWith<$Res> {
  factory _$$FeatureModelImplCopyWith(
          _$FeatureModelImpl value, $Res Function(_$FeatureModelImpl) then) =
      __$$FeatureModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      List<String> placeType,
      double relevance,
      FeatureProperties properties,
      String text,
      String placeName,
      List<double> center,
      FeatureGeometry geometry,
      List<FeatureContext> context});

  @override
  $FeaturePropertiesCopyWith<$Res> get properties;
  @override
  $FeatureGeometryCopyWith<$Res> get geometry;
}

/// @nodoc
class __$$FeatureModelImplCopyWithImpl<$Res>
    extends _$FeatureModelCopyWithImpl<$Res, _$FeatureModelImpl>
    implements _$$FeatureModelImplCopyWith<$Res> {
  __$$FeatureModelImplCopyWithImpl(
      _$FeatureModelImpl _value, $Res Function(_$FeatureModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? placeType = null,
    Object? relevance = null,
    Object? properties = null,
    Object? text = null,
    Object? placeName = null,
    Object? center = null,
    Object? geometry = null,
    Object? context = null,
  }) {
    return _then(_$FeatureModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      placeType: null == placeType
          ? _value._placeType
          : placeType // ignore: cast_nullable_to_non_nullable
              as List<String>,
      relevance: null == relevance
          ? _value.relevance
          : relevance // ignore: cast_nullable_to_non_nullable
              as double,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as FeatureProperties,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      placeName: null == placeName
          ? _value.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String,
      center: null == center
          ? _value._center
          : center // ignore: cast_nullable_to_non_nullable
              as List<double>,
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as FeatureGeometry,
      context: null == context
          ? _value._context
          : context // ignore: cast_nullable_to_non_nullable
              as List<FeatureContext>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeatureModelImpl implements _FeatureModel {
  _$FeatureModelImpl(
      {required this.id,
      required this.type,
      required final List<String> placeType,
      required this.relevance,
      required this.properties,
      required this.text,
      required this.placeName,
      required final List<double> center,
      required this.geometry,
      required final List<FeatureContext> context})
      : _placeType = placeType,
        _center = center,
        _context = context;

  factory _$FeatureModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeatureModelImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  final List<String> _placeType;
  @override
  List<String> get placeType {
    if (_placeType is EqualUnmodifiableListView) return _placeType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_placeType);
  }

  @override
  final double relevance;
  @override
  final FeatureProperties properties;
  @override
  final String text;
  @override
  final String placeName;
  final List<double> _center;
  @override
  List<double> get center {
    if (_center is EqualUnmodifiableListView) return _center;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_center);
  }

  @override
  final FeatureGeometry geometry;
  final List<FeatureContext> _context;
  @override
  List<FeatureContext> get context {
    if (_context is EqualUnmodifiableListView) return _context;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_context);
  }

  @override
  String toString() {
    return 'FeatureModel(id: $id, type: $type, placeType: $placeType, relevance: $relevance, properties: $properties, text: $text, placeName: $placeName, center: $center, geometry: $geometry, context: $context)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeatureModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._placeType, _placeType) &&
            (identical(other.relevance, relevance) ||
                other.relevance == relevance) &&
            (identical(other.properties, properties) ||
                other.properties == properties) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.placeName, placeName) ||
                other.placeName == placeName) &&
            const DeepCollectionEquality().equals(other._center, _center) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry) &&
            const DeepCollectionEquality().equals(other._context, _context));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      const DeepCollectionEquality().hash(_placeType),
      relevance,
      properties,
      text,
      placeName,
      const DeepCollectionEquality().hash(_center),
      geometry,
      const DeepCollectionEquality().hash(_context));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeatureModelImplCopyWith<_$FeatureModelImpl> get copyWith =>
      __$$FeatureModelImplCopyWithImpl<_$FeatureModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeatureModelImplToJson(
      this,
    );
  }
}

abstract class _FeatureModel implements FeatureModel {
  factory _FeatureModel(
      {required final String id,
      required final String type,
      required final List<String> placeType,
      required final double relevance,
      required final FeatureProperties properties,
      required final String text,
      required final String placeName,
      required final List<double> center,
      required final FeatureGeometry geometry,
      required final List<FeatureContext> context}) = _$FeatureModelImpl;

  factory _FeatureModel.fromJson(Map<String, dynamic> json) =
      _$FeatureModelImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  List<String> get placeType;
  @override
  double get relevance;
  @override
  FeatureProperties get properties;
  @override
  String get text;
  @override
  String get placeName;
  @override
  List<double> get center;
  @override
  FeatureGeometry get geometry;
  @override
  List<FeatureContext> get context;
  @override
  @JsonKey(ignore: true)
  _$$FeatureModelImplCopyWith<_$FeatureModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

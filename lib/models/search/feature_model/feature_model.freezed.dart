// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feature_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeatureModel {
  String get id;
  String get type;
  List<String> get placeType;
  double get relevance;
  FeatureProperties get properties;
  String get text;
  String get placeName;
  List<double> get center;
  FeatureGeometry get geometry;
  List<FeatureContext> get context;

  /// Create a copy of FeatureModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeatureModelCopyWith<FeatureModel> get copyWith =>
      _$FeatureModelCopyWithImpl<FeatureModel>(
          this as FeatureModel, _$identity);

  /// Serializes this FeatureModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeatureModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.placeType, placeType) &&
            (identical(other.relevance, relevance) ||
                other.relevance == relevance) &&
            (identical(other.properties, properties) ||
                other.properties == properties) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.placeName, placeName) ||
                other.placeName == placeName) &&
            const DeepCollectionEquality().equals(other.center, center) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry) &&
            const DeepCollectionEquality().equals(other.context, context));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      const DeepCollectionEquality().hash(placeType),
      relevance,
      properties,
      text,
      placeName,
      const DeepCollectionEquality().hash(center),
      geometry,
      const DeepCollectionEquality().hash(context));

  @override
  String toString() {
    return 'FeatureModel(id: $id, type: $type, placeType: $placeType, relevance: $relevance, properties: $properties, text: $text, placeName: $placeName, center: $center, geometry: $geometry, context: $context)';
  }
}

/// @nodoc
abstract mixin class $FeatureModelCopyWith<$Res> {
  factory $FeatureModelCopyWith(
          FeatureModel value, $Res Function(FeatureModel) _then) =
      _$FeatureModelCopyWithImpl;
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
class _$FeatureModelCopyWithImpl<$Res> implements $FeatureModelCopyWith<$Res> {
  _$FeatureModelCopyWithImpl(this._self, this._then);

  final FeatureModel _self;
  final $Res Function(FeatureModel) _then;

  /// Create a copy of FeatureModel
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      placeType: null == placeType
          ? _self.placeType
          : placeType // ignore: cast_nullable_to_non_nullable
              as List<String>,
      relevance: null == relevance
          ? _self.relevance
          : relevance // ignore: cast_nullable_to_non_nullable
              as double,
      properties: null == properties
          ? _self.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as FeatureProperties,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      placeName: null == placeName
          ? _self.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String,
      center: null == center
          ? _self.center
          : center // ignore: cast_nullable_to_non_nullable
              as List<double>,
      geometry: null == geometry
          ? _self.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as FeatureGeometry,
      context: null == context
          ? _self.context
          : context // ignore: cast_nullable_to_non_nullable
              as List<FeatureContext>,
    ));
  }

  /// Create a copy of FeatureModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FeaturePropertiesCopyWith<$Res> get properties {
    return $FeaturePropertiesCopyWith<$Res>(_self.properties, (value) {
      return _then(_self.copyWith(properties: value));
    });
  }

  /// Create a copy of FeatureModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FeatureGeometryCopyWith<$Res> get geometry {
    return $FeatureGeometryCopyWith<$Res>(_self.geometry, (value) {
      return _then(_self.copyWith(geometry: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _FeatureModel implements FeatureModel {
  _FeatureModel(
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
  factory _FeatureModel.fromJson(Map<String, dynamic> json) =>
      _$FeatureModelFromJson(json);

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

  /// Create a copy of FeatureModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FeatureModelCopyWith<_FeatureModel> get copyWith =>
      __$FeatureModelCopyWithImpl<_FeatureModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FeatureModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FeatureModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  @override
  String toString() {
    return 'FeatureModel(id: $id, type: $type, placeType: $placeType, relevance: $relevance, properties: $properties, text: $text, placeName: $placeName, center: $center, geometry: $geometry, context: $context)';
  }
}

/// @nodoc
abstract mixin class _$FeatureModelCopyWith<$Res>
    implements $FeatureModelCopyWith<$Res> {
  factory _$FeatureModelCopyWith(
          _FeatureModel value, $Res Function(_FeatureModel) _then) =
      __$FeatureModelCopyWithImpl;
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
class __$FeatureModelCopyWithImpl<$Res>
    implements _$FeatureModelCopyWith<$Res> {
  __$FeatureModelCopyWithImpl(this._self, this._then);

  final _FeatureModel _self;
  final $Res Function(_FeatureModel) _then;

  /// Create a copy of FeatureModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_FeatureModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      placeType: null == placeType
          ? _self._placeType
          : placeType // ignore: cast_nullable_to_non_nullable
              as List<String>,
      relevance: null == relevance
          ? _self.relevance
          : relevance // ignore: cast_nullable_to_non_nullable
              as double,
      properties: null == properties
          ? _self.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as FeatureProperties,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      placeName: null == placeName
          ? _self.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String,
      center: null == center
          ? _self._center
          : center // ignore: cast_nullable_to_non_nullable
              as List<double>,
      geometry: null == geometry
          ? _self.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as FeatureGeometry,
      context: null == context
          ? _self._context
          : context // ignore: cast_nullable_to_non_nullable
              as List<FeatureContext>,
    ));
  }

  /// Create a copy of FeatureModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FeaturePropertiesCopyWith<$Res> get properties {
    return $FeaturePropertiesCopyWith<$Res>(_self.properties, (value) {
      return _then(_self.copyWith(properties: value));
    });
  }

  /// Create a copy of FeatureModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FeatureGeometryCopyWith<$Res> get geometry {
    return $FeatureGeometryCopyWith<$Res>(_self.geometry, (value) {
      return _then(_self.copyWith(geometry: value));
    });
  }
}

// dart format on

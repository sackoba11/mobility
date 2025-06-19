// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_geometry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FeatureGeometry _$FeatureGeometryFromJson(Map<String, dynamic> json) =>
    _FeatureGeometry(
      type: json['type'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$FeatureGeometryToJson(_FeatureGeometry instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };

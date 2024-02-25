// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_geometry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeatureGeometryImpl _$$FeatureGeometryImplFromJson(
        Map<String, dynamic> json) =>
    _$FeatureGeometryImpl(
      type: json['type'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$FeatureGeometryImplToJson(
        _$FeatureGeometryImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };

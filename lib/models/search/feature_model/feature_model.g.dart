// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FeatureModel _$FeatureModelFromJson(Map<String, dynamic> json) =>
    _FeatureModel(
      id: json['id'] as String,
      type: json['type'] as String,
      placeType:
          (json['placeType'] as List<dynamic>).map((e) => e as String).toList(),
      relevance: (json['relevance'] as num).toDouble(),
      properties: FeatureProperties.fromJson(
          json['properties'] as Map<String, dynamic>),
      text: json['text'] as String,
      placeName: json['placeName'] as String,
      center: (json['center'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      geometry:
          FeatureGeometry.fromJson(json['geometry'] as Map<String, dynamic>),
      context: (json['context'] as List<dynamic>)
          .map((e) => FeatureContext.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FeatureModelToJson(_FeatureModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'placeType': instance.placeType,
      'relevance': instance.relevance,
      'properties': instance.properties,
      'text': instance.text,
      'placeName': instance.placeName,
      'center': instance.center,
      'geometry': instance.geometry,
      'context': instance.context,
    };

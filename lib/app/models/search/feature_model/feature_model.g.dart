// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeatureModelImpl _$$FeatureModelImplFromJson(Map<String, dynamic> json) =>
    _$FeatureModelImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      placeType: (json['place_type'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      relevance: (json['relevance'] as num).toDouble(),
      properties: FeatureProperties.fromJson(
          json['properties'] as Map<String, dynamic>),
      text: json['text'] as String,
      placeName: json['place_name'] as String,
      center: (json['center'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      geometry:
          FeatureGeometry.fromJson(json['geometry'] as Map<String, dynamic>),
      context: (json['context'] as List<dynamic>)
          .map((e) => FeatureContext.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FeatureModelImplToJson(_$FeatureModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'place_type': instance.placeType,
      'relevance': instance.relevance,
      'properties': instance.properties,
      'text': instance.text,
      'place_name': instance.placeName,
      'center': instance.center,
      'geometry': instance.geometry,
      'context': instance.context,
    };

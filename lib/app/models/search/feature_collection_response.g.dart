// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_collection_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeatureCollectionResponseImpl _$$FeatureCollectionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FeatureCollectionResponseImpl(
      type: json['type'] as String,
      query: (json['query'] as List<dynamic>).map((e) => e as String).toList(),
      features: (json['features'] as List<dynamic>)
          .map((e) => FeatureModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      attribution: json['attribution'] as String,
    );

Map<String, dynamic> _$$FeatureCollectionResponseImplToJson(
        _$FeatureCollectionResponseImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'query': instance.query,
      'features': instance.features,
      'attribution': instance.attribution,
    };

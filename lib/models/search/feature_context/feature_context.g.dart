// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeatureContextImpl _$$FeatureContextImplFromJson(Map<String, dynamic> json) =>
    _$FeatureContextImpl(
      id: json['id'] as String,
      mapboxId: json['mapboxId'] as String,
      wikidata: json['wikidata'] as String?,
      shortCode: json['shortCode'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$$FeatureContextImplToJson(
        _$FeatureContextImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mapboxId': instance.mapboxId,
      'wikidata': instance.wikidata,
      'shortCode': instance.shortCode,
      'text': instance.text,
    };

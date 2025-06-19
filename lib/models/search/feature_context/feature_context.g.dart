// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FeatureContext _$FeatureContextFromJson(Map<String, dynamic> json) =>
    _FeatureContext(
      id: json['id'] as String,
      mapboxId: json['mapboxId'] as String,
      wikidata: json['wikidata'] as String?,
      shortCode: json['shortCode'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$FeatureContextToJson(_FeatureContext instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mapboxId': instance.mapboxId,
      'wikidata': instance.wikidata,
      'shortCode': instance.shortCode,
      'text': instance.text,
    };

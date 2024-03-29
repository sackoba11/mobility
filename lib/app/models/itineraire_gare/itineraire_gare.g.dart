// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itineraire_gare.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItineraireGareImpl _$$ItineraireGareImplFromJson(Map<String, dynamic> json) =>
    _$ItineraireGareImpl(
      source: json['source'] as String,
      destination: json['destination'] as String,
      type: json['type'] as String,
      commune: json['commune'] as String,
    );

Map<String, dynamic> _$$ItineraireGareImplToJson(
        _$ItineraireGareImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
      'destination': instance.destination,
      'type': instance.type,
      'commune': instance.commune,
    };

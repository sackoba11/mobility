// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itineraire_gare.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ItineraireGare _$ItineraireGareFromJson(Map<String, dynamic> json) =>
    _ItineraireGare(
      source: Gare.fromJson(json['source'] as Map<String, dynamic>),
      destination: Gare.fromJson(json['destination'] as Map<String, dynamic>),
      type: const TransportTypeConverter().fromJson(json['type'] as String),
      commune: json['commune'] as String,
    );

Map<String, dynamic> _$ItineraireGareToJson(_ItineraireGare instance) =>
    <String, dynamic>{
      'source': instance.source,
      'destination': instance.destination,
      'type': const TransportTypeConverter().toJson(instance.type),
      'commune': instance.commune,
    };

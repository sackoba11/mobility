// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transit_stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransitStop _$TransitStopFromJson(Map<String, dynamic> json) => _TransitStop(
  osmId: json['osmId'] as String,
  name: json['name'] as String,
  kind: json['kind'] as String,
  lat: (json['lat'] as num).toDouble(),
  lng: (json['lng'] as num).toDouble(),
);

Map<String, dynamic> _$TransitStopToJson(_TransitStop instance) =>
    <String, dynamic>{
      'osmId': instance.osmId,
      'name': instance.name,
      'kind': instance.kind,
      'lat': instance.lat,
      'lng': instance.lng,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Stop _$StopFromJson(Map<String, dynamic> json) => _Stop(
  lat: (json['lat'] as num).toDouble(),
  long: (_readLong(json, 'long') as num).toDouble(),
  label: json['label'] as String?,
  osmId: json['osmId'] as String?,
  direction: json['direction'] as String? ?? '',
);

Map<String, dynamic> _$StopToJson(_Stop instance) => <String, dynamic>{
  'lat': instance.lat,
  'long': instance.long,
  'label': instance.label,
  'osmId': instance.osmId,
  'direction': instance.direction,
};

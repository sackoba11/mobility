// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Stop _$StopFromJson(Map<String, dynamic> json) => _Stop(
  lat: (json['lat'] as num).toDouble(),
  long: (json['long'] as num).toDouble(),
  label: json['label'] as String?,
);

Map<String, dynamic> _$StopToJson(_Stop instance) => <String, dynamic>{
  'lat': instance.lat,
  'long': instance.long,
  'label': instance.label,
};

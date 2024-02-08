// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StopImpl _$$StopImplFromJson(Map<String, dynamic> json) => _$StopImpl(
      label: json['label'] as String?,
      lat: (json['lat'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
    );

Map<String, dynamic> _$$StopImplToJson(_$StopImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'lat': instance.lat,
      'long': instance.long,
    };

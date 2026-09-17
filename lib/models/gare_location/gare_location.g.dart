// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gare_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GareLocation _$GareLocationFromJson(Map<String, dynamic> json) =>
    _GareLocation(
      label: json['label'] as String?,
      lat: (json['lat'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
    );

Map<String, dynamic> _$GareLocationToJson(_GareLocation instance) =>
    <String, dynamic>{
      'label': instance.label,
      'lat': instance.lat,
      'long': instance.long,
    };

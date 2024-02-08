// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusImpl _$$BusImplFromJson(Map<String, dynamic> json) => _$BusImpl(
      number: json['number'] as int,
      source: json['source'] as String,
      destination: json['destination'] as String,
      roadMap: RoadMap.fromJson(json['roadMap'] as Map<String, dynamic>),
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$$BusImplToJson(_$BusImpl instance) => <String, dynamic>{
      'number': instance.number,
      'source': instance.source,
      'destination': instance.destination,
      'roadMap': instance.roadMap,
      'isActive': instance.isActive,
    };

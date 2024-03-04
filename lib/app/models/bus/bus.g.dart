// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BusImpl _$$BusImplFromJson(Map<String, dynamic> json) => _$BusImpl(
      number: json['number'] as int,
      source: json['source'] as String,
      destination: json['destination'] as String,
      isActive: json['isActive'] as bool,
      roadMap: (json['roadMap'] as List<dynamic>)
          .map((e) => Stop.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BusImplToJson(_$BusImpl instance) => <String, dynamic>{
      'number': instance.number,
      'source': instance.source,
      'destination': instance.destination,
      'isActive': instance.isActive,
      'roadMap': instance.roadMap,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gare.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GareImpl _$$GareImplFromJson(Map<String, dynamic> json) => _$GareImpl(
      name: json['name'] as String,
      commune: json['commune'] as String,
      type: json['type'] as String,
      location: Stop.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GareImplToJson(_$GareImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'commune': instance.commune,
      'type': instance.type,
      'location': instance.location,
    };

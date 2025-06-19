// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gare.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Gare _$GareFromJson(Map<String, dynamic> json) => _Gare(
      name: json['name'] as String,
      commune: json['commune'] as String,
      type: json['type'] as String,
      location: json['location'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$GareToJson(_Gare instance) => <String, dynamic>{
      'name': instance.name,
      'commune': instance.commune,
      'type': instance.type,
      'location': instance.location,
    };

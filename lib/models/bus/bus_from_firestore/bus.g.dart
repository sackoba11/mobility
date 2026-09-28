// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Bus _$BusFromJson(Map<String, dynamic> json) => _Bus(
  number: (json['number'] as num).toInt(),
  source: json['source'] as String,
  destination: json['destination'] as String,
  isActive: json['isActive'] as bool,
  roadMap: (json['roadMap'] as List<dynamic>)
      .map((e) => Stop.fromJson(e as Map<String, dynamic>))
      .toList(),
  lineLabel: json['lineLabel'] as String? ?? '',
  category: json['category'] as String? ?? '',
  direction: json['direction'] as String? ?? '',
  variantIndex: (json['variantIndex'] as num?)?.toInt() ?? 1,
  stopIds:
      (json['stopIds'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$BusToJson(_Bus instance) => <String, dynamic>{
  'number': instance.number,
  'source': instance.source,
  'destination': instance.destination,
  'isActive': instance.isActive,
  'roadMap': instance.roadMap,
  'lineLabel': instance.lineLabel,
  'category': instance.category,
  'direction': instance.direction,
  'variantIndex': instance.variantIndex,
  'stopIds': instance.stopIds,
};

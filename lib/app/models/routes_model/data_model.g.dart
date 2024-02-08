// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataModelImpl _$$DataModelImplFromJson(Map<String, dynamic> json) =>
    _$DataModelImpl(
      waypoints: (json['waypoints'] as List<dynamic>?)
          ?.map((e) => Waypoints.fromJson(e as Map<String, dynamic>))
          .toList(),
      routes: (json['routes'] as List<dynamic>?)
          ?.map((e) => Routes.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['code'] as String?,
    );

Map<String, dynamic> _$$DataModelImplToJson(_$DataModelImpl instance) =>
    <String, dynamic>{
      'waypoints': instance.waypoints,
      'routes': instance.routes,
      'code': instance.code,
    };

_$WaypointsImpl _$$WaypointsImplFromJson(Map<String, dynamic> json) =>
    _$WaypointsImpl(
      location: (json['location'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$WaypointsImplToJson(_$WaypointsImpl instance) =>
    <String, dynamic>{
      'location': instance.location,
      'name': instance.name,
    };

_$RoutesImpl _$$RoutesImplFromJson(Map<String, dynamic> json) => _$RoutesImpl(
      legs: (json['legs'] as List<dynamic>?)
          ?.map((e) => Legs.fromJson(e as Map<String, dynamic>))
          .toList(),
      weightName: json['weightName'] as String?,
      geometry: json['geometry'] == null
          ? null
          : Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      weight: (json['weight'] as num?)?.toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
      duration: (json['duration'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$RoutesImplToJson(_$RoutesImpl instance) =>
    <String, dynamic>{
      'legs': instance.legs,
      'weightName': instance.weightName,
      'geometry': instance.geometry,
      'weight': instance.weight,
      'distance': instance.distance,
      'duration': instance.duration,
    };

_$LegsImpl _$$LegsImplFromJson(Map<String, dynamic> json) => _$LegsImpl(
      steps: json['steps'] as List<dynamic>?,
      weight: (json['weight'] as num?)?.toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
      summary: json['summary'] as String?,
      duration: (json['duration'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$LegsImplToJson(_$LegsImpl instance) =>
    <String, dynamic>{
      'steps': instance.steps,
      'weight': instance.weight,
      'distance': instance.distance,
      'summary': instance.summary,
      'duration': instance.duration,
    };

_$GeometryImpl _$$GeometryImplFromJson(Map<String, dynamic> json) =>
    _$GeometryImpl(
      coordinates: (json['coordinates'] as List<dynamic>?)
          ?.map((e) => e as List<dynamic>)
          .toList(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$GeometryImplToJson(_$GeometryImpl instance) =>
    <String, dynamic>{
      'coordinates': instance.coordinates,
      'type': instance.type,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DataModel _$DataModelFromJson(Map<String, dynamic> json) => _DataModel(
      waypoints: (json['waypoints'] as List<dynamic>?)
          ?.map((e) => Waypoints.fromJson(e as Map<String, dynamic>))
          .toList(),
      routes: (json['routes'] as List<dynamic>?)
          ?.map((e) => Routes.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['code'] as String?,
    );

Map<String, dynamic> _$DataModelToJson(_DataModel instance) =>
    <String, dynamic>{
      'waypoints': instance.waypoints,
      'routes': instance.routes,
      'code': instance.code,
    };

_Waypoints _$WaypointsFromJson(Map<String, dynamic> json) => _Waypoints(
      location: (json['location'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$WaypointsToJson(_Waypoints instance) =>
    <String, dynamic>{
      'location': instance.location,
      'name': instance.name,
    };

_Routes _$RoutesFromJson(Map<String, dynamic> json) => _Routes(
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

Map<String, dynamic> _$RoutesToJson(_Routes instance) => <String, dynamic>{
      'legs': instance.legs,
      'weightName': instance.weightName,
      'geometry': instance.geometry,
      'weight': instance.weight,
      'distance': instance.distance,
      'duration': instance.duration,
    };

_Legs _$LegsFromJson(Map<String, dynamic> json) => _Legs(
      steps: json['steps'] as List<dynamic>?,
      weight: (json['weight'] as num?)?.toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
      summary: json['summary'] as String?,
      duration: (json['duration'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LegsToJson(_Legs instance) => <String, dynamic>{
      'steps': instance.steps,
      'weight': instance.weight,
      'distance': instance.distance,
      'summary': instance.summary,
      'duration': instance.duration,
    };

_Geometry _$GeometryFromJson(Map<String, dynamic> json) => _Geometry(
      coordinates: (json['coordinates'] as List<dynamic>?)
          ?.map((e) => e as List<dynamic>)
          .toList(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$GeometryToJson(_Geometry instance) => <String, dynamic>{
      'coordinates': instance.coordinates,
      'type': instance.type,
    };

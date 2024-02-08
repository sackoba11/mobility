import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:mobility/app/models/stop/stop.dart';

part 'road_map.freezed.dart';
part 'road_map.g.dart';

@freezed
class RoadMap with _$RoadMap {
  factory RoadMap({
    required Map<String, dynamic> roadMap,
  }) = _RoadMap;
  factory RoadMap.fromJson(Map<String, dynamic> json) =>
      _$RoadMapFromJson(json);
}

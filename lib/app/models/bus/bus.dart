import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobility/app/models/road/road_map.dart';

part 'bus.freezed.dart';
part 'bus.g.dart';

@freezed
class Bus with _$Bus {
  factory Bus({
    required int number,
    required String source,
    required String destination,
    required RoadMap roadMap,
    required bool isActive,
  }) = _Bus;
  factory Bus.fromJson(Map<String, dynamic> json) => _$BusFromJson(json);
}

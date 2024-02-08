import 'package:freezed_annotation/freezed_annotation.dart';

part 'road.freezed.dart';
part 'road.g.dart';

@freezed
abstract class Road with _$Road {
  factory Road({required double latitude, required double longitue}) = _Road;
  factory Road.fromJson(Map<String, dynamic> json) => _$RoadFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

import '../stop/stop.dart';

part 'bus.freezed.dart';
part 'bus.g.dart';

@freezed
class Bus with _$Bus {
  factory Bus({
    required int number,
    required String source,
    required String destination,
    required bool isActive,
    required List<Stop> roadMap,
  }) = _Bus;
  factory Bus.fromJson(Map<String, dynamic> json) => _$BusFromJson(json);
}

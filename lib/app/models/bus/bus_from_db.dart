import 'package:freezed_annotation/freezed_annotation.dart';

import '../stop/stop.dart';

part 'bus_from_db.freezed.dart';
part 'bus_from_db.g.dart';

@freezed
abstract class BusFromDb with _$BusFromDb {
  factory BusFromDb(
      {required int number,
      required String source,
      required String destination,
      required bool isActive,
      required List<Stop> roadMap,
      required Stop position,
      required DateTime startDate}) = _BusFromDb;
  factory BusFromDb.fromJson(Map<String, dynamic> json) =>
      _$BusFromDbFromJson(json);
}

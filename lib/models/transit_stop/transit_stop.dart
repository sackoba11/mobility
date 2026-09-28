import 'package:freezed_annotation/freezed_annotation.dart';

part 'transit_stop.freezed.dart';
part 'transit_stop.g.dart';

/// Arrêt ou gare du catalogue OSM importé (collection Firestore `stops`).
@freezed
abstract class TransitStop with _$TransitStop {
  factory TransitStop({
    required String osmId,
    required String name,
    // 'stop' | 'gare' | 'boat' (voir scripts/import-sotra-stops).
    required String kind,
    required double lat,
    required double lng,
  }) = _TransitStop;
  factory TransitStop.fromJson(Map<String, dynamic> json) =>
      _$TransitStopFromJson(json);
}

extension TransitStopX on TransitStop {
  String get kindLabel => switch (kind) {
        'gare' => 'Gare SOTRA',
        'boat' => 'Gare lagunaire',
        _ => 'Arrêt de bus',
      };
}

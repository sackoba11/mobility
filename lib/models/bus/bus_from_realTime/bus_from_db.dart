import 'package:freezed_annotation/freezed_annotation.dart';

import '../../firestore_converters.dart';
import '../../stop/stop.dart';

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
      required Stop? position,
      required DateTime? startDate,
      // Chauffeur propriétaire du service (lien service <-> conducteur).
      // Null pour les docs historiques (compat ascendante).
      required String? driverUid,
      // Heartbeat : mis à jour à chaque position (serverTimestamp).
      // Null pour les docs historiques.
      @TimestampConverter() required DateTime? lastSeen}) = _BusFromDb;
  factory BusFromDb.fromJson(Map<String, dynamic> json) =>
      _$BusFromDbFromJson(json);
}

extension BusFromDbX on BusFromDb {
  /// Fraîcheur du signal : heartbeat récent, sinon date de démarrage
  /// (docs historiques), sinon considéré frais par prudence.
  bool isFresh({Duration maxAge = const Duration(minutes: 5)}) {
    final seen = lastSeen ?? startDate;
    if (seen == null) return true;
    return DateTime.now().difference(seen) < maxAge;
  }
}

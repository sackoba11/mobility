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
      @TimestampConverter() required DateTime? lastSeen,
      // Tracé précalculé de la ligne ([[lng, lat], ...], voir
      // scripts/backfill-route-geometry). Évite tout appel routing
      // au runtime. Null tant que le backfill n'est pas passé.
      @RouteGeometryConverter() required List<List<double>>? routeGeometry,
      // Référentiel `bus` (scripts/import-bus) : affichage fidèle
      // ("02"), catégorie (Express/Monbus/...), sens et variante.
      // @Default : les docs historiques/activeBus anciens restent lisibles.
      @Default('') String lineLabel,
      @Default('') String category,
      @Default('') String direction,
      @Default(1) int variantIndex,
      // Ids OSM des arrêts dans l'ordre (scripts/import-bus/enrich).
      // Sert aux requêtes "bus par ici" (arrayContains côté console).
      @Default([]) List<String> stopIds}) = _BusFromDb;
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

  /// Numéro affiché : label fidèle SOTRA ("02") si connu, sinon le int.
  String get displayNumber =>
      lineLabel.trim().isNotEmpty ? lineLabel.trim() : number.toString();

  /// Sens lisible ("Aller", "Retour", "" si inconnu).
  String get directionLabel => switch (direction.trim().toLowerCase()) {
        'aller' => 'Aller',
        'retour' => 'Retour',
        _ => '',
      };

  /// Descriptif court de la variante ("Express • Aller", "" si inconnu).
  String get variantLabel {
    final parts = [
      category.trim(),
      directionLabel,
      if (variantIndex > 1) 'v$variantIndex',
    ].where((p) => p.isNotEmpty).toList();
    return parts.join(' • ');
  }
}

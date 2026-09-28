import 'package:freezed_annotation/freezed_annotation.dart';

import '../../stop/stop.dart';

part 'bus.freezed.dart';
part 'bus.g.dart';

@freezed
abstract class Bus with _$Bus {
  factory Bus({
    required int number,
    required String source,
    required String destination,
    required bool isActive,
    required List<Stop> roadMap,
    // Référentiel `bus` (scripts/import-bus) : voir BusFromDb.
    @Default('') String lineLabel,
    @Default('') String category,
    @Default('') String direction,
    @Default(1) int variantIndex,
    @Default([]) List<String> stopIds,
  }) = _Bus;
  factory Bus.fromJson(Map<String, dynamic> json) => _$BusFromJson(json);
}

/// Numéro affiché : label fidèle SOTRA ("02") si connu, sinon le int.
extension BusX on Bus {
  String get displayNumber => lineLabel.trim().isNotEmpty ? lineLabel.trim() : number.toString();

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

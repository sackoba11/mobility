import 'package:freezed_annotation/freezed_annotation.dart';

part 'stop.freezed.dart';
part 'stop.g.dart';

/// Lit la longitude : clé `long` (modèle historique) avec repli sur `lng`
/// (roadMap écrites par scripts/import-bus, convention GeoJSON).
Object? _readLong(Map json, String key) => json['long'] ?? json['lng'];

@freezed
abstract class Stop with _$Stop {
  factory Stop({
    required double lat,
    @JsonKey(readValue: _readLong) required double long,
    // Nom lisible de l'arrêt ("Adjamé", "Gare Nord"...).
    // Null pour les roadMap historiques -> fallback "Arrêt N".
    String? label,
    // Référence catalogue OSM ("node/123...", voir scripts/import-sotra-stops).
    String? osmId,
    // Sens de la variante qui dessert cet arrêt ("aller"/"retour",
    // écrit par scripts/import-bus/enrich). Vide si inconnu.
    @Default('') String direction,
  }) = _Stop;
  factory Stop.fromJson(Map<String, dynamic> json) => _$StopFromJson(json);
}

extension StopX on Stop {
  /// Libellé affiché : label Firestore, sinon "Arrêt N", jamais de coords brutes.
  String displayName(int index) {
    final l = label?.trim();
    if (l != null && l.isNotEmpty) return l;
    return "Arrêt ${index + 1}";
  }

  /// Sens lisible ("Aller", "Retour", "" si inconnu).
  String get directionLabel => switch (direction.trim().toLowerCase()) {
        'aller' => 'Aller',
        'retour' => 'Retour',
        _ => '',
      };
}

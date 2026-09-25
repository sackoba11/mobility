import 'package:freezed_annotation/freezed_annotation.dart';

part 'stop.freezed.dart';
part 'stop.g.dart';

@freezed
abstract class Stop with _$Stop {
  factory Stop({
    required double lat,
    required double long,
    // Nom lisible de l'arrêt ("Adjamé", "Gare Nord"...).
    // Null pour les roadMap historiques -> fallback "Arrêt N".
    String? label,
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
}

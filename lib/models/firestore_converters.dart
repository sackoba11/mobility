import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// Convertit les dates Firestore (Timestamp natif, String ISO, int ms)
/// vers DateTime. Indispensable pour les champs écrits via
/// `FieldValue.serverTimestamp()` (lus comme Timestamp).
class TimestampConverter implements JsonConverter<DateTime?, Object?> {
  const TimestampConverter();

  @override
  DateTime? fromJson(Object? json) {
    if (json == null) return null;
    if (json is Timestamp) return json.toDate();
    if (json is String) return DateTime.tryParse(json);
    if (json is int) {
      return DateTime.fromMillisecondsSinceEpoch(json);
    }
    return null;
  }

  @override
  Object? toJson(DateTime? date) => date?.toIso8601String();
}

/// Convertit le tracé stocké vers `List<[lng, lat]>` en mémoire.
/// Firestore refuse les tableaux imbriqués : le backfill écrit des
/// objets `{lng, lat}` (voir scripts/backfill-route-geometry). Accepte
/// aussi l'ancien format `[[lng, lat], ...]` (compat ascendante).
class RouteGeometryConverter
    implements JsonConverter<List<List<double>>?, Object?> {
  const RouteGeometryConverter();

  static double? _num(Object? v) =>
      v is num ? v.toDouble() : double.tryParse(v.toString());

  static double? _lngOf(Map p) => _num(p['lng'] ?? p['long']);

  @override
  List<List<double>>? fromJson(Object? json) {
    if (json == null) return null;
    if (json is! List || json.isEmpty) return null;
    final points = <List<double>>[];
    for (final p in json) {
      if (p is List && p.length >= 2) {
        final lng = _num(p[0]);
        final lat = _num(p[1]);
        if (lng != null && lat != null) points.add([lng, lat]);
      } else if (p is Map) {
        final lng = _lngOf(p);
        final lat = _num(p['lat']);
        if (lng != null && lat != null) points.add([lng, lat]);
      }
    }
    return points.length >= 2 ? points : null;
  }

  @override
  Object? toJson(List<List<double>>? geometry) => geometry;
}

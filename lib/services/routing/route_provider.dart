import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobility/models/stop/stop.dart';

/// Routage runtime SANS Mapbox (stratégie étape 1) :
/// 1. géométrie précalculée stockée en Firestore (cas des lignes de bus),
/// 2. OSRM public gratuit (trajets dynamiques type user -> gare),
/// 3. ligne droite en dernier recours (toujours mieux qu'un écran vide).
abstract class RouteProvider {
  static const _osrmBase =
      'https://router.project-osrm.org/route/v1/driving';

  /// Tracé routier entre points [lng,lat] via OSRM. [] si échec.
  static Future<List<List<double>>> osrmRoute(
      List<List<double>> lngLatPoints) async {
    try {
      if (lngLatPoints.length < 2) return [];
      final coords =
          lngLatPoints.map((p) => '${p[0]},${p[1]}').join(';');
      final url = Uri.parse(
          '$_osrmBase/$coords?overview=full&geometries=geojson');
      final response = await http
          .get(url)
          .timeout(const Duration(seconds: 12));
      if (response.statusCode != 200) return [];
      final body = jsonDecode(response.body);
      if (body is! Map || body['code'] != 'Ok') return [];
      final routes = body['routes'];
      if (routes is! List || routes.isEmpty) return [];
      final geometry = routes.first['geometry'];
      final coordinates = geometry?['coordinates'];
      if (coordinates is! List) return [];
      final parsed = <List<double>>[];
      for (final c in coordinates) {
        if (c is List && c.length >= 2) {
          final lng = (c[0] is num) ? (c[0] as num).toDouble() : null;
          final lat = (c[1] is num) ? (c[1] as num).toDouble() : null;
          if (lng != null && lat != null) parsed.add([lng, lat]);
        }
      }
      return parsed.length >= 2 ? parsed : [];
    } catch (_) {
      return [];
    }
  }

  /// Ligne droite passant par les arrêts ([[lng,lat], ...]).
  static List<List<double>> straightThrough(List<Stop> stops) =>
      stops.map((s) => [s.long, s.lat]).toList();
}

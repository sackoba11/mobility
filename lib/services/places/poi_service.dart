import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// Catégories de points d'intérêt (données OpenStreetMap, sans clé).
enum PoiCategory {
  pharmacy('Pharmacies', Icons.local_pharmacy, 'amenity', ['pharmacy']),
  restaurant('Restaurants', Icons.restaurant, 'amenity', ['restaurant', 'fast_food', 'cafe']),
  hotel('Hôtels', Icons.hotel, 'tourism', ['hotel', 'hostel', 'guest_house']),
  supermarket(
      'Supermarchés', Icons.shopping_cart, 'shop', ['supermarket', 'mall', 'convenience']),
  hospital('Hôpitaux', Icons.local_hospital, 'amenity', ['hospital', 'clinic', 'doctors']),
  bank('Banques', Icons.account_balance, 'amenity', ['bank', 'atm']),
  fuel('Stations', Icons.local_gas_station, 'amenity', ['fuel']);

  final String label;
  final IconData icon;
  final String osmKey;
  final List<String> osmValues;

  const PoiCategory(this.label, this.icon, this.osmKey, this.osmValues);
}

/// Lieu renvoyé par Overpass.
class PoiPlace {
  final String id;
  final String name;
  final double lat;
  final double lng;
  final PoiCategory category;
  final Map<String, String> tags;

  const PoiPlace({
    required this.id,
    required this.name,
    required this.lat,
    required this.lng,
    required this.category,
    this.tags = const {},
  });

  String get details {
    final bits = <String>[];
    final hours = tags['opening_hours'];
    if (hours != null && hours.isNotEmpty) bits.add('⏰ $hours');
    final phone = tags['phone'] ?? tags['contact:phone'];
    if (phone != null && phone.isNotEmpty) bits.add('📞 $phone');
    return bits.join('\n');
  }
}

/// Recherche de POI via Overpass API (gratuit, sans clé, fair-use) :
/// rayons modestes, timeout court, cache mémoire, échec silencieux.
abstract class PoiService {
  static const _endpoint = 'https://overpass-api.de/api/interpreter';
  static const defaultRadius = 1500;
  static const _maxRadius = 3000;

  static final Map<String, List<PoiPlace>> _cache = {};

  static String _cacheKey(
      double lat, double lng, int radius, Set<PoiCategory> cats) {
    final names = cats.map((c) => c.name).toList()..sort();
    return '${lat.toStringAsFixed(3)},${lng.toStringAsFixed(3)}'
        '_$radius'
        '_${names.join('+')}';
  }

  static Future<List<PoiPlace>> fetchNearby({
    required double lat,
    required double lng,
    int radiusMeters = defaultRadius,
    required Set<PoiCategory> categories,
  }) async {
    if (categories.isEmpty) return [];
    final radius = radiusMeters.clamp(100, _maxRadius);
    final key = _cacheKey(lat, lng, radius, categories);
    final cached = _cache[key];
    if (cached != null) return cached;

    try {
      final selectors = <String>[];
      for (final c in categories) {
        final values = c.osmValues.join('|');
        selectors.add(
            'node["${c.osmKey}"~"^($values)\$"](around:$radius,$lat,$lng);');
        selectors.add(
            'way["${c.osmKey}"~"^($values)\$"](around:$radius,$lat,$lng);');
      }
      final query =
          '[out:json][timeout:25];(${selectors.join()});out center 40;';
      final res = await http
          .post(Uri.parse(_endpoint), body: {'data': query}).timeout(
              const Duration(seconds: 30));
      if (res.statusCode != 200) return [];
      final body = jsonDecode(res.body);
      if (body is! Map || body['elements'] is! List) return [];

      final places = <PoiPlace>[];
      for (final e in (body['elements'] as List)) {
        if (e is! Map) continue;
        final tags = <String, String>{};
        final rawTags = e['tags'];
        if (rawTags is Map) {
          rawTags.forEach((k, v) => tags[k.toString()] = v.toString());
        }
        double? plat, plng;
        if (e['lat'] is num && e['lon'] is num) {
          plat = (e['lat'] as num).toDouble();
          plng = (e['lon'] as num).toDouble();
        } else if (e['center'] is Map) {
          final c = e['center'] as Map;
          if (c['lat'] is num && c['lon'] is num) {
            plat = (c['lat'] as num).toDouble();
            plng = (c['lon'] as num).toDouble();
          }
        }
        if (plat == null || plng == null) continue;
        final category = _matchCategory(tags);
        if (category == null || !categories.contains(category)) continue;
        final name = tags['name']?.trim();
        places.add(PoiPlace(
          id: '${e['type']}/${e['id']}',
          name: (name == null || name.isEmpty)
              ? category.label.endsWith('s')
                  ? category.label.substring(0, category.label.length - 1)
                  : category.label
              : name,
          lat: plat,
          lng: plng,
          category: category,
          tags: tags,
        ));
      }
      _cache[key] = places;
      if (_cache.length > 50) {
        _cache.remove(_cache.keys.first);
      }
      return places;
    } catch (_) {
      return [];
    }
  }

  static PoiCategory? _matchCategory(Map<String, String> tags) {
    for (final c in PoiCategory.values) {
      final v = tags[c.osmKey];
      if (v != null && c.osmValues.contains(v)) return c;
    }
    return null;
  }

  static void clearCache() => _cache.clear();
}

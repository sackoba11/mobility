import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobility/models/stop/stop.dart';

/// Bouton "ma position" à poser dans le Stack d'une carte (haut-droite).
/// Centre la caméra sur le GPS (heroTag unique obligatoire : plusieurs
/// cartes coexistent dans l'arbre).
class CenterOnMeButton extends StatelessWidget {
  final MapController mapController;
  final String heroTag;

  const CenterOnMeButton({
    super.key,
    required this.mapController,
    required this.heroTag,
  });

  Future<void> _center() async {
    try {
      if (!await Geolocator.isLocationServiceEnabled()) {
        await Geolocator.openLocationSettings();
        return;
      }
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return;
      }
      final pos = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          timeLimit: Duration(seconds: 10),
        ),
      );
      mapController.move(
          LatLng(pos.latitude, pos.longitude), 16);
    } catch (_) {
      Get.snackbar(
        'Localisation indisponible',
        'Vérifiez le GPS et la permission de localisation.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Positioned(
      // Sous la zone système (cartes plein écran sans SafeArea haute).
      top: 16 + MediaQuery.of(context).padding.top,
      right: 12,
      child: FloatingActionButton.small(
        heroTag: heroTag,
        tooltip: 'Ma position',
        backgroundColor: scheme.surface,
        foregroundColor: scheme.primary,
        onPressed: _center,
        child: const Icon(Icons.my_location),
      ),
    );
  }
}

/// Clé Stadia (gratuite, sans CB : stadiamaps.com > propriété > clé API).
/// Absente = fond Esri sans clé (volontairement minimaliste).
String get _stadiaKey => dotenv.isInitialized
    ? (dotenv.maybeGet('STADIA_API_KEY') ?? '')
    : '';

bool get _hasStadiaKey => _stadiaKey.isNotEmpty;

/// Fond de carte :
/// - avec clé Stadia gratuite : style Google (Alidade Smooth) ;
/// - sans clé : OSM standard détaillé (nos POI et nos arrêts par-dessus).
/// Secours automatique : Esri Grey si le primaire ne répond pas.
class AppTileLayer extends StatelessWidget {
  const AppTileLayer({super.key});

  static const _osmFallback =
      'https://tile.openstreetmap.org/{z}/{x}/{y}.png';
  // Ordre Esri : {z}/{y}/{x}. Niveaux 0-16 (upscale au-delà, jamais blanc).
  static const _esriFallback =
      'https://server.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}';

  @override
  Widget build(BuildContext context) {
    if (_hasStadiaKey) {
      return TileLayer(
        urlTemplate:
            'https://tiles.stadiamaps.com/tiles/alidade_smooth/{z}/{x}/{y}.png?api_key=$_stadiaKey',
        userAgentPackageName: 'com.example.mobility',
        maxZoom: 20,
        maxNativeZoom: 20,
        fallbackUrl: _osmFallback,
      );
    }
    return TileLayer(
      urlTemplate: _osmFallback,
      userAgentPackageName: 'com.example.mobility',
      maxZoom: 19,
      maxNativeZoom: 19,
      fallbackUrl: _esriFallback,
    );
  }
}

/// Attribution selon le fond actif (licence des tuiles).
class MapCredits extends StatelessWidget {
  const MapCredits({super.key});

  @override
  Widget build(BuildContext context) {
    return RichAttributionWidget(
      attributions: [
        if (_hasStadiaKey) ...[
          const TextSourceAttribution('© Stadia Maps'),
          const TextSourceAttribution('© OpenMapTiles'),
        ] else
          const TextSourceAttribution('© Esri'),
        const TextSourceAttribution('© OpenStreetMap contributors'),
      ],
    );
  }
}

/// Épingle bus avec numéro (widget Flutter, aucune génération native).
class BusPin extends StatelessWidget {
  final String label;
  final double height;
  final Color background;

  const BusPin({
    super.key,
    required this.label,
    this.height = 68,
    this.background = const Color(0xFF0B6B4F),
  });

  @override
  Widget build(BuildContext context) {
    final width = height * 0.78;
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: _PinPainter(background),
        child: Align(
          alignment: const Alignment(0, -0.42),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: label.length <= 2
                  ? height * 0.26
                  : height * 0.21,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}

class _PinPainter extends CustomPainter {
  final Color color;
  _PinPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final r = size.width / 2 - 3;
    final cy = r + 3;
    final fill = Paint()..color = color;
    // Pointeur (ui.Path : flutter_map exporte aussi un type Path).
    canvas.drawPath(
      ui.Path()
        ..moveTo(cx - r * 0.72, cy + r * 0.42)
        ..lineTo(cx, size.height - 2)
        ..lineTo(cx + r * 0.72, cy + r * 0.42)
        ..close(),
      fill,
    );
    // Disque + anneau.
    canvas.drawCircle(Offset(cx, cy), r, fill);
    canvas.drawCircle(
      Offset(cx, cy),
      r,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 5,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Pastille d'arrêt (tap ->Callback, ex. dialogue avec le nom).
class StopDot extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;

  const StopDot({super.key, this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          color: color ?? scheme.surface,
          border: Border.all(color: scheme.primary, width: 4),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

// ---------- Conversions ----------

LatLng stopToLatLng(Stop s) => LatLng(s.lat, s.long);

/// Paire [lng,lat] (format stocké / OSRM) -> LatLng.
LatLng lngLatToLatLng(List point, double fallbackLat, double fallbackLng) {
  if (point.length < 2) return LatLng(fallbackLat, fallbackLng);
  final lng = point[0] is num
      ? (point[0] as num).toDouble()
      : double.tryParse(point[0].toString()) ?? fallbackLng;
  final lat = point[1] is num
      ? (point[1] as num).toDouble()
      : double.tryParse(point[1].toString()) ?? fallbackLat;
  return LatLng(lat, lng);
}

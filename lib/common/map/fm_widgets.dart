import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobility/models/stop/stop.dart';

/// Fond de carte sans clé ni abonnement :
/// - primaire : OpenStreetMap standard (gratuit, attribution requise),
/// - secours automatique : Esri Grey Canvas si OSM ne répond pas.
/// (CARTO exige désormais une clé même gratuite + filigrane sinon.)
class AppTileLayer extends StatelessWidget {
  const AppTileLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'com.example.mobility',
      maxZoom: 19,
      maxNativeZoom: 19,
      // Ordre Esri : {z}/{y}/{x}.
      fallbackUrl:
          'https://server.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}',
    );
  }
}

/// Attribution OSM/Esri (licence des tuiles).
class MapCredits extends StatelessWidget {
  const MapCredits({super.key});

  @override
  Widget build(BuildContext context) {
    return const RichAttributionWidget(
      attributions: [
        TextSourceAttribution('© OpenStreetMap contributors'),
        TextSourceAttribution('© Esri'),
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

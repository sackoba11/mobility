import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Icônes de carte générées (plus parlantes que les marqueurs par défaut).
/// Épingle de localisation avec le numéro du bus dedans : reconnaissable
/// d'un coup d'œil parmi les arrêts et la position utilisateur.
abstract class MapMarkers {
  static final Map<int, BitmapDescriptor> _busCache = {};

  /// Icône déjà chargée pour ce numéro, null sinon.
  static BitmapDescriptor? busIcon(int number) => _busCache[number];

  /// Charge (ou récupère du cache) la punaise du bus [number].
  /// Format épingle de localisation avec le numéro dedans.
  static Future<BitmapDescriptor> loadBusIcon(
    int number, {
    Color background = const Color(0xFF0B6B4F),
  }) async {
    final cached = _busCache[number];
    if (cached != null) return cached;

    const size = 180.0;
    const cx = size / 2; // 90
    const cy = 74.0;
    const r = 50.0;
    const tipY = 170.0;
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final fill = Paint()..color = background;

    // Triangle pointeur + disque : même teinte = silhouette d'épingle.
    canvas.drawPath(
      Path()
        ..moveTo(cx - r * 0.72, cy + r * 0.42)
        ..lineTo(cx, tipY)
        ..lineTo(cx + r * 0.72, cy + r * 0.42)
        ..close(),
      fill,
    );
    canvas.drawCircle(Offset(cx, cy), r, fill);
    // Anneau blanc.
    canvas.drawCircle(
      Offset(cx, cy),
      r,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 9,
    );

    // Numéro centré dans le disque (taille selon les chiffres).
    final label = number.toString();
    final fontSize = label.length <= 2 ? 46.0 : (label.length == 3 ? 38.0 : 32.0);
    final painter = TextPainter(
      text: TextSpan(
        text: label,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.w800,
        ),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(maxWidth: r * 1.6);
    painter.paint(
      canvas,
      Offset(cx - painter.width / 2, cy - painter.height / 2),
    );

    final image =
        await recorder.endRecording().toImage(size.toInt(), size.toInt());
    final bytes =
        await image.toByteData(format: ui.ImageByteFormat.png);
    final descriptor = BitmapDescriptor.bytes(
      bytes!.buffer.asUint8List(),
      width: 56,
      height: 56,
    );
    _busCache[number] = descriptor;
    return descriptor;
  }
}

import 'package:flutter/material.dart';

/// Palette Mobility « Terre ivoire » : vert marque conservé, accents
/// terracotta chaleureux, fonds sable. Clair + sombre (Material 3).
abstract class AppColor {
  // --- Marque ---
  static const Color primary = Color(0xFF0B6B4F);
  static const Color primaryDark = Color(0xFF063827);
  static const Color secondary = Color(0xFFE8710A);
  static const Color secondaryContainer = Color(0xFFFDEBD9);
  static const Color onSecondaryContainer = Color(0xFF7A3A0A);

  // --- Temps réel / proximité (bus en service, "Proche") ---
  static const Color live = Color(0xFF1A7F4B);
  static const Color liveContainer = Color(0xFFD9EEE3);

  // --- Fonds ---
  static const Color background = Color(0xFFF6F2EC);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color surfaceHighest = Color(0xFFEDE6D8);

  // --- Texte ---
  static const Color onSurface = Color(0xFF10201A);
  static const Color textSecondary = Color(0xFF6B6257);
  static const Color gray = Color(0xFFA8AEB1);

  // --- Bordures ---
  static const Color border = Color(0xFFE2D9C8);

  // --- Sémantiques ---
  static const Color error = Color(0xFFB42318);
  static const Color warning = Color(0xFFE8710A);
  static const Color success = Color(0xFF1A7F4B);
  static const Color info = Color(0xFF175CD3);

  // --- Dark mode (teinté chaud) ---
  static const Color darkBackground = Color(0xFF161210);
  static const Color darkSurface = Color(0xFF1E1917);
  static const Color darkBorder = Color(0xFF2E2823);
  static const Color darkHighest = Color(0xFF2A2320);
  static const Color darkOnSurfaceVariant = Color(0xFFC4B8A6);
  static const Color darkPrimary = Color(0xFF7BD3AB);
  static const Color darkOnPrimary = Color(0xFF063827);
  static const Color darkLive = Color(0xFF8BDDB4);
}

/// Vert "temps réel" adapté au mode : lisible sur fond clair comme sombre.
extension LiveColor on BuildContext {
  Color get live =>
      Theme.of(this).brightness == Brightness.dark
          ? AppColor.darkLive
          : AppColor.live;
}

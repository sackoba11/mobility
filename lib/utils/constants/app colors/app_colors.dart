import 'package:flutter/material.dart';

/// Palette Mobility (Phase 4 — refonte design).
/// Les anciens champs sont conservés pour compatibilité, les nouveaux
/// tokens portent le design system Material 3 (clair + sombre).
abstract class AppColor {
  // --- Marque ---
  static Color primary = const Color(0xFF0B6B4F);
  static Color primaryDark = const Color(0xFF08452F);
  static Color secondary = const Color(0xFFFFB020);
  static Color secondaryContainer = const Color(0xFFFFF3D6);

  // --- Fonds ---
  static Color background = const Color(0xFFF3F5F4);
  static Color surface = const Color(0xFFFFFFFF);
  static Color white = const Color(0xFFFFFFFF);

  // --- Texte ---
  static Color onSurface = const Color(0xFF10201A);
  static Color textSecondary = const Color(0xFF66756F);
  static Color gray = const Color(0xFFA8AEB1);

  // --- Bordures ---
  static Color border = const Color(0xFFDDE4E0);

  // --- Sémantiques ---
  static Color error = const Color(0xFFB42318);
  static Color warning = const Color(0xFFE8710A);
  static Color success = const Color(0xFF1A7F4B);
  static Color info = const Color(0xFF175CD3);

  // --- Dark mode ---
  static Color darkBackground = const Color(0xFF0F1513);
  static Color darkSurface = const Color(0xFF172019);
  static Color darkBorder = const Color(0xFF2A3531);
}

import 'package:flutter/material.dart';

/// Typographies Mobility.
/// L'ancienne API (regularSmall, lightSmall...) est conservée pour
/// compatibilité ; les nouveaux styles display/headline/title portent
/// la refonte.
class AppTypography {
  // --- Legacy (conservés, tailles harmonisées) ---
  static Text regularSmall({String? text, Color? color}) {
    return Text(
      text ?? '',
      style: TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.w400),
    );
  }

  static Text regularDefault({String? text, Color? color}) {
    return Text(
      text ?? '',
      style: TextStyle(color: color, fontSize: 15, fontWeight: FontWeight.w400),
    );
  }

  static Text regularBig({String? text, Color? color}) {
    return Text(
      text ?? '',
      style: TextStyle(color: color, fontSize: 19, fontWeight: FontWeight.w600),
    );
  }

  static Text lightSmall({String? text, Color? color}) {
    return Text(
      text ?? '',
      style: TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.w400),
    );
  }

  static Text mediumDefault({String? text, Color? color}) {
    return Text(
      text ?? '',
      style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.w600),
    );
  }

  static Text medium16({String? text, Color? color}) {
    return Text(
      text ?? '',
      style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.w600),
    );
  }

  // --- Refonte : styles directs (sans wrapper Text) ---
  static const TextStyle display = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
  );

  static const TextStyle headline = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle title = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle badge = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w700,
  );
}

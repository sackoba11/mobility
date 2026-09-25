import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/// Thème persisté (Phase shell) : système par défaut, surcharge manuelle
/// depuis l'écran Profil.
abstract class ThemeService {
  static const _key = 'theme_mode';
  static GetStorage get _box => GetStorage();

  static ThemeMode get initial {
    switch (_box.read(_key)?.toString()) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  static ThemeMode get current {
    // Get.isDarkMode reflète le mode effectif (y compris système).
    return Get.isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  static Future<void> setMode(ThemeMode mode) async {
    final value = switch (mode) {
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
      ThemeMode.system => 'system',
    };
    await _box.write(_key, value);
    Get.changeThemeMode(mode);
  }

  static Future<void> toggleDark(bool dark) =>
      setMode(dark ? ThemeMode.dark : ThemeMode.light);
}

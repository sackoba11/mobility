import 'package:flutter/material.dart';

import '../../utils/constants/app colors/app_colors.dart';

/// Thème Material 3 Mobility (Phase 4).
/// Branché dans `main.dart` : theme / darkTheme / ThemeMode.system.
abstract class AppTheme {
  static ThemeData get light {
    final scheme = ColorScheme(
      brightness: Brightness.light,
      primary: AppColor.primary,
      onPrimary: Colors.white,
      primaryContainer: AppColor.liveContainer,
      onPrimaryContainer: AppColor.primaryDark,
      secondary: AppColor.secondary,
      onSecondary: Colors.white,
      secondaryContainer: AppColor.secondaryContainer,
      onSecondaryContainer: AppColor.onSecondaryContainer,
      tertiary: AppColor.info,
      onTertiary: Colors.white,
      error: AppColor.error,
      onError: Colors.white,
      surface: AppColor.surface,
      onSurface: AppColor.onSurface,
      surfaceContainerHighest: AppColor.surfaceHighest,
      onSurfaceVariant: AppColor.textSecondary,
      outline: AppColor.border,
      outlineVariant: AppColor.border,
      shadow: Colors.black,
      scrim: Colors.black,
      inverseSurface: AppColor.onSurface,
      onInverseSurface: Colors.white,
      inversePrimary: const Color(0xFF7BD3AB),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColor.background,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.background,
        foregroundColor: AppColor.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: AppBarTextStyle.title,
      ),
      cardTheme: CardThemeData(
        color: AppColor.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: AppColor.border),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColor.primary,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 56),
          textStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColor.primary,
          minimumSize: const Size(double.infinity, 56),
          side: BorderSide(color: AppColor.primary, width: 1.5),
          textStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColor.primary,
          textStyle:
              const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColor.surface,
        hintStyle: TextStyle(color: AppColor.textSecondary, fontSize: 15),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: AppColor.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: AppColor.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: AppColor.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: AppColor.error),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColor.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        showDragHandle: true,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: AppColor.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColor.onSurface,
        contentTextStyle: const TextStyle(color: Colors.white),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColor.surface,
        selectedColor: AppColor.liveContainer,
        side: BorderSide(color: AppColor.border),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        labelStyle: TextStyle(color: AppColor.onSurface, fontSize: 13),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColor.primary;
          }
          return null;
        }),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      dividerTheme: DividerThemeData(color: AppColor.border, thickness: 1),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColor.primary,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  static ThemeData get dark {
    final scheme = ColorScheme(
      brightness: Brightness.dark,
      primary: AppColor.darkPrimary,
      onPrimary: AppColor.darkOnPrimary,
      primaryContainer: const Color(0xFF0B4A35),
      onPrimaryContainer: const Color(0xFFD9EEE3),
      secondary: const Color(0xFFF0A04B),
      onSecondary: const Color(0xFF3A1E00),
      secondaryContainer: const Color(0xFF4A2A0E),
      onSecondaryContainer: const Color(0xFFFFD9B8),
      tertiary: const Color(0xFF7AA7FF),
      onTertiary: const Color(0xFF0A2A5E),
      error: const Color(0xFFFFB4A8),
      onError: const Color(0xFF680003),
      surface: AppColor.darkSurface,
      onSurface: const Color(0xFFF3ECE1),
      surfaceContainerHighest: AppColor.darkHighest,
      onSurfaceVariant: AppColor.darkOnSurfaceVariant,
      outline: AppColor.darkBorder,
      outlineVariant: AppColor.darkBorder,
      shadow: Colors.black,
      scrim: Colors.black,
      inverseSurface: const Color(0xFFF3ECE1),
      onInverseSurface: const Color(0xFF10201A),
      inversePrimary: AppColor.primary,
    );

    final lightTheme = light;
    // Base sombre (textTheme claire !) : light.copyWith() garderait les
    // textes noirs du clair, invisibles sur fond sombre.
    return ThemeData.dark(useMaterial3: true).copyWith(
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColor.darkBackground,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.darkBackground,
        foregroundColor: const Color(0xFFF3ECE1),
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle:
            AppBarTextStyle.title.copyWith(color: const Color(0xFFF3ECE1)),
      ),
      cardTheme: CardThemeData(
        color: AppColor.darkSurface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: AppColor.darkBorder),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColor.darkPrimary,
          foregroundColor: AppColor.darkOnPrimary,
          minimumSize: const Size(double.infinity, 56),
          textStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColor.darkPrimary,
          minimumSize: const Size(double.infinity, 56),
          side:
              BorderSide(color: AppColor.darkPrimary, width: 1.5),
          textStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColor.darkPrimary,
          textStyle:
              const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColor.darkPrimary,
        foregroundColor: AppColor.darkOnPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColor.darkSurface,
        selectedColor: const Color(0xFF0B4A35),
        side: BorderSide(color: AppColor.darkBorder),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        labelStyle:
            const TextStyle(color: Color(0xFFF3ECE1), fontSize: 13),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColor.darkPrimary;
          }
          return null;
        }),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColor.darkPrimary,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColor.darkSurface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        showDragHandle: true,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: AppColor.darkSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      inputDecorationTheme: lightTheme.inputDecorationTheme.copyWith(
        fillColor: AppColor.darkSurface,
        hintStyle: const TextStyle(
            color: AppColor.darkOnSurfaceVariant, fontSize: 15),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: AppColor.darkBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide:
              BorderSide(color: AppColor.darkPrimary, width: 1.5),
        ),
      ),
      dividerTheme:
          DividerThemeData(color: AppColor.darkBorder, thickness: 1),
    );
  }
}

abstract class AppBarTextStyle {
  static const TextStyle title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Color(0xFF10201A),
  );
}

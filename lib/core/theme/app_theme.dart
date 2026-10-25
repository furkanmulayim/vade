import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'fixed_colors.dart';

class AppTheme {
  static ThemeData get light {
    const colors = AppColors(
      primary: FixedColors.primary,
      onPrimary: FixedColors.onPrimary,
      surface: FixedColors.surfaceLight,
      card: FixedColors.cardLight,
      textPrimary: FixedColors.textPrimaryLight,
      textSecondary: FixedColors.textSecondaryLight,
      border: FixedColors.borderLight,
    );
    final scheme =
        ColorScheme.fromSeed(
          seedColor: colors.primary,
          brightness: Brightness.light,
          primary: colors.primary,
          onPrimary: colors.onPrimary,
          surface: colors.surface,
          onSurface: colors.textPrimary,
          error: Colors.red,
          onError: colors.onPrimary,
        ).copyWith(
          secondary: const Color(0xFF61746D),
          onSecondary: colors.onPrimary,
          surfaceContainerHighest: const Color(0xFFE9EDF0),
          outline: colors.border,
          outlineVariant: colors.border,
          scrim: Colors.black,
        );
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: scheme,
    );
  }

  static ThemeData get dark {
    const colors = AppColors(
      primary: FixedColors.primary,
      onPrimary: FixedColors.onPrimary,
      surface: FixedColors.surfaceDark,
      card: FixedColors.cardDark,
      textPrimary: FixedColors.textPrimaryDark,
      textSecondary: FixedColors.textSecondaryDark,
      border: FixedColors.borderDark,
    );
    final scheme =
        ColorScheme.fromSeed(
          seedColor: colors.primary,
          brightness: Brightness.dark,
          primary: colors.primary,
          onPrimary: colors.onPrimary,
          surface: colors.surface,
          onSurface: colors.textPrimary,
          error: Colors.red,
          onError: colors.onPrimary,
        ).copyWith(
          secondary: const Color(0xFF9CA9A4),
          onSecondary: colors.onPrimary,
          surfaceContainerHighest: const Color(0xFF29313A),
          outline: colors.border,
          outlineVariant: colors.border,
          scrim: Colors.black,
        );
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: scheme,
    );
  }
}

import 'package:flutter/material.dart';

import 'palette.dart';
import 'palette_colors_extension.dart';
import 'widget_themes.dart';

class AppTheme {
  static ThemeData get light {
    const colors = PaletteColorsExtension(
      primary: Palette.primary,
      onPrimary: Palette.onPrimary,
      surface: Palette.surfaceLight,
      surfaceSheet: Palette.surfaceSheetLight,
      card: Palette.cardLight,
      textPrimary: Palette.textPrimaryLight,
      textSecondary: Palette.textSecondaryLight,
      border: Palette.borderLight,
      disabled: Palette.disabledLight,
      relax: Palette.relaxLight,
      backRelax: Palette.relaxBackLight,
      upcoming: Palette.upcomingLight,
      backUpcoming: Palette.upcomingBackLight,
      expired: Palette.expiredLight,
      backExpired: Palette.expiredBackLight,
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
      fontFamily: 'Urbanist',
      textTheme: WidgetThemes.textTheme(colors),
      brightness: Brightness.light,
      colorScheme: scheme,
      appBarTheme: WidgetThemes.appBar(colors),
      tabBarTheme: WidgetThemes.tabBar(colors),
      filledButtonTheme: WidgetThemes.filledButton(colors),
      bottomSheetTheme: WidgetThemes.bottomSheet(colors),
      extensions: [colors],
    );
  }

  static ThemeData get dark {
    const colors = PaletteColorsExtension(
      primary: Palette.primary,
      onPrimary: Palette.onPrimary,
      surface: Palette.surfaceDark,
      surfaceSheet: Palette.surfaceSheetDark,
      card: Palette.cardDark,
      textPrimary: Palette.textPrimaryDark,
      textSecondary: Palette.textSecondaryDark,
      border: Palette.borderDark,
      disabled: Palette.disabledDark,
      relax: Palette.relaxDark,
      backRelax: Palette.relaxBackDark,
      upcoming: Palette.upcomingDark,
      backUpcoming: Palette.upcomingBackDark,
      expired: Palette.expiredDark,
      backExpired: Palette.expiredBackDark,
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
      fontFamily: 'Urbanist',
      textTheme: WidgetThemes.textTheme(colors),
      brightness: Brightness.dark,
      colorScheme: scheme,
      appBarTheme: WidgetThemes.appBar(colors),
      tabBarTheme: WidgetThemes.tabBar(colors),
      filledButtonTheme: WidgetThemes.filledButton(colors),
      bottomSheetTheme: WidgetThemes.bottomSheet(colors),
      extensions: [colors],
    );
  }
}

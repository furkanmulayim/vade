import 'package:material_ui/material_ui.dart';

import 'colors/app_colors.dart';
import 'colors/app_colors_extension.dart';
import 'widget_themes.dart';

class AppTheme {
  static ThemeData get light {
    const colors = AppColorsExtension(
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      surface: AppColors.surfaceLight,
      surfaceSheet: AppColors.surfaceSheetLight,
      card: AppColors.cardLight,
      textPrimary: AppColors.textPrimaryLight,
      textSecondary: AppColors.textSecondaryLight,
      border: AppColors.borderLight,
      disabled: AppColors.disabledLight,
      relax: AppColors.relaxLight,
      backRelax: AppColors.relaxBackLight,
      upcoming: AppColors.upcomingLight,
      backUpcoming: AppColors.upcomingBackLight,
      expired: AppColors.expiredLight,
      backExpired: AppColors.expiredBackLight,
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
      appBarTheme: WidgetThemes.appBar(colors, brightness: scheme.brightness),
      tabBarTheme: WidgetThemes.tabBar(colors),
      switchTheme: WidgetThemes.switchTheme(colors),
      chipTheme: WidgetThemes.chip(colors),
      filledButtonTheme: WidgetThemes.filledButton(colors),
      bottomSheetTheme: WidgetThemes.bottomSheet(colors),
      extensions: [colors],
    );
  }

  static ThemeData get dark {
    const colors = AppColorsExtension(
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      surface: AppColors.surfaceDark,
      surfaceSheet: AppColors.surfaceSheetDark,
      card: AppColors.cardDark,
      textPrimary: AppColors.textPrimaryDark,
      textSecondary: AppColors.textSecondaryDark,
      border: AppColors.borderDark,
      disabled: AppColors.disabledDark,
      relax: AppColors.relaxDark,
      backRelax: AppColors.relaxBackDark,
      upcoming: AppColors.upcomingDark,
      backUpcoming: AppColors.upcomingBackDark,
      expired: AppColors.expiredDark,
      backExpired: AppColors.expiredBackDark,
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
      appBarTheme: WidgetThemes.appBar(colors, brightness: scheme.brightness),
      tabBarTheme: WidgetThemes.tabBar(colors),
      switchTheme: WidgetThemes.switchTheme(colors),
      chipTheme: WidgetThemes.chip(colors),
      filledButtonTheme: WidgetThemes.filledButton(colors),
      bottomSheetTheme: WidgetThemes.bottomSheet(colors),
      extensions: [colors],
    );
  }
}

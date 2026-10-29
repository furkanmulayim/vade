import 'package:flutter/material.dart';

import 'palette_colors_extension.dart';
import 'text_styles.dart';

/// Bileşen temalarını uygulamanın tema renkleriyle oluşturur.
abstract final class WidgetThemes {
  // Text
  static TextTheme textTheme(PaletteColorsExtension colors) =>
      TextTheme(bodyMedium: TextStyles(colors).size14());

  // Filled Button
  static FilledButtonThemeData filledButton(PaletteColorsExtension colors) =>
      FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          disabledBackgroundColor: colors.disabled,
          disabledForegroundColor: colors.border,
        ),
      );

  // App Bar
  static AppBarThemeData appBar(PaletteColorsExtension colors) =>
      AppBarThemeData(
        backgroundColor: colors.card,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 80,
        titleSpacing: 16,
      );
}

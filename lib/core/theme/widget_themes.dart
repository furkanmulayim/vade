import 'package:flutter/material.dart';

import 'palette_colors_extension.dart';
import 'text_styles.dart';

/// Bileşen temalarını uygulamanın tema renkleriyle oluşturur.
abstract final class WidgetThemes {
  // Bottom Sheet
  static BottomSheetThemeData bottomSheet(PaletteColorsExtension colors) =>
      BottomSheetThemeData(
        backgroundColor: colors.surfaceSheet,
        modalBackgroundColor: colors.surfaceSheet,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        clipBehavior: Clip.antiAlias,
      );

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
        toolbarHeight: 64,
        titleSpacing: 16,
      );

  // Tab Bar
  static TabBarThemeData tabBar(PaletteColorsExtension colors) =>
      TabBarThemeData(
        tabAlignment: TabAlignment.start,
        labelPadding: const EdgeInsets.symmetric(horizontal: 12),
        labelColor: colors.primary,
        unselectedLabelColor: colors.textSecondary,
        labelStyle: TextStyles(colors).size14(weight: FontWeight.w600),
        unselectedLabelStyle: TextStyles(colors).size14(),
        indicatorColor: colors.primary,
        dividerColor: colors.border,
        splashFactory: NoSplash.splashFactory,
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (states) =>
              states.contains(WidgetState.pressed) ? Colors.transparent : null,
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors/app_colors_extension.dart';
import 'typography/app_text_styles.dart';

/// Bileşen temalarını uygulamanın tema renkleriyle oluşturur.
abstract final class WidgetThemes {
  // Bottom Sheet
  static BottomSheetThemeData bottomSheet(AppColorsExtension colors) =>
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
  static TextTheme textTheme(AppColorsExtension colors) =>
      TextTheme(bodyMedium: AppTextStyles(colors).size14());

  // Filled Button
  static FilledButtonThemeData filledButton(AppColorsExtension colors) =>
      FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          disabledBackgroundColor: colors.disabled,
          disabledForegroundColor: colors.border,
        ),
      );

  // App Bar
  static AppBarThemeData appBar(
    AppColorsExtension colors, {
    required Brightness brightness,
  }) => AppBarThemeData(
    systemOverlayStyle: brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark,
    backgroundColor: colors.card,
    surfaceTintColor: Colors.transparent,
    titleTextStyle: AppTextStyles(colors).size21(),
    elevation: 0,
    scrolledUnderElevation: 0,
    toolbarHeight: 64,
    titleSpacing: 16,
  );

  // Tab Bar
  static TabBarThemeData tabBar(AppColorsExtension colors) => TabBarThemeData(
    tabAlignment: TabAlignment.start,
    labelPadding: const EdgeInsets.symmetric(horizontal: 12),
    labelColor: colors.primary,
    unselectedLabelColor: colors.textSecondary,
    labelStyle: AppTextStyles(colors).size14(weight: FontWeight.w600),
    unselectedLabelStyle: AppTextStyles(colors).size14(),
    indicatorColor: colors.primary,
    dividerColor: colors.border,
    splashFactory: NoSplash.splashFactory,
    overlayColor: WidgetStateProperty.resolveWith<Color?>(
      (states) =>
          states.contains(WidgetState.pressed) ? Colors.transparent : null,
    ),
  );
}

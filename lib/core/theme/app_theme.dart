import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'fixed_colors.dart';

class AppTheme {
  static const _radius = 14.0;
  static const _controlHeight = 52.0;

  static ThemeData get light => _build(Brightness.light);
  static ThemeData get dark => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final colors = AppColors(
      primary: FixedColors.primary,
      onPrimary: FixedColors.onPrimary,
      surface: isDark ? FixedColors.surfaceDark : FixedColors.surfaceLight,
      cardBack: isDark ? FixedColors.cardBackDark : FixedColors.cardBackLight,
      cardFront: isDark
          ? FixedColors.cardFrontDark
          : FixedColors.cardFrontLight,
      textPrimary: isDark
          ? FixedColors.textPrimaryDark
          : FixedColors.textPrimaryLight,
      textSecondary: isDark
          ? FixedColors.textSecondaryDark
          : FixedColors.textSecondaryLight,
      iconPrimary: isDark
          ? FixedColors.iconPrimaryDark
          : FixedColors.iconPrimaryLight,
      iconSecondary: isDark
          ? FixedColors.iconSecondaryDark
          : FixedColors.iconSecondaryLight,
      border: isDark ? FixedColors.borderDark : FixedColors.borderLight,
      disabled: isDark ? FixedColors.disabledDark : FixedColors.disabledLight,
      shadow: isDark ? FixedColors.shadowDark : FixedColors.shadowLight,
    );
    final scheme =
        ColorScheme.fromSeed(
          seedColor: colors.primary,
          brightness: brightness,
          primary: colors.primary,
          onPrimary: colors.onPrimary,
          surface: colors.surface,
          onSurface: colors.textPrimary,
          error: FixedColors.error,
          onError: colors.onPrimary,
        ).copyWith(
          secondary: isDark ? const Color(0xFF9CA9A4) : const Color(0xFF61746D),
          onSecondary: colors.onPrimary,
          surfaceContainerLowest: colors.cardBack,
          surfaceContainerLow: colors.cardBack,
          surfaceContainer: colors.cardFront,
          surfaceContainerHigh: colors.cardFront,
          surfaceContainerHighest: isDark
              ? const Color(0xFF29313A)
              : const Color(0xFFE9EDF0),
          outline: colors.border,
          outlineVariant: colors.border,
          shadow: colors.shadow,
          scrim: Colors.black,
        );
    final baseTextTheme =
        Typography.material2021(
          platform: TargetPlatform.iOS,
          colorScheme: scheme,
        ).black.apply(
          bodyColor: colors.textPrimary,
          displayColor: colors.textPrimary,
          decorationColor: colors.textPrimary,
        );
    final textTheme = baseTextTheme.copyWith(
      headlineSmall: baseTextTheme.headlineSmall?.copyWith(
        fontSize: 24,
        height: 1.2,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.35,
      ),
      titleLarge: baseTextTheme.titleLarge?.copyWith(
        fontSize: 20,
        height: 1.25,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.2,
      ),
      titleMedium: baseTextTheme.titleMedium?.copyWith(
        fontSize: 16,
        height: 1.3,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: baseTextTheme.titleSmall?.copyWith(
        fontSize: 14,
        height: 1.3,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: baseTextTheme.bodyLarge?.copyWith(
        fontSize: 16,
        height: 1.45,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: baseTextTheme.bodyMedium?.copyWith(
        fontSize: 14,
        height: 1.4,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: baseTextTheme.bodySmall?.copyWith(
        fontSize: 12,
        height: 1.35,
        color: colors.textSecondary,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: baseTextTheme.labelLarge?.copyWith(
        fontSize: 14,
        height: 1.2,
        fontWeight: FontWeight.w600,
      ),
      labelMedium: baseTextTheme.labelMedium?.copyWith(
        fontSize: 12,
        height: 1.2,
        fontWeight: FontWeight.w500,
      ),
    );
    final rounded = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(_radius),
    );
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(_radius),
      borderSide: BorderSide(color: colors.border),
    );
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: colors.surface,
      canvasColor: colors.surface,
      cardColor: colors.cardBack,
      disabledColor: colors.disabled,
      shadowColor: colors.shadow.withValues(alpha: isDark ? .2 : .07),
      highlightColor: Colors.transparent,
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      extensions: [colors],
      iconTheme: IconThemeData(color: colors.iconPrimary, size: 22),
      primaryIconTheme: IconThemeData(color: colors.iconPrimary, size: 22),
      dividerTheme: DividerThemeData(
        color: colors.border,
        thickness: 1,
        space: 1,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colors.surface,
        surfaceTintColor: Colors.transparent,
        foregroundColor: colors.textPrimary,
        scrolledUnderElevation: 0,
        elevation: 0,
        titleSpacing: 16,
        leadingWidth: 56,
        centerTitle: false,
        toolbarHeight: 60,
        iconTheme: IconThemeData(color: colors.iconPrimary, size: 22),
        titleTextStyle: textTheme.headlineSmall,
      ),
      cardTheme: CardThemeData(
        color: colors.cardBack,
        surfaceTintColor: Colors.transparent,
        shadowColor: colors.shadow.withValues(alpha: isDark ? .18 : .07),
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_radius),
          side: BorderSide(color: colors.border),
        ),
        clipBehavior: Clip.antiAlias,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(64, _controlHeight),
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          disabledBackgroundColor: colors.disabled.withValues(alpha: .55),
          disabledForegroundColor: colors.textSecondary,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: rounded,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          textStyle: textTheme.labelLarge,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.cardBack,
        constraints: const BoxConstraints(minHeight: _controlHeight),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        labelStyle: textTheme.bodyMedium?.copyWith(color: colors.textSecondary),
        floatingLabelStyle: textTheme.bodyMedium?.copyWith(
          color: colors.primary,
        ),
        border: inputBorder,
        enabledBorder: inputBorder,
        disabledBorder: inputBorder.copyWith(
          borderSide: BorderSide(color: colors.border.withValues(alpha: .65)),
        ),
        focusedBorder: inputBorder.copyWith(
          borderSide: BorderSide(color: colors.primary, width: 1.4),
        ),
        errorBorder: inputBorder.copyWith(
          borderSide: const BorderSide(color: FixedColors.error),
        ),
        focusedErrorBorder: inputBorder.copyWith(
          borderSide: const BorderSide(color: FixedColors.error, width: 1.4),
        ),
      ),
    );
  }
}

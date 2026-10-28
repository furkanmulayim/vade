import 'package:flutter/material.dart';

@immutable
class PaletteColorsExtension extends ThemeExtension<PaletteColorsExtension> {
  const PaletteColorsExtension({
    required this.primary,
    required this.onPrimary,
    required this.surface,
    required this.card,
    required this.textPrimary,
    required this.textSecondary,
    required this.border,
    required this.success,
    required this.backSuccess,
    required this.warning,
    required this.backWarning,
    required this.danger,
    required this.backDanger,
  });
  final Color primary;
  final Color onPrimary;
  final Color surface;
  final Color card;
  final Color textPrimary;
  final Color textSecondary;
  final Color border;
  final Color success;
  final Color backSuccess;
  final Color warning;
  final Color backWarning;
  final Color danger;
  final Color backDanger;

  @override
  PaletteColorsExtension copyWith({
    Color? primary,
    Color? onPrimary,
    Color? surface,
    Color? card,
    Color? textPrimary,
    Color? textSecondary,
    Color? iconPrimary,
    Color? iconSecondary,
    Color? border,
    Color? disabled,
    Color? shadow,
    Color? success,
    Color? backSuccess,
    Color? warning,
    Color? backWarning,
    Color? danger,
    Color? backDanger,
  }) => PaletteColorsExtension(
    primary: primary ?? this.primary,
    onPrimary: onPrimary ?? this.onPrimary,
    surface: surface ?? this.surface,
    card: card ?? this.card,
    textPrimary: textPrimary ?? this.textPrimary,
    textSecondary: textSecondary ?? this.textSecondary,
    border: border ?? this.border,
    success: success ?? this.success,
    backSuccess: backSuccess ?? this.backSuccess,
    warning: warning ?? this.warning,
    backWarning: backWarning ?? this.backWarning,
    danger: danger ?? this.danger,
    backDanger: backDanger ?? this.backDanger,
  );

  @override
  PaletteColorsExtension lerp(
    covariant PaletteColorsExtension? other,
    double t,
  ) {
    if (other == null) return this;
    return PaletteColorsExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      card: Color.lerp(card, other.card, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      border: Color.lerp(border, other.border, t)!,
      success: Color.lerp(success, other.success, t)!,
      backSuccess: Color.lerp(backSuccess, other.backSuccess, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      backWarning: Color.lerp(backWarning, other.backWarning, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      backDanger: Color.lerp(backDanger, other.backDanger, t)!,
    );
  }
}

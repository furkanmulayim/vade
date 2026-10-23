import 'package:flutter/material.dart';

/// Bebiva ile birebir aynı semantic renk sözleşmesi.
@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.primary,
    required this.onPrimary,
    required this.surface,
    required this.cardFront,
    required this.cardBack,
    required this.textPrimary,
    required this.textSecondary,
    required this.iconPrimary,
    required this.iconSecondary,
    required this.border,
    required this.disabled,
    required this.shadow,
  });
  final Color primary;
  final Color onPrimary;
  final Color surface;
  final Color cardFront;
  final Color cardBack;
  final Color textPrimary;
  final Color textSecondary;
  final Color iconPrimary;
  final Color iconSecondary;
  final Color border;
  final Color disabled;
  final Color shadow;

  @override
  AppColors copyWith({
    Color? primary,
    Color? onPrimary,
    Color? surface,
    Color? cardFront,
    Color? cardBack,
    Color? textPrimary,
    Color? textSecondary,
    Color? iconPrimary,
    Color? iconSecondary,
    Color? border,
    Color? disabled,
    Color? shadow,
  }) => AppColors(
    primary: primary ?? this.primary,
    onPrimary: onPrimary ?? this.onPrimary,
    surface: surface ?? this.surface,
    cardFront: cardFront ?? this.cardFront,
    cardBack: cardBack ?? this.cardBack,
    textPrimary: textPrimary ?? this.textPrimary,
    textSecondary: textSecondary ?? this.textSecondary,
    iconPrimary: iconPrimary ?? this.iconPrimary,
    iconSecondary: iconSecondary ?? this.iconSecondary,
    border: border ?? this.border,
    disabled: disabled ?? this.disabled,
    shadow: shadow ?? this.shadow,
  );

  @override
  AppColors lerp(covariant AppColors? other, double t) {
    if (other == null) return this;
    return AppColors(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      cardFront: Color.lerp(cardFront, other.cardFront, t)!,
      cardBack: Color.lerp(cardBack, other.cardBack, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      iconPrimary: Color.lerp(iconPrimary, other.iconPrimary, t)!,
      iconSecondary: Color.lerp(iconSecondary, other.iconSecondary, t)!,
      border: Color.lerp(border, other.border, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
    );
  }
}

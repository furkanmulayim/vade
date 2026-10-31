import 'package:flutter/material.dart';

@immutable
class PaletteColorsExtension extends ThemeExtension<PaletteColorsExtension> {
  const PaletteColorsExtension({
    required this.primary,
    required this.onPrimary,
    required this.surface,
    required this.surfaceSheet,
    required this.card,
    required this.textPrimary,
    required this.textSecondary,
    required this.border,
    required this.disabled,
    required this.relax,
    required this.backRelax,
    required this.upcoming,
    required this.backUpcoming,
    required this.expired,
    required this.backExpired,
  });
  final Color primary;
  final Color onPrimary;
  final Color surface;
  final Color surfaceSheet;
  final Color card;
  final Color textPrimary;
  final Color textSecondary;
  final Color border;
  final Color disabled;
  final Color relax;
  final Color backRelax;
  final Color upcoming;
  final Color backUpcoming;
  final Color expired;
  final Color backExpired;

  @override
  PaletteColorsExtension copyWith({
    Color? primary,
    Color? onPrimary,
    Color? surface,
    Color? surfaceSheet,
    Color? card,
    Color? textPrimary,
    Color? textSecondary,
    Color? iconPrimary,
    Color? iconSecondary,
    Color? border,
    Color? disabled,
    Color? shadow,
    Color? relax,
    Color? backRelax,
    Color? upcoming,
    Color? backUpcoming,
    Color? expired,
    Color? backExpired,
  }) => PaletteColorsExtension(
    primary: primary ?? this.primary,
    onPrimary: onPrimary ?? this.onPrimary,
    surface: surface ?? this.surface,
    surfaceSheet: surfaceSheet ?? this.surfaceSheet,
    card: card ?? this.card,
    textPrimary: textPrimary ?? this.textPrimary,
    textSecondary: textSecondary ?? this.textSecondary,
    border: border ?? this.border,
    disabled: disabled ?? this.disabled,
    relax: relax ?? this.relax,
    backRelax: backRelax ?? this.backRelax,
    upcoming: upcoming ?? this.upcoming,
    backUpcoming: backUpcoming ?? this.backUpcoming,
    expired: expired ?? this.expired,
    backExpired: backExpired ?? this.backExpired,
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
      surfaceSheet: Color.lerp(surfaceSheet, other.surfaceSheet, t)!,
      card: Color.lerp(card, other.card, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      border: Color.lerp(border, other.border, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
      relax: Color.lerp(relax, other.relax, t)!,
      backRelax: Color.lerp(backRelax, other.backRelax, t)!,
      upcoming: Color.lerp(upcoming, other.upcoming, t)!,
      backUpcoming: Color.lerp(backUpcoming, other.backUpcoming, t)!,
      expired: Color.lerp(expired, other.expired, t)!,
      backExpired: Color.lerp(backExpired, other.backExpired, t)!,
    );
  }
}

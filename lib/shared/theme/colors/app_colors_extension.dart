import 'package:material_ui/material_ui.dart';

@immutable
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  const AppColorsExtension({
    required this.primary,
    required this.onPrimary,
    required this.surface,
    required this.surfaceSheet,
    required this.card,
    required this.textPrimary,
    required this.textSecondary,
    required this.border,
    required this.disabled,
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

  @override
  AppColorsExtension copyWith({
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
  }) => AppColorsExtension(
    primary: primary ?? this.primary,
    onPrimary: onPrimary ?? this.onPrimary,
    surface: surface ?? this.surface,
    surfaceSheet: surfaceSheet ?? this.surfaceSheet,
    card: card ?? this.card,
    textPrimary: textPrimary ?? this.textPrimary,
    textSecondary: textSecondary ?? this.textSecondary,
    border: border ?? this.border,
    disabled: disabled ?? this.disabled,
  );

  @override
  AppColorsExtension lerp(covariant AppColorsExtension? other, double t) {
    if (other == null) return this;
    return AppColorsExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceSheet: Color.lerp(surfaceSheet, other.surfaceSheet, t)!,
      card: Color.lerp(card, other.card, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      border: Color.lerp(border, other.border, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
    );
  }
}

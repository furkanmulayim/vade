import 'package:flutter/material.dart';

import 'palette_colors_extension.dart';

/// Urbanist, w500 ve temanın ana metin rengiyle 12–28 arası stiller.
class TextStyles {
  const TextStyles(this._colors);

  final PaletteColorsExtension _colors;

  TextStyle _style(double size, {Color? color, FontWeight? weight}) {
    return TextStyle(
      fontFamily: 'Urbanist',
      fontSize: size,
      fontWeight: weight ?? FontWeight.w500,
      fontStyle: FontStyle.normal,
      color: color ?? _colors.textPrimary,
      height: 0,
      letterSpacing: 0,
    );
  }

  TextStyle size12({Color? color, FontWeight? weight}) =>
      _style(12, color: color, weight: weight);

  TextStyle size13({Color? color, FontWeight? weight}) =>
      _style(13, color: color, weight: weight);

  TextStyle size14({Color? color, FontWeight? weight}) =>
      _style(14, color: color, weight: weight);

  TextStyle size15({Color? color, FontWeight? weight}) =>
      _style(15, color: color, weight: weight);

  TextStyle size16({Color? color, FontWeight? weight}) =>
      _style(16, color: color, weight: weight);

  TextStyle size17({Color? color, FontWeight? weight}) =>
      _style(17, color: color, weight: weight);

  TextStyle size18({Color? color, FontWeight? weight}) =>
      _style(18, color: color, weight: weight);

  TextStyle size19({Color? color, FontWeight? weight}) =>
      _style(19, color: color, weight: weight);

  TextStyle size20({Color? color, FontWeight? weight}) =>
      _style(20, color: color, weight: weight);

  TextStyle size21({Color? color, FontWeight? weight}) =>
      _style(21, color: color, weight: weight);

  TextStyle size22({Color? color, FontWeight? weight}) =>
      _style(22, color: color, weight: weight);

  TextStyle size23({Color? color, FontWeight? weight}) =>
      _style(23, color: color, weight: weight);

  TextStyle size24({Color? color, FontWeight? weight}) =>
      _style(24, color: color, weight: weight);

  TextStyle size25({Color? color, FontWeight? weight}) =>
      _style(25, color: color, weight: weight);

  TextStyle size26({Color? color, FontWeight? weight}) =>
      _style(26, color: color, weight: weight);

  TextStyle size27({Color? color, FontWeight? weight}) =>
      _style(27, color: color, weight: weight);

  TextStyle size28({Color? color, FontWeight? weight}) =>
      _style(28, color: color, weight: weight);
}

import 'package:flutter/material.dart';

import '../extensions/context_extension.dart';

/// Bebiva ile birebir aynı metin stili API'si.
abstract final class Typo {
  static TextStyle _styled({
    required BuildContext context,
    required double size,
    FontWeight? weight,
    Color? color,
  }) => TextStyle(
    fontSize: size,
    fontWeight: weight ?? FontWeight.w400,
    height: 1.25,
    letterSpacing: size >= 20 ? -0.25 : 0,
    fontStyle: FontStyle.normal,
    color: color ?? context.color.textPrimary,
  );
  static TextStyle size27(
    BuildContext context, [
    Color? color,
    FontWeight? weight,
  ]) => _styled(context: context, size: 27, color: color, weight: weight);
  static TextStyle size24(
    BuildContext context, [
    Color? color,
    FontWeight? weight,
  ]) => _styled(context: context, size: 24, color: color, weight: weight);
  static TextStyle figma17(
    BuildContext context, [
    Color? color,
    FontWeight? weight,
  ]) => _styled(context: context, size: 20, color: color, weight: weight);
  static TextStyle figma15(
    BuildContext context, [
    Color? color,
    FontWeight? weight,
  ]) => _styled(context: context, size: 18, color: color, weight: weight);
  static TextStyle figma14(
    BuildContext context, [
    Color? color,
    FontWeight? weight,
  ]) => _styled(context: context, size: 16, color: color, weight: weight);
  static TextStyle figma13(
    BuildContext context, [
    Color? color,
    FontWeight? weight,
  ]) => _styled(context: context, size: 15, color: color, weight: weight);
  static TextStyle figma12(
    BuildContext context, [
    Color? color,
    FontWeight? weight,
  ]) => _styled(context: context, size: 14, color: color, weight: weight);
  static TextStyle figma11(
    BuildContext context, [
    Color? color,
    FontWeight? weight,
  ]) => _styled(context: context, size: 13, color: color, weight: weight);
  static TextStyle figma10(
    BuildContext context, [
    Color? color,
    FontWeight? weight,
  ]) => _styled(context: context, size: 12, color: color, weight: weight);
  static TextStyle figma9(
    BuildContext context, [
    Color? color,
    FontWeight? weight,
  ]) => _styled(context: context, size: 10, color: color, weight: weight);
}

/// Typography stillerine context üzerinden kısa erişim sağlar.
extension TypoContextExtension on BuildContext {
  TextStyle size27({int? w, Color? color}) =>
      Typo.size27(this, color, _weight(w));

  TextStyle size24({int? w, Color? color}) =>
      Typo.size24(this, color, _weight(w));

  TextStyle figma17({int? w, Color? color}) =>
      Typo.figma17(this, color, _weight(w));

  TextStyle figma15({int? w, Color? color}) =>
      Typo.figma15(this, color, _weight(w));

  TextStyle figma14({int? w, Color? color}) =>
      Typo.figma14(this, color, _weight(w));

  TextStyle figma13({int? w, Color? color}) =>
      Typo.figma13(this, color, _weight(w));

  TextStyle figma12({int? w, Color? color}) =>
      Typo.figma12(this, color, _weight(w));

  TextStyle figma11({int? w, Color? color}) =>
      Typo.figma11(this, color, _weight(w));

  TextStyle figma10({int? w, Color? color}) =>
      Typo.figma10(this, color, _weight(w));

  TextStyle figma9({int? w, Color? color}) =>
      Typo.figma9(this, color, _weight(w));

  FontWeight? _weight(int? value) {
    if (value == null) return null;
    assert(
      value >= 100 && value <= 900 && value % 100 == 0,
      "w değeri 100 ile 900 arasında, 100'ün katı olmalıdır.",
    );
    return FontWeight.values[(value ~/ 100) - 1];
  }
}

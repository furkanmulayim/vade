import 'package:flutter/material.dart';

abstract final class Palette {
  //Primary
  static const primary = Color(0xFFFA7319);
  static const onPrimary = Colors.white;

  //Surface
  static const surfaceLight = Color(0xFFF7F7F7);
  static const surfaceDark = Color(0xFF111111);

  //Card
  static const cardLight = Color(0xFFFFFFFF);
  static const cardDark = Color(0xFF202020);

  //Text
  static const textPrimaryLight = Color(0xFF202020);
  static const textPrimaryDark = Color(0xFFF9F9F9);

  static const textSecondaryLight = Color(0xFF70747C);
  static const textSecondaryDark = Color(0xFFA6A6A6);

  //Border
  static const borderLight = Color(0xFFEFEFEF);
  static const borderDark = Color(0xFF363636);

  static const disabledLight = Color(0xFFB4B4B4);
  static const disabledDark = Color(0xFF4D4D4D);

  //Relax
  static const relaxLight = Color(0xFF3DAE2B);
  static const relaxDark = Color(0xFF478C3C);

  static const relaxBackLight = Color(0xFFF3FFF8);
  static const relaxBackDark = Color(0xFF24352B);

  //Upcoming
  static const upcomingLight = Color(0xFFFA7319);
  static const upcomingDark = Color(0xFFBC6F3B);

  static const upcomingBackLight = Color(0xFFFFF9EB);
  static const upcomingBackDark = Color(0xFF332D1F);

  //Expired
  static const expiredLight = Color(0xFFFB3748);
  static const expiredDark = Color(0xFFD03D49);

  static const expiredBackLight = Color(0xFFF44336);
  static const expiredBackDark = Color(0xFF392222);
}

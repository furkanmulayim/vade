import 'package:flutter/material.dart';

abstract final class AppLocalization {
  static const path = 'assets/translations';
  static const fallbackLocale = Locale('tr');
  static const supportedLocales = [
    Locale('tr'),
    Locale('en'),
    Locale('de'),
    Locale('fr'),
    Locale('ru'),
    Locale('zh'),
  ];
}

import 'package:flutter/material.dart';

/// Uygulama geneline ait, feature bağımsız UI state'ini yönetir.
class AppProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void changeThemeMode(ThemeMode themeMode) {
    if (_themeMode == themeMode) return;
    _themeMode = themeMode;
    notifyListeners();
  }
}

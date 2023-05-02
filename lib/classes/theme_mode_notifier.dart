import 'package:flutter/material.dart';

class ThemeModeNotifier with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeModeNotifier({ThemeMode? themeMode}) {
    _themeMode = themeMode ?? _themeMode;
  }

  ThemeMode get themeMode => _themeMode;

  void set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}

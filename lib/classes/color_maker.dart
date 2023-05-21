import 'dart:math';
import 'package:flutter/material.dart';

class ColorMaker {
  static Color _getShadeColor(Color color, double factor) => Color.fromRGBO(
      _getShadeValue(color.red, factor),
      _getShadeValue(color.green, factor),
      _getShadeValue(color.blue, factor),
      1);

  static int _getShadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  static Color _getTintColor(Color color, double factor) => Color.fromRGBO(
      _getTintValue(color.red, factor),
      _getTintValue(color.green, factor),
      _getTintValue(color.blue, factor),
      1);

  static int _getTintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  static MaterialColor? combineMaterialColors(
      {required MaterialColor first,
      required MaterialColor second,
      double dominance = 0.5}) {
    return toMaterialColor(color: Color.lerp(first, second, dominance));
  }

  static MaterialColor combineMultipleMaterialColor({
    required List<MaterialColor?> materialColors,
    double dominance = 0.5,
  }) {
    Color color = materialColors[0] ?? Colors.transparent;
    for (int i = 1; i < materialColors.length; i++) {
      if (materialColors[i] != null) {
        color = Color.lerp(color, materialColors[i]!, dominance)!;
      }
    }
    return toMaterialColor(color: color);
  }

  static MaterialColor toMaterialColor({required color}) {
    return MaterialColor(color.value, {
      50: _getTintColor(color, 0.9),
      100: _getTintColor(color, 0.8),
      200: _getTintColor(color, 0.6),
      300: _getTintColor(color, 0.4),
      400: _getTintColor(color, 0.2),
      500: color,
      600: _getShadeColor(color, 0.1),
      700: _getShadeColor(color, 0.2),
      800: _getShadeColor(color, 0.3),
      900: _getShadeColor(color, 0.4),
    });
  }
}

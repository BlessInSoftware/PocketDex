import 'package:flutter/material.dart';
import 'package:pocketdex/classes/material_color_generator.dart';

class ColorCombine {
  static int combine(int r, int g, int b) {
    return (r << 16) + (g << 8) + b;
  }

  static Color? twoMaterialColors(
      {required MaterialColor first,
      required MaterialColor second,
      double dominance = 0.5}) {
    return Color.lerp(first, second, dominance);
  }

  static MaterialColor multipleMaterialColors({
    required List<MaterialColor?> materialColors,
    double dominance = 0.5,
  }) {
    Color color = materialColors[0] ?? Colors.transparent;
    for (int i = 1; i < materialColors.length; i++) {
      if (materialColors[i] != null) {
        color = Color.lerp(color, materialColors[i]!, dominance)!;
      }
    }
    return MaterialColorGenerator(color: color).generate();
  }
}

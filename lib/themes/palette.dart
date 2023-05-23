import 'package:flutter/material.dart';

import 'package:pocketdex/classes/color_maker.dart';
import 'package:pocketdex/themes/colors.dart';

final Map<String, Map<String, MaterialColor>> palette =
    Map<String, Map<String, MaterialColor>>.from(
        convertedColors.map((colorCategoryList, colorList) {
  return MapEntry(colorCategoryList,
      Map<String, MaterialColor>.from(colorList.map((colorName, color) {
    return MapEntry(colorName, ColorMaker.toMaterialColor(color: color));
  })));
}));

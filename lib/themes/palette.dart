import 'package:flutter/material.dart';
import 'package:pocketdex/classes/material_color_generator.dart';
import 'package:pocketdex/themes/colors.dart';

final palette = Map<String, Map<String, MaterialColor>>.from(
    convertedColors.map((key, value) {
  return MapEntry(key, Map<String, MaterialColor>.from(value.map((k, v) {
    return MapEntry(k, MaterialColorGenerator(color: v).generate());
  })));
}));

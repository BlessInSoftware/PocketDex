import 'package:flutter/material.dart';

import 'package:pocketdex/classes/hexcolor.dart';

const Map<String, Map<String, String>> colors = {
  'common': {
    'space-cadet': '#2B2D42',
    'cool-gray': '#8D99AE',
    'anti-flash-white': '#EDF2F4',
    'bittersweet': '#FF5A5F',
    'red-pantone': '#EF233C',
  },
};

final convertedColors =
    Map<String, Map<String, Color>>.from(colors.map((key, value) {
  return MapEntry(key, Map<String, Color>.from(value.map((k, v) {
    return MapEntry(k, HexColor(color: v).toColor());
  })));
}));

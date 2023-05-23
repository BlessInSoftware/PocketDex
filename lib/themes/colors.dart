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
  'types': {
    'bug': '#A8B820',
    'dark': '#705848',
    'dragon': '#7038F8',
    'electric': '#F8D030',
    'fairy': '#EE99AC',
    'fighting': '#C03028',
    'fire': '#F08030',
    'flying': '#A890F0',
    'ghost': '#705898',
    'grass': '#78C850',
    'ground': '#E0C068',
    'ice': '#98D8D8',
    'normal': '#A8A878',
    'poison': '#A040A0',
    'psychic': '#F85888',
    'rock': '#B8A038',
    'steel': '#B8B8D0',
    'unknown': '#68A090',
    'water': '#6890F0',
  }
};

final convertedColors = Map<String, Map<String, Color>>.from(
    colors.map((stringColorCategoryList, stringColorList) {
  return MapEntry(stringColorCategoryList, Map<String, Color>.from(
      stringColorList.map((stringColorName, stringColor) {
    return MapEntry(stringColorName, HexColor(color: stringColor).toColor());
  })));
}));

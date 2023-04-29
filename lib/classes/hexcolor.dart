import 'package:flutter/material.dart';

class HexColor {
  String color;

  HexColor({required this.color});

  toColor() {
    String hexString = color;
    final buffer = StringBuffer();
    if (color.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

import 'package:flutter/material.dart';

class HexColor {
  final String color;

  HexColor({required this.color});

  Color toColor() {
    String hexString = color;
    final StringBuffer buffer = StringBuffer();
    if (color.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

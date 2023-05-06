import 'package:flutter/material.dart';

import 'package:pocketdex/themes/palette.dart';

final Map<String, ThemeData Function({required BuildContext context})> theme = {
  'dark': ({required context}) {
    return ThemeData(
      drawerTheme: DrawerThemeData(
        backgroundColor: palette['common']?['space-cadet'],
      ),
      listTileTheme: ListTileThemeData(
        textColor: palette['common']?['anti-flash-white'],
        iconColor: palette['common']?['anti-flash-white'],
      ),
      primarySwatch: palette['common']?['red-pantone'],
      scaffoldBackgroundColor: palette['common']?['space-cadet'],
      snackBarTheme: SnackBarThemeData(
        actionTextColor: palette['common']?['space-cadet'],
        backgroundColor: palette['common']?['anti-flash-white'],
      ),
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: palette['common']?['anti-flash-white'],
            displayColor: palette['common']?['anti-flash-white'],
          ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
            color: palette['common']?['anti-flash-white'],
            borderRadius: BorderRadius.circular(15)),
        textStyle: TextStyle(
          backgroundColor: palette['common']?['anti-flash-white'],
          color: palette['common']?['space-cadet'],
        ),
      ),
    );
  },
  'light': ({required context}) {
    return ThemeData(
      drawerTheme: DrawerThemeData(
        backgroundColor: palette['common']?['anti-flash-white'],
      ),
      listTileTheme: ListTileThemeData(
        selectedColor: palette['common']?['bittersweet'],
        textColor: palette['common']?['space-cadet'],
        iconColor: palette['common']?['space-cadet'],
      ),
      primarySwatch: palette['common']?['bittersweet'],
      scaffoldBackgroundColor: palette['common']?['anti-flash-white'],
      snackBarTheme: SnackBarThemeData(
        actionTextColor: palette['common']?['anti-flash-white'],
        backgroundColor: palette['common']?['space-cadet'],
      ),
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: palette['common']?['space-cadet'],
            displayColor: palette['common']?['space-cadet'],
          ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
            color: palette['common']?['space-cadet'],
            borderRadius: BorderRadius.circular(15)),
        textStyle: TextStyle(
          backgroundColor: palette['common']?['space-cadet'],
          color: palette['common']?['anti-flash-white'],
        ),
      ),
    );
  }
};

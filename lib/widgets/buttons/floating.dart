import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pocketdex/classes/theme_mode_notifier.dart';

class FloatingButton extends StatefulWidget {
  const FloatingButton({super.key});

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  ThemeMode? _selectedThemeMode;

  final List _options = [
    {
      'title': 'System',
      'value': ThemeMode.system,
      'icon': Icons.devices,
      'colors': {'background': Colors.grey, 'foreground': Colors.black}
    },
    {
      'title': 'Light',
      'value': ThemeMode.light,
      'icon': Icons.light_mode,
      'colors': {'background': Colors.white, 'foreground': Colors.black}
    },
    {
      'title': 'Dark',
      'value': ThemeMode.dark,
      'icon': Icons.dark_mode,
      'colors': {'background': Colors.black, 'foreground': Colors.white}
    }
  ];

  List<SpeedDialChild> _createOptions(ThemeModeNotifier themeModeNotifier) {
    final List<SpeedDialChild> widgets = [];
    for (Map option in _options) {
      widgets.add(
        SpeedDialChild(
          backgroundColor: option['colors']['background'],
          child: Icon(option['icon']),
          foregroundColor: option['colors']['foreground'],
          labelWidget: Container(
            decoration: BoxDecoration(
              color: _selectedThemeMode == option['value']
                  ? _selectedThemeMode == ThemeMode.dark
                      ? Theme.of(context).primaryColorLight
                      : _selectedThemeMode == ThemeMode.system &&
                              MediaQuery.of(context).platformBrightness ==
                                  Brightness.dark
                          ? Theme.of(context).primaryColorLight
                          : Theme.of(context).primaryColorDark
                  : Theme.of(context).tooltipTheme.textStyle?.backgroundColor,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: Text(
              option['title'],
              style: TextStyle(
                color: Theme.of(context).tooltipTheme.textStyle?.color,
              ),
            ),
          ),
          onTap: () {
            _setSelectedThemeMode(
                themeMode: option['value'],
                themeModeNotifier: themeModeNotifier);
          },
        ),
      );
    }
    return widgets;
  }

  void _setSelectedThemeMode({
    required ThemeMode themeMode,
    required ThemeModeNotifier themeModeNotifier,
  }) async {
    themeModeNotifier.themeMode = themeMode;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('themeMode', themeMode.index);
    setState(() {
      _selectedThemeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeModeNotifier themeModeNotifier =
        Provider.of<ThemeModeNotifier>(context);
    _selectedThemeMode = themeModeNotifier.themeMode;
    return SpeedDial(
      activeIcon: Icons.close,
      children: _createOptions(themeModeNotifier),
      icon: Icons.palette,
      overlayOpacity: 0,
      tooltip: 'Themes',
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pocketdex/classes/theme_mode_notifier.dart';

class ThemeChoice extends StatefulWidget {
  const ThemeChoice({super.key});

  @override
  State<ThemeChoice> createState() => _ThemeChoiceState();
}

class _ThemeChoiceState extends State<ThemeChoice> {
  ThemeMode? _selectedThemeMode;

  final List _options = [
    {'title': 'Dark', 'value': ThemeMode.dark},
    {'title': 'Light', 'value': ThemeMode.light},
    {'title': 'System', 'value': ThemeMode.system}
  ];

  List<Widget> _createOptions(ThemeModeNotifier themeModeNotifier) {
    List<Widget> widgets = [];
    for (Map option in _options) {
      widgets.add(
        RadioListTile(
          value: option['value'],
          groupValue: _selectedThemeMode,
          title: Text(option['title']),
          onChanged: (mode) {
            _setSelectedThemeMode(mode, themeModeNotifier);
          },
          selected: _selectedThemeMode == option['value'],
          activeColor: Colors.orange,
        ),
      );
    }
    return widgets;
  }

  void _setSelectedThemeMode(
      ThemeMode themeMode, ThemeModeNotifier themeModeNotifier) async {
    themeModeNotifier.themeMode = themeMode;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('themeMode', themeMode.index);
    setState(() {
      _selectedThemeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeModeNotifier = Provider.of<ThemeModeNotifier>(context);
    _selectedThemeMode = themeModeNotifier.themeMode;
    return Column(
      children: <Widget>[
        Column(
          children: _createOptions(themeModeNotifier),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Current ThemeMode:',
              ),
              Text(
                '$_selectedThemeMode',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 100,
        ),
      ],
    );
  }
}

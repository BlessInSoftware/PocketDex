import 'package:flutter/material.dart';

import 'package:pocketdex/pages/home.dart';
import 'package:pocketdex/pages/settings.dart';

enum AppPage { home, settings }

extension AppPageEx on AppPage {
  static const Map<String, Widget> _pages = {
    'home': HomePage(),
    'settings': SettingsPage()
  };

  String get pageName {
    return '${name[0].toUpperCase()}${name.substring(1).toLowerCase()}';
  }

  Widget get page {
    return _pages[name]!;
  }
}

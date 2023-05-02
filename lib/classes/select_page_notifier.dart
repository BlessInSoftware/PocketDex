import 'package:flutter/material.dart';

import 'package:pocketdex/constants/pages.dart';

class SelectPageNotifier with ChangeNotifier {
  AppPage _selectedPage = AppPage.home;

  SelectPageNotifier({AppPage? selectedPage}) {
    _selectedPage = selectedPage ?? _selectedPage;
  }

  AppPage get selectedPage => _selectedPage;

  void set selectedPage(AppPage page) {
    _selectedPage = page;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:pocketdex/pages/home.dart';
import 'package:pocketdex/pages/settings.dart';
import 'package:provider/provider.dart';

import 'package:pocketdex/classes/create_animated_route.dart';
import 'package:pocketdex/classes/select_page_notifier.dart';
import 'package:pocketdex/constants/pages.dart';

class DefaultDrawer extends StatefulWidget {
  const DefaultDrawer({super.key});

  @override
  State<DefaultDrawer> createState() => _DefaultDrawerState();
}

class _DefaultDrawerState extends State<DefaultDrawer> {
  AppPage? _selectedPage;

  void _setSelectedPage({
    required AppPage selectedPage,
    required SelectPageNotifier selectPageNotifier,
  }) {
    selectPageNotifier.selectedPage = selectedPage;
    setState(() {
      _selectedPage = selectedPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final SelectPageNotifier selectPageNotifier =
        Provider.of<SelectPageNotifier>(context);
    _selectedPage = selectPageNotifier.selectedPage;
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Name'),
            accountEmail: Text('email@email.com'),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.home),
                  title: Text(AppPage.home.pageName),
                  selected: _selectedPage == AppPage.home,
                  onTap: () {
                    _setSelectedPage(
                        selectedPage: AppPage.home,
                        selectPageNotifier: selectPageNotifier);
                    selectPageNotifier.selectedPage = AppPage.home;
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      CreateAnimatedRoute(
                        page: const HomePage(),
                      ).slideHorizontally(),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: Text(AppPage.settings.pageName),
                  selected: _selectedPage == AppPage.settings,
                  onTap: () {
                    _setSelectedPage(
                        selectedPage: AppPage.settings,
                        selectPageNotifier: selectPageNotifier);
                    selectPageNotifier.selectedPage = AppPage.settings;
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      CreateAnimatedRoute(
                        page: const SettingsPage(),
                      ).slideHorizontally(),
                    );
                  },
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

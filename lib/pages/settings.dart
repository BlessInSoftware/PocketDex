import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pocketdex/classes/theme_mode_notifier.dart';
import 'package:pocketdex/constants/pages.dart';
import 'package:pocketdex/widgets/buttons/floating.dart';
import 'package:pocketdex/widgets/drawers/default.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppPage.settings.pageName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Theme: ${Provider.of<ThemeModeNotifier>(context).themeMode.name}',
            ),
          ],
        ),
      ),
      drawer: const DefaultDrawer(),
      floatingActionButton: const FloatingButton(),
    );
  }
}

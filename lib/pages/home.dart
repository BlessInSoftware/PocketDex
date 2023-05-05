import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pocketdex/classes/theme_mode_notifier.dart';
import 'package:pocketdex/constants/pages.dart';
import 'package:pocketdex/widgets/buttons/floating.dart';
import 'package:pocketdex/widgets/drawers/default.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppPage.home.pageName),
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

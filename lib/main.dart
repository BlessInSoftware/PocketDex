import 'package:flutter/material.dart';
import 'package:pocketdex/pages/home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pocketdex/classes/select_page_notifier.dart';
import 'package:pocketdex/classes/theme_mode_notifier.dart';
import 'package:pocketdex/constants/pages.dart';
import 'package:pocketdex/themes/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  AppPage initialPage = AppPage.home;
  int initialThemeMode = sharedPreferences.getInt('themeMode') ?? 0;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeModeNotifier>(
          create: (_) =>
              ThemeModeNotifier(themeMode: ThemeMode.values[initialThemeMode]),
        ),
        ChangeNotifierProvider<SelectPageNotifier>(
          create: (_) => SelectPageNotifier(selectedPage: initialPage),
        ),
      ],
      child: const App(),
    ),
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: theme['dark']!(context: context),
      home: const HomePage(),
      theme: theme['light']!(context: context),
      themeMode: Provider.of<ThemeModeNotifier>(context).themeMode,
      title: 'PocketDex',
    );
  }
}

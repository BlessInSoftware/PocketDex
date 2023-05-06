import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:pocketdex/classes/theme_mode_notifier.dart';
import 'package:pocketdex/classes/select_page_notifier.dart';
import 'package:pocketdex/constants/pages.dart';
import 'package:pocketdex/main.dart';

void main() {
  group('App', () {
    testWidgets('Contains a MaterialApp', (tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<ThemeModeNotifier>(
              create: (_) => ThemeModeNotifier(themeMode: ThemeMode.light),
            ),
            ChangeNotifierProvider<SelectPageNotifier>(
              create: (_) => SelectPageNotifier(selectedPage: AppPage.home),
            ),
          ],
          child: const App(),
        ),
      );
      expect(find.byType(MaterialApp), findsOneWidget);
      await tester.pumpAndSettle();
    });
    tearDown(() {
      WidgetsBinding.instance.handleBeginFrame(Duration.zero);
    });
  });
}

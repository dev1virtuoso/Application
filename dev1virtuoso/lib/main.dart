import 'package:flutter/material.dart';
import 'index_page.dart';
import 'package:provider/provider.dart';
import 'custom_side_navigation_bar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:dev1virtuoso/app_localizations.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeModel>(
      create: (context) => ThemeModel(),
      child: const MyApp(),
    ),
  );
}

class ThemeModel with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  set isDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  ThemeData get currentTheme =>
      _isDarkMode ? ThemeData.dark() : ThemeData.light();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dev1virtuoso',
      theme: Provider.of<ThemeModel>(context).currentTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppLocalizations.of(context).dev1vrtuoso),
                Text(" - "),
                Text(Intl.message('Arcade', name: 'arcade', desc: 'arcade')),
              ],
            ),
          ),
        ),
        drawer: CustomSideNavigationBar(
          currentIndex: 0,
          onTap: (index) {},
        ),
        body: const IndexPage(),
      ),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale.fromSubtags(
          languageCode: 'zh',
          scriptCode: 'Hant',
          countryCode: 'TW',
        ),
      ],
    );
  }
}

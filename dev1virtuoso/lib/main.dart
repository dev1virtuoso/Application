import 'package:flutter/material.dart';
import 'index_page.dart';
import 'package:provider/provider.dart';
import 'custom_side_navigation_bar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';

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
      home: const MyAppState(),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}

class MyAppState extends StatefulWidget {
  const MyAppState({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppState> {
  @override
  void initState() {
    super.initState();

    localization.init(
      mapLocales: [
        const MapLocale('en', AppLocale.EN),
        const MapLocale('km', AppLocale.KM),
        const MapLocale('ja', AppLocale.JA),
      ],
      initLanguageCode: 'en',
    );
    localization.onTranslatedLanguage = _onTranslatedLanguage;
  }

  void _onTranslatedLanguage(Locale? locale) {
    // Handle language change
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context)!.translate("dev1virtuoso),
              Text(" - "),
              Text(AppLocalizations.of(context)!.translate("arcade),
            ],
          ),
        ),
      ),
      drawer: CustomSideNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          // Handle drawer item tap
        },
      ),
      body: const IndexPage(),
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ListTile(
              leading: ElevatedButton(
                onPressed: () {
                  setState(() {
                    S.load(const Locale('en'));
                  });
                },
                child: const Text('ENGLISH'),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  setState(() {
                    S.load(const Locale('de'));
                  });
                },
                child: const Text('GERMAN'),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).pageHomeListTitle,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  S.of(context).pageHomeSamplePlaceholder('John'),
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  S
                      .of(context)
                      .pageHomeSamplePlaceholdersOrdered('John', 'Doe'),
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  S.of(context).pageHomeSamplePlural(2),
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  S.of(context).pageHomeSampleTotalAmount(2500.0),
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  S.of(context).pageHomeSampleCurrentDateTime(
                      DateTime.now(), DateTime.now()),
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

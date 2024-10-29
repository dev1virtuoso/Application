import 'package:flutter/material.dart';
import 'settings_page.dart';
import 'index_page.dart';
import 'package:provider/provider.dart';
import 'custom_side_navigation_bar.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeModel>(
      create: (context) => ThemeModel(),
      child: MyApp(),
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
      home: Scaffold(
        appBar: AppBar(),
        drawer: CustomSideNavigationBar(
          currentIndex: 0,
          onTap: (index) {},
        ),
        body: IndexPage(),
      ),
    );
  }
}

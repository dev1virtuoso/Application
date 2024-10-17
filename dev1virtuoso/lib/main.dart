import 'package:dev1virtuoso/custom_side_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'settings_page.dart';
import 'package:provider/provider.dart';

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
      theme: Provider.of<ThemeModel>(context).currentTheme,
      home: IndexPage(),
      routes: {
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Index Page'),
      ),
      drawer: CustomSideNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          // Handle navigation based on index
          // For example, Navigator.pushNamed(context, '/settings');
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Index Page Content',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              child: Text('Go to Settings'),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Switch(
          value: themeProvider.isDarkMode,
          onChanged: (value) {
            themeProvider.isDarkMode = value;
          },
        ),
      ),
    );
  }
}

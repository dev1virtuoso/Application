import 'package:flutter/material.dart';
import 'settings_page.dart';
import 'index_page.dart';
import 'package:provider/provider.dart';
import 'custom_side_navigation_bar.dart';

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
    if (_isDarkMode != value) {
      _isDarkMode = value;
      notifyListeners();
    }
  }

  ThemeData get currentTheme =>
      _isDarkMode ? ThemeData.dark() : ThemeData.light();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dev1virtuoso',
      theme: Provider.of<ThemeModel>(context).currentTheme,
      home: IndexPage(),
    );
  }
}

class IndexContent extends StatelessWidget {
  const IndexContent({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Index Page'),
      ),
      drawer: CustomSideNavigationBar(
        currentIndex: 0,
        onTap: (index) {},
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Your content here', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 20),
              Text('Upcoming Event: Event details here',
                  style: TextStyle(fontSize: 16)),
              Text('News: Latest news updates here',
                  style: TextStyle(fontSize: 16)),
              Text('Blogs: Recent blog posts here',
                  style: TextStyle(fontSize: 16)),
              Text('Release: New releases information here',
                  style: TextStyle(fontSize: 16)),
              Text('Research: Research findings here',
                  style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}

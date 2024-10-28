import 'package:flutter/material.dart';
import 'settings_page.dart';
import 'index_page.dart';
import 'package:provider/provider.dart';
import 'custom_side_navigation_bar.dart';
import 'package:local_auth/local_auth.dart';

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
  final LocalAuthentication _localAuth = LocalAuthentication();

  Future<void> _authenticate() async {
    bool authenticated = false;

    try {
      authenticated = await _localAuth.authenticate(
        localizedReason: 'Authenticate to access the app',
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } catch (e) {
      print(e);
    }

    if (!authenticated) {
      // Fallback to a password if biometrics are not available
      // Add your custom password authentication logic here
    }
  }

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
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            _authenticate(); // Call authentication when navigating to a new route
            return Container(); // Placeholder, replace with actual widget
          },
        );
      },
    );
  }
}

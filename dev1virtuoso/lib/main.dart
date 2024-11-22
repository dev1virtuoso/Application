import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'custom_side_navigation_bar.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'index_page.dart';

void main() => runApp(MyApp());

class ThemeModel with ChangeNotifier {
  ThemeData _currentTheme = ThemeData.light();

  ThemeData get currentTheme => _currentTheme;

  void updateTheme(ThemeData newTheme) {
    _currentTheme = newTheme;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<Map<String, dynamic>> loadAppStrings() async {
    String data = await rootBundle.loadString('assets/app_strings.json');
    return json.decode(data);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: loadAppStrings(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Map<String, dynamic> appStrings = snapshot.data!;

          return MaterialApp(
            title: 'dev1virtuoso',
            theme: Provider.of<ThemeModel>(context).currentTheme,
            home: Scaffold(
              appBar: AppBar(
                title: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(appStrings['dev1virtuoso']),
                      Text(" - "),
                      Text('Arcade'),
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
          );
        } else {
          return MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeModel>(context).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Switch(
          value: isDarkMode,
          onChanged: (value) {
            Provider.of<ThemeModel>(context, listen: false).isDarkMode = value;
          },
        ),
      ),
    );
  }
}

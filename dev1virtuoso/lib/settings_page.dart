import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:package_info/package_info.dart';
import 'main.dart';
import 'custom_side_navigation_bar.dart';
import 'package:flutter/foundation.dart';

class ThemeModel with ChangeNotifier {
  bool _isDarkMode = false;
  bool _notificationsEnabled = true;
  bool _anonymousFeedbackEnabled = true;
  bool _developerOptionsEnabled = true;
  double _textSize = 14.0;

  bool get isDarkMode => _isDarkMode;
  bool get notificationsEnabled => _notificationsEnabled;
  bool get anonymousFeedbackEnabled => _anonymousFeedbackEnabled;
  bool get developerOptionsEnabled => _developerOptionsEnabled;
  double get textSize => _textSize;

  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void setNotificationsEnabled(bool value) {
    _notificationsEnabled = value;
    notifyListeners();
  }

  void setAnonymousFeedbackEnabled(bool value) {
    _anonymousFeedbackEnabled = value;
    notifyListeners();
  }

  void setDeveloperOptionsEnabled(bool value) {
    _developerOptionsEnabled = value;
    notifyListeners();
  }

  void setTextSize(double value) {
    _textSize = value;
    notifyListeners();
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Consumer<ThemeModel>(
          builder: (context, themeModel, child) {
            return ListView(
              padding: const EdgeInsets.all(16.0),
              children: <Widget>[
                SwitchListTile(
                  title: const Text('Notifications'),
                  value: themeModel.notificationsEnabled,
                  onChanged: (value) {
                    themeModel.setNotificationsEnabled(value);
                  },
                ),
                ListTile(
                  title: const Text('Dark Mode'),
                  subtitle: const Text('System Default'),
                  onTap: () {
                    themeModel.toggleDarkMode();
                  },
                ),
                SwitchListTile(
                  title: const Text('Anonymous Feedback'),
                  value: themeModel.anonymousFeedbackEnabled,
                  onChanged: (value) {
                    themeModel.setAnonymousFeedbackEnabled(value);
                  },
                ),
                SwitchListTile(
                  title: const Text('Developer Options'),
                  value: themeModel.developerOptionsEnabled,
                  onChanged: (value) {
                    themeModel.setDeveloperOptionsEnabled(value);
                  },
                ),
                Slider(
                  value: themeModel.textSize,
                  min: 12.0,
                  max: 20.0,
                  divisions: 4,
                  label: 'Text Size: ${themeModel.textSize}',
                  onChanged: (value) {
                    themeModel.setTextSize(value);
                  },
                ),
                AnimatedDefaultTextStyle(
                  style: TextStyle(fontSize: themeModel.textSize),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: Text('Sample Text',
                      style: TextStyle(fontSize: themeModel.textSize)),
                ),
                Text('Selected Text Size: ${themeModel.textSize}',
                    style: TextStyle(fontSize: 16)),
              ],
            );
          },
        ),
      ),
    );
  }
}

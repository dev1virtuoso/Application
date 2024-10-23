import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'custom_side_navigation_bar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
                  title: Text('Notifications'),
                  value: themeModel.notificationsEnabled,
                  onChanged: (value) {
                    themeModel.setNotificationsEnabled(value);
                    saveSettings(themeModel); // Save settings after each change
                  },
                ),
                ListTile(
                  title: Text('Dark Mode'),
                  subtitle: const Text('System Default'),
                  onTap: () {
                    themeModel.toggleDarkMode();
                    saveSettings(themeModel); // Save settings after each change
                  },
                ),
                SwitchListTile(
                  title: Text('Anonymous Feedback'),
                  value: themeModel.anonymousFeedbackEnabled,
                  onChanged: (value) {
                    themeModel.setAnonymousFeedbackEnabled(value);
                    saveSettings(themeModel); // Save settings after each change
                  },
                ),
                SwitchListTile(
                  title: Text('Developer Options'),
                  value: themeModel.developerOptionsEnabled,
                  onChanged: (value) {
                    themeModel.setDeveloperOptionsEnabled(value);
                    saveSettings(themeModel); // Save settings after each change
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
                    saveSettings(themeModel); // Save settings after each change
                  },
                ),
                AnimatedDefaultTextStyle(
                  style: TextStyle(fontSize: themeModel.textSize.toDouble()),
                  duration: Duration(
                      milliseconds:
                          300), //Change a constant expression to a non-constant expression
                  curve: Curves.easeInOut,
                  child: const Text('Sample Text',
                      style:
                          TextStyle(fontSize: themeModel.textSize.toDouble())),
                ),
                Text('Selected Text Size: ${themeModel.textSize}',
                    style: const TextStyle(fontSize: 16)),
              ],
            );
          },
        ),
      ),
    );
  }

  void saveSettings(ThemeModel themeModel) {
    // Save settings to global variables
    globalNotificationsEnabled = themeModel.notificationsEnabled;
    globalAnonymousFeedbackEnabled = themeModel.anonymousFeedbackEnabled;
    globalDeveloperOptionsEnabled = themeModel.developerOptionsEnabled;
    globalTextSize = themeModel.textSize;
    // You can also save these global variables to local storage for persistence
  }
}

// Define global variables to store settings
bool globalNotificationsEnabled = true;
bool globalAnonymousFeedbackEnabled = true;
bool globalDeveloperOptionsEnabled = true;
double globalTextSize = 14.0;

class ThemeModel with ChangeNotifier {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  bool _notificationsEnabled = true;
  bool get notificationsEnabled => _notificationsEnabled;

  bool _anonymousFeedbackEnabled = true;
  bool get anonymousFeedbackEnabled => _anonymousFeedbackEnabled;

  bool _developerOptionsEnabled = true;
  bool get developerOptionsEnabled => _developerOptionsEnabled;

  double _textSize = 14.0;
  double get textSize => _textSize;

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

  void setTextSize(double size) {
    _textSize = size;
    notifyListeners();
  }

  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeModel with ChangeNotifier {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  double _textSize = 16.0;
  double get textSize => _textSize;

  bool _notificationsEnabled = true;
  bool get notificationsEnabled => _notificationsEnabled;

  bool _anonymousFeedbackEnabled = true;
  bool get anonymousFeedbackEnabled => _anonymousFeedbackEnabled;

  bool _developerOptionsEnabled = false;
  bool get developerOptionsEnabled => _developerOptionsEnabled;

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

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _selectedLanguage = 'English';

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
                _buildSectionHeader('General'),
                ListTile(
                  title: Text('Language'),
                  subtitle: DropdownButton<String>(
                    value: _selectedLanguage,
                    items: <String>['English', 'Spanish', 'French', 'German']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedLanguage = newValue!;
                      });
                      // Update language logic here
                    },
                  ),
                ),
                _buildSectionHeader('Appearance'),
                SwitchListTile(
                  title: Text('Dark Mode'),
                  subtitle: const Text('System Default'),
                  value: themeModel.isDarkMode,
                  onChanged: (value) {
                    themeModel.toggleDarkMode();
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
                _buildSectionHeader('Notifications'),
                SwitchListTile(
                  title: Text('Notifications'),
                  value: themeModel.notificationsEnabled,
                  onChanged: (value) {
                    themeModel.setNotificationsEnabled(value);
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
                _buildSectionHeader('Developer Options'),
                SwitchListTile(
                  title: Text('Developer Options'),
                  value: themeModel.developerOptionsEnabled,
                  onChanged: (value) {
                    themeModel.setDeveloperOptionsEnabled(value);
                    saveSettings(themeModel); // Save settings after each change
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void saveSettings(ThemeModel themeModel) {
    // Save settings logic
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'localization.dart';
import 'package:intl/intl.dart';

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
        title: Text(AppLocalizations.of(context).settingTitle),
      ),
      body: Center(
        child: Consumer<ThemeModel>(
          builder: (context, themeModel, child) {
            return ListView(
              padding: const EdgeInsets.all(16.0),
              children: <Widget>[
                _buildSectionHeader(AppLocalizations.of(context).general),
                ListTile(
                  title: Text(AppLocalizations.of(context).language),
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
                _buildSectionHeader(AppLocalizations.of(context).appearance),
                SwitchListTile(
                  title: Text(AppLocalizations.of(context).darkMode),
                  subtitle: Text(AppLocalizations.of(context).systemDefault),
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
                  label:
                      '${AppLocalizations.of(context).textSize}: ${themeModel.textSize}',
                  onChanged: (value) {
                    themeModel.setTextSize(value);
                    saveSettings(themeModel); // Save settings after each change
                  },
                ),
                // Add localized sections for Notifications and Developer Options
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
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
    );
  }
}

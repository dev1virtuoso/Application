import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:package_info/package_info.dart';
import 'main.dart';
import 'custom_side_navigation_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeModel>(context).isDarkMode;
    bool notificationsEnabled = true;
    bool anonymousFeedbackEnabled = true;
    bool developerOptionsEnabled = true;
    bool boldTextEnabled = true;

    double textSize = 14.0;

    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        String version = snapshot.data?.version ?? 'Unknown';

        return Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SwitchListTile(
                  title: const Text('Notifications'),
                  value: notificationsEnabled,
                  onChanged: (value) {
                    // Update notificationsEnabled variable based on the value
                  },
                ),
                ListTile(
                  title: const Text('Dark Mode'),
                  subtitle: const Text('System Default'),
                  onTap: () {
                    // Toggle between dark, system default, and light modes
                  },
                ),
                SwitchListTile(
                  title: const Text('Anonymous Feedback'),
                  value: anonymousFeedbackEnabled,
                  onChanged: (value) {
                    // Update anonymousFeedbackEnabled variable based on the value
                  },
                ),
                SwitchListTile(
                  title: const Text('Developer Options'),
                  value: developerOptionsEnabled,
                  onChanged: (value) {
                    // Update developerOptionsEnabled variable based on the value
                  },
                ),
                Slider(
                  value: textSize,
                  min: 12.0,
                  max: 20.0,
                  divisions: 4,
                  label: 'Text Size: $textSize',
                  onChanged: (value) {
                    // Update textSize variable based on the slider value
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

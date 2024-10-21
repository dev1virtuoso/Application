import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:package_info/package_info.dart';
import 'main.dart';
import 'custom_side_navigation_bar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  bool notificationsEnabled = true;
  bool anonymousFeedbackEnabled = true;
  bool developerOptionsEnabled = true;
  bool boldTextEnabled = true;

  double textSize = 14.0;

  @override
  void initState() {
    super.initState();
    isDarkMode = Provider.of<ThemeModel>(context, listen: false).isDarkMode;
  }

  @override
  Widget build(BuildContext context) {
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
                    setState(() {
                      notificationsEnabled = value;
                    });
                  },
                ),
                ListTile(
                  title: const Text('Dark Mode'),
                  subtitle: const Text('System Default'),
                  onTap: () {
                    setState(() {
                      isDarkMode = !isDarkMode;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Anonymous Feedback'),
                  value: anonymousFeedbackEnabled,
                  onChanged: (value) {
                    setState(() {
                      anonymousFeedbackEnabled = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Developer Options'),
                  value: developerOptionsEnabled,
                  onChanged: (value) {
                    setState(() {
                      developerOptionsEnabled = value;
                    });
                  },
                ),
                Slider(
                  value: textSize,
                  min: 12.0,
                  max: 20.0,
                  divisions: 4,
                  label: 'Text Size: $textSize',
                  onChanged: (value) {
                    setState(() {
                      textSize = value;
                    });
                  },
                ),
                AnimatedDefaultTextStyle(
                  style: TextStyle(fontSize: textSize),
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child:
                      Text('Sample Text', style: TextStyle(fontSize: textSize)),
                ),
                Text('Selected Text Size: $textSize',
                    style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        );
      },
    );
  }
}

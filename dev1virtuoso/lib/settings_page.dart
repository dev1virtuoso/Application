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
    bool colorBlindModeEnabled = true;
    bool elderlyModeEnabled = true;

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
            ),
          ),
        );
      },
    );
  }
}

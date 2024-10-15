import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:package_info/package_info.dart';
import 'main.dart';
import 'custom_side_navigation_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeModel>(context).isDarkMode;

    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        String version = snapshot.data?.version ?? 'Unknown';

        return Scaffold(
          appBar: AppBar(
            title: Text('Settings'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    Provider.of<ThemeModel>(context, listen: false).isDarkMode =
                        value;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'App Version: $version',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

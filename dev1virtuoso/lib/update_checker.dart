import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class UpdateChecker {
  static Future<void> checkForUpdates(BuildContext context) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String currentVersion = packageInfo.version;
    String serverUrl = 'YOUR_SERVER_URL_HERE';

    try {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Checking for Updates'),
          content: CircularProgressIndicator(),
        ),
      );

      final response = await http.get(Uri.parse(serverUrl));

      Navigator.pop(context); // Dismiss the loading indicator

      if (response.statusCode == 200) {
        String latestVersion = response.body;

        if (latestVersion != currentVersion) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Update Available'),
              content:
                  Text('A new version is available. Please update your app.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('No Updates'),
              content: Text('Your app is up to date.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
          );
        }
      } else {
        throw Exception('Failed to fetch latest version');
      }
    } catch (e) {
      print('Error checking for updates: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('An error occurred while checking for updates.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => UpdateChecker.checkForUpdates(context),
          child: Text('Check for Updates'),
        ),
      ),
    );
  }
}

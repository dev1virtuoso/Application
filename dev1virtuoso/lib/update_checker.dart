import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:package_info/package_info';
import 'package:dev1virtuoso/app_localizations.dart';
import 'package:dev1virtuoso/scripts.dart';
import 'package:intl/intl.dart';

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
          title: Text(AppLocalizations.of(context).checkingUpdates),
          content: const CircularProgressIndicator(),
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
              title: Text(AppLocalizations.of(context).updateAvailable),
              content: Text(AppLocalizations.of(context).newVersionAvailable),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(AppLocalizations.of(context).noUpdates),
              content: Text(AppLocalizations.of(context).noUpdatesMessage),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      } else {
        throw Exception(AppLocalizations.of(context).updatefetch);
      }
    } catch (e) {
      print('Error checking for updates: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(AppLocalizations.of(context).error),
          content: Text(AppLocalizations.of(context).updateCheckError),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => UpdateChecker.checkForUpdates(context),
          child: Text(AppLocalizations.of(context).checkForUpdates),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app_localizations.dart';
import 'package:intl/intl.dart';

class ArcadeHomePage extends StatelessWidget {
  const ArcadeHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate("arcadeTitle"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to Guess the Number game page
              },
              child: Text(AppLocalizations.of(context)!.translate("arcade"),
            ),
          ],
        ),
      ),
    );
  }
}

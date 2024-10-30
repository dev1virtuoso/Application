import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutHomePage extends StatelessWidget {
  const AboutHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var intl = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(intl.aboutTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              intl.appTitle,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              intl.version,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              intl.developer,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

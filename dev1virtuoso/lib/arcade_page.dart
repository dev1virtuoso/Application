import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ArcadeHomePage extends StatelessWidget {
  const ArcadeHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var intl = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(intl.arcadeTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to Guess the Number game page
              },
              child: Text(intl.guessTheNumber),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Apple Chess game page
              },
              child: Text(intl.appleChess),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Chess game page
              },
              child: Text(intl.chess),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Chinese Chess game page
              },
              child: Text(intl.chineseChess),
            ),
          ],
        ),
      ),
    );
  }
}

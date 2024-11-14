import 'package:flutter/material.dart';
import 'package:dev1virtuoso/app_localizations.dart';
import 'package:dev1virtuoso/scripts.dart';
import 'package:intl/intl.dart';

class ArcadeHomePage extends StatelessWidget {
  const ArcadeHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(Intl.message('Arcade Games', name: 'arcadeTitle', desc: 'arcadeTitle')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to Guess the Number game page
              },
              child: Text(Intl.message('Guess the Number', name: 'guessTheNumber', desc: 'guessTheNumber'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Apple Chess game page
              },
              child: Text(Intl.message('Apple Chess', name: 'appleChess', desc: 'appleChess'),
            ),
            ElevatedButton(
              onPressed: () {
      import 'package:flutter/material.dart';
import 'package:dev1virtuoso/l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class ArcadeHomePage extends StatelessWidget {
  const ArcadeHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Intl.message('Arcade Games', name: 'arcadeTitle', desc: 'arcadeTitle')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to Guess the Number game page
              },
              child: Text(Intl.message('Guess the Number', name: 'guessTheNumber', desc: 'guessTheNumber')),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Apple Chess game page
              },
              child: Text(Intl.message('Apple Chess', name: 'appleChess', desc: 'appleChess')),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Chess game page
              },
              child: Text(Intl.message('Chess', name: 'chess', desc: 'chess')),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Chinese Chess game page
              },
              child: Text(Intl.message('Chinese Chess', name: 'chineseChess', desc: 'chineseChess')),
            ),
          ],
        ),
      ),
    );
  }
}          // Navigate to Chess game page
              },
              child: Text(Intl.message('Chess', name: 'chess', desc: 'chess'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Chinese Chess game page
              },
              child: TextText(Intl.message('Chinese Chess', name: 'chineseChess', desc: 'chineseChess'),
            ),
          ],
        ),
      ),
    );
  }
}

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
        title: Text(Intl.message('Arcade Games',
            name: 'arcadeTitle', desc: 'arcadeTitle')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to Guess the Number game page
              },
              child:
                  Text(Intl.message('Arcade', name: 'arcade', desc: 'arcade')),
            ),
          ],
        ),
      ),
    );
  }
}

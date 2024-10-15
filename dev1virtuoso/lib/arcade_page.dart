import 'package:flutter/material.dart';
import 'custom_side_navigation_bar.dart';

class ArcadePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arcade',
      home: ArcadeHomePage(),
    );
  }
}

class ArcadeHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arcade'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to Guess the Number game page
              },
              child: Text('Guess the Number'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Apple Chess game page
              },
              child: Text('Apple Chess'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Chess game page
              },
              child: Text('Chess'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to Chinese Chess game page
              },
              child: Text('Chinese Chess'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:dev1virtuoso/app_localizations.dart';
import 'package:dev1virtuoso/scripts.dart';
import 'package:intl/intl.dart';

class AboutHomePage extends StatelessWidget {
  const AboutHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(Intl.message('About', name: 'aboutTitle', desc: 'aboutTitle')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Intl.message('dev1vrtuoso', name: 'appTitle', desc: 'appTitle'),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              Intl.message('Version v0.0.3.1(018)(0031_018-151124a)',
                  name: 'version', desc: 'version'),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              Intl.message('Developed by Dev1Virtuoso',
                  name: 'developer', desc: 'developer'),
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

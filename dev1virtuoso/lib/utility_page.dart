import 'package:flutter/material.dart';
import 'package:dev1virtuoso/app_localizations.dart';
import 'package:dev1virtuoso/scripts.dart';
import 'package:intl/intl.dart';
import 'package:dev1virtuoso/scripts.dart';

class UtilityPage extends StatefulWidget {
  const UtilityPage({Key? key}) : super(key: key);

  @override
  _UtilityPageState createState() => _UtilityPageState();
}

class _UtilityPageState extends State<UtilityPage> {
  String piValue = '';
  String bmiResult = '';
  String randomString = '';
  String morseCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).utilityPageTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: calculatePi,
                      child:
                          Text(AppLocalizations.of(context).calculatePiButton),
                    ),
                    Text(
                        '${AppLocalizations.of(context).piValueLabel}: $piValue'),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: calculateBMI,
                      child:
                          Text(AppLocalizations.of(context).calculateBMIButton),
                    ),
                    Text(
                        '${AppLocalizations.of(context).bmiResultLabel}: $bmiResult'),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: generateRandomString,
                      child: Text(AppLocalizations.of(context)
                          .generateRandomStringButton),
                    ),
                    Text(
                        '${AppLocalizations.of(context).randomStringLabel}: $randomString'),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: translateToMorseCode,
                      child: Text(AppLocalizations.of(context)
                          .translateToMorseCodeButton),
                    ),
                    Text(
                        '${AppLocalizations.of(context).morseCodeLabel}: $morseCode'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  // Calculate the value of Pi
  void calculatePi() {
    setState(() {
      piValue = '3.14159'; // more accurate value of Pi here
    });
  }

  // BMI Calculator
  void calculateBMI() {
    // Add your BMI calculation logic here
    setState(() {
      bmiResult = 'Your BMI result'; // Update this with the calculated BMI
    });
  }

  // Random English-Alphanumeric String Generator
  void generateRandomString() {
    // Add logic to generate a random alphanumeric string
    setState(() {
      randomString = 'Random string'; // Update this with the generated string
    });
  }

  // Morse Code Translator
  void translateToMorseCode() {
    // Add logic to translate text to Morse code
    setState(() {
      morseCode = 'Morse code'; // Update this with the translated Morse code
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(loc!.utilityPageTitle),
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
                      child: Text(loc.calculatePiButton),
                    ),
                    Text('${loc.piValueLabel}: $piValue'),
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
                      child: Text(loc.calculateBMIButton),
                    ),
                    Text('${loc.bmiResultLabel}: $bmiResult'),
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
                      child: Text(loc.generateRandomStringButton),
                    ),
                    Text('${loc.randomStringLabel}: $randomString'),
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
                      child: Text(loc.translateToMorseCodeButton),
                    ),
                    Text('${loc.morseCodeLabel}: $morseCode'),
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

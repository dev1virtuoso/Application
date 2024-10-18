import 'package:flutter/material.dart';
import 'custom_side_navigation_bar.dart';
import 'scripts.dart';

class UtilityPage extends StatefulWidget {
  const UtilityPage({super.key});

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Utility Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: calculatePi,
              child: const Text('Calculate Pi'),
            ),
            Text('Pi Value: $piValue'),
            ElevatedButton(
              onPressed: calculateBMI,
              child: const Text('Calculate BMI'),
            ),
            Text('BMI Result: $bmiResult'),
            ElevatedButton(
              onPressed: generateRandomString,
              child: const Text('Generate Random String'),
            ),
            Text('Random String: $randomString'),
            ElevatedButton(
              onPressed: translateToMorseCode,
              child: const Text('Translate to Morse Code'),
            ),
            Text('Morse Code: $morseCode'),
          ],
        ),
      ),
    );
  }
}

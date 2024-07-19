import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const NeuralMorseApp());
}

class NeuralMorseApp extends StatelessWidget {
  const NeuralMorseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NeuralMorse',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ContentView(),
    );
  }
}

class ContentView extends StatefulWidget {
  const ContentView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ContentViewState createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView> {
  final TextEditingController _inputTextController = TextEditingController();
  String _morseCode = '';

  void _convertToMorseCode() {
    setState(() {
      _morseCode = convertToMorseCode(_inputTextController.text);
    });
  }

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: _morseCode));
  }

  String convertToMorseCode(String text) {
    Map<String, String> morseCodeMap = {
      'A': '.-', 'B': '-...', 'C': '-.-.', 'D': '-..', 'E': '.',
      'F': '..-.', 'G': '--.', 'H': '....', 'I': '..', 'J': '.---',
      'K': '-.-', 'L': '.-..', 'M': '--', 'N': '-.', 'O': '---',
      'P': '.--.', 'Q': '--.-', 'R': '.-.', 'S': '...', 'T': '-',
      'U': '..-', 'V': '...-', 'W': '.--', 'X': '-..-', 'Y': '-.--',
      'Z': '--..'
    };

    String uppercasedText = text.toUpperCase();
    String result = '';

    for (int i = 0; i < uppercasedText.length; i++) {
      String char = uppercasedText[i];
      if (morseCodeMap.containsKey(char)) {
        result += '${morseCodeMap[char]!} ';
      } else {
        result += ' ';
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NeuralMorse'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Text to Morse Code Converter',
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            TextField(
              controller: _inputTextController,
              decoration: const InputDecoration(
                labelText: 'Enter text',
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: _convertToMorseCode,
              child: const Text('Convert to Morse Code'),
            ),
            const Text(
              'Morse Code:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              _morseCode,
              style: const TextStyle(fontSize: 16.0),
            ),
            ElevatedButton(
              onPressed: _copyToClipboard,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text('Copy Morse Code'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
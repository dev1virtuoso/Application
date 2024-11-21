import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'morse_code_converter.dart';

class ContentView extends StatefulWidget {
  const ContentView({super.key, Key});

  @override
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Morse Code Converter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _inputTextController,
              decoration: const InputDecoration(labelText: 'Enter text'),
            ),
            ElevatedButton(
              onPressed: _convertToMorseCode,
              child: const Text('Convert to Morse Code'),
            ),
            Text('Morse Code: $_morseCode'),
            ElevatedButton(
              onPressed: _copyToClipboard,
              child: const Text('Copy to Clipboard'),
            ),
          ],
        ),
      ),
    );
  }
}

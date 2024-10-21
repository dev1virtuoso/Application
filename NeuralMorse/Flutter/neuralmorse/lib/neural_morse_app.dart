import 'package:flutter/material.dart';
import 'content_view.dart';

void main() {
  runApp(const NeuralMorseApp());
}

class NeuralMorseApp extends StatelessWidget {
  const NeuralMorseApp({Key? key});

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

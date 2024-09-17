import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('About Me'),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Software development is a creative craft, and I see myself as a masterful artist, weaving brilliance with every stroke of code. - Carson Wu, the Extraordinary Developer.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10.0),
              Text(
                'I am Carson Wu, a talented young prodigy from Hong Kong specializing in the fascinating fields of Artificial Intelligence (AI) and Machine Learning (ML). Despite the perceived complexity of software development, I approach it with a mindset of awe and imagination, considering each line of code as a stroke of brilliance I use to create extraordinary things.',
                style: TextStyle(fontSize: 16.0),
              ),
              // Add more Text widgets for the remaining content
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

class ArcadeHomePage extends StatefulWidget {
  const ArcadeHomePage({Key? key}) : super(key: key);

  @override
  _ArcadeHomePageState createState() => _ArcadeHomePageState();
}

class _ArcadeHomePageState extends State<ArcadeHomePage> {
  late Map<String, dynamic> _data;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final String data = await rootBundle.loadString('assets/data.json');
    setState(() {
      _data = json.decode(data);
    });
  }

  void navigateToGamePage() {
    // Implement navigation to the specific game page here
    // For example, use Navigator.push to navigate to the game page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_data['arcadeTitle'] ?? ''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                navigateToGamePage();
              },
              child: Text(_data['arcade'] ?? ''),
            ),
          ],
        ),
      ),
    );
  }
}

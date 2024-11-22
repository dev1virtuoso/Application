import 'package:flutter/material.dart';
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  late Map<String, dynamic> _data;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final String data = await rootBundle.loadString('assets/app_strings.json');
    setState(() {
      _data = json.decode(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_data['appTitle'] ?? ''), // Added a comma here
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search button press
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(_data['yourContent'] ?? ''),
              const SizedBox(height: 20),
              Text(_data['upcomingEvent'] ?? ''),
              Text(_data['news'] ?? ''),
              Text(_data['blogs'] ?? ''),
              Text(_data['releaseInfo'] ?? ''),
              Text(_data['researchFindings'] ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}

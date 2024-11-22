import 'package:flutter/material.dart';
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

class AboutMePage extends StatefulWidget {
  const AboutMePage({Key? key}) : super(key: key);

  @override
  _AboutMePageState createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  late Map<String, dynamic> _data;
  bool _showAboutCarson = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final String data = await rootBundle.loadString('assets/app_strings.json');
    setState(() {
      _data = json.decode(data)['aboutMe']['CarsonWu'];
    });
  }

  void _toggleDisplay() {
    setState(() {
      _showAboutCarson = !_showAboutCarson;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_showAboutCarson ? 'About Carson Wu' : 'About This App'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          _showAboutCarson
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(_data['introduction'] ?? ''),
                    const SizedBox(height: 10),
                    Text(_data['background'] ?? ''),
                    const SizedBox(height: 10),
                    Text(_data['passion'] ?? ''),
                    const SizedBox(height: 10),
                    Text(_data['skills'] ?? ''),
                    const SizedBox(height: 10),
                    Text(_data['projects'] ?? ''),
                    const SizedBox(height: 10),
                    Text(_data['learning'] ?? ''),
                    const SizedBox(height: 10),
                    Text(_data['future'] ?? ''),
                    const SizedBox(height: 10),
                    Text(_data['collaboration'] ?? ''),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Information about this app...'),
                    Text(
                      _data['appTitle'] ?? '',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _data['version'] ?? '',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _data['developer'] ?? '',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
          ElevatedButton(
            onPressed: _toggleDisplay,
            child:
                Text(_showAboutCarson ? 'About This App' : 'About Carson Wu'),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class Page {
  final String title;
  final String route;
  final String content;

  Page({required this.title, required this.route, required this.content});
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<Page> pages = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    String data = await rootBundle.loadString('assets/app_strings.json');
    List<dynamic> jsonData = json.decode(data)['pages'];

    for (var page in jsonData) {
      setState(() {
        pages.add(Page(
          title: page['title'],
          route: page['route'],
          content: page['content'],
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pages[index].title),
            subtitle: Text(pages[index].content),
            onTap: () {
              Navigator.pushNamed(context, pages[index].route);
            },
          );
        },
      ),
    );
  }
}

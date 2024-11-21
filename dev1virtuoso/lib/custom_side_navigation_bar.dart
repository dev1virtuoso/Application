import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'about_page.dart';
import 'account_page.dart';
import 'arcade_page.dart';
import 'index_page.dart';
import 'settings_page.dart';
import 'utility_page.dart';

class CustomSideNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomSideNavigationBar(
      {Key? key, required this.currentIndex, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder(
        future: _loadData(),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.hasData) {
            List<dynamic> pages = snapshot.data!['pages'];
            return ListView(
              padding: EdgeInsets.zero,
              children: pages.map<Widget>((page) {
                return _buildListTile(
                  context,
                  Icons.home,
                  page['title'],
                  pages.indexOf(page),
                  currentIndex,
                  onTap,
                  _getPageWidget(page['route']),
                );
              }).toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<Map<String, dynamic>> _loadData() async {
    String data = await rootBundle.loadString('assets/data.json');
    return json.decode(data);
  }

  Widget _getPageWidget(String route) {
    switch (route) {
      case 'index_page':
        return const IndexPage();
      case 'about_page':
        return const AboutMePage();
      case 'account_page':
        return AccountPage();
      case 'arcade_page':
        return ArcadeHomePage();
      case 'utility_page':
        return const UtilityPage();
      case 'settings_page':
        return const SettingsPage();
      default:
        return const SizedBox(); // Placeholder widget
    }
  }

  ListTile _buildListTile(BuildContext context, IconData icon, String title,
      int index, int currentIndex, Function(int) onTap, Widget widget) {
    return ListTile(
      leading:
          Icon(icon, color: currentIndex == index ? Colors.blue : Colors.grey),
      title: Text(title),
      onTap: () {
        onTap(index);
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget),
        );
      },
    );
  }
}

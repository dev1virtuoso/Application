import 'package:flutter/material.dart';
import 'package:dev1virtuoso/app_localizations.dart';
import 'package:dev1virtuoso/scripts.dart';
import 'package:intl/intl.dart';
import 'about_page.dart';
import 'account_page.dart';
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
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildListTile(
              context,
              Icons.home,
              Intl.message('Home', name: 'home', desc: 'home'),
              0,
              currentIndex,
              onTap,
              const IndexPage()),
          _buildListTile(
              context,
              Icons.account_circle,
              Intl.message('About', name: 'about', desc: 'about'),
              1,
              currentIndex,
              onTap,
              const AboutHomePage()),
          _buildListTile(
              context,
              Icons.account_circle,
              Intl.message('Account', name: 'account', desc: 'account'),
              2,
              currentIndex,
              onTap,
              AccountPage()),
          _buildListTile(
              context,
              Icons.gamepad,
              Intl.message('Arcade', name: 'arcade', desc: 'arcade'),
              3,
              currentIndex,
              onTap,
              ArcadePage()),
          _buildListTile(
              context,
              Icons.settings,
              Intl.message('Utility', name: 'utility', desc: 'utility'),
              4,
              currentIndex,
              onTap,
              const UtilityPage()),
          _buildListTile(
              context,
              Icons.settings,
              Intl.message('Settings', name: 'settings', desc: 'settings'),
              5,
              currentIndex,
              onTap,
              const SettingsPage()),
        ],
      ),
    );
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

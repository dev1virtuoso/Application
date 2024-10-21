import 'package:flutter/material.dart';
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
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildListTile(
              context, Icons.home, 'Home', 0, currentIndex, onTap, IndexPage()),
          _buildListTile(context, Icons.account_circle, 'About', 1,
              currentIndex, onTap, AccountPage()),
          _buildListTile(context, Icons.account_circle, 'Account', 2,
              currentIndex, onTap, AccountPage()),
          _buildListTile(context, Icons.gamepad, 'Arcade', 3, currentIndex,
              onTap, ArcadePage()),
          _buildListTile(context, Icons.settings, 'Utility', 4, currentIndex,
              onTap, UtilityPage()),
          _buildListTile(context, Icons.settings, 'Settings', 5, currentIndex,
              onTap, SettingsPage()),
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

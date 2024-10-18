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
          ListTile(
            leading: Icon(Icons.home,
                color: currentIndex == 0 ? Colors.red : Colors.grey),
            title: const Text('Home'),
            onTap: () {
              onTap(0);
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IndexPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle,
                color: currentIndex == 1 ? Colors.blue : Colors.grey),
            title: const Text('Account'),
            onTap: () {
              onTap(1);
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.gamepad,
                color: currentIndex == 2 ? Colors.green : Colors.grey),
            title: const Text('Arcade'),
            onTap: () {
              onTap(2);
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ArcadePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.build,
                color: currentIndex == 3 ? Colors.green : Colors.grey),
            title: const Text('Utility'),
            onTap: () {
              onTap(3);
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UtilityPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

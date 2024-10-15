import 'package:flutter/material.dart';

class CustomSideNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  CustomSideNavigationBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            leading: Icon(Icons.home,
                color: currentIndex == 0 ? Colors.red : Colors.grey),
            title: Text('Home'),
            onTap: () {
              onTap(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.gamepad,
                color: currentIndex == 1 ? Colors.blue : Colors.grey),
            title: Text('Arcade'),
            onTap: () {
              onTap(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.build,
                color: currentIndex == 2 ? Colors.green : Colors.grey),
            title: Text('Utility'),
            onTap: () {
              onTap(2);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle,
                color: currentIndex == 3 ? Colors.orange : Colors.grey),
            title: Text('Account'),
            onTap: () {
              onTap(3);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

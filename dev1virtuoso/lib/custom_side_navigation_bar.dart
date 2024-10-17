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
            leading: Icon(Icons.work,
                color: currentIndex == 1 ? Colors.blue : Colors.grey),
            title: Text('Work'),
            onTap: () {
              onTap(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.school,
                color: currentIndex == 2 ? Colors.green : Colors.grey),
            title: Text('School'),
            onTap: () {
              onTap(2);
              Navigator.pop(context);
            },
          ),
          // Add more ListTiles as needed
        ],
      ),
    );
  }
}

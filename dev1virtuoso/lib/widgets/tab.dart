import 'package:flutter/material.dart';

class TabManager extends StatefulWidget {
  final List<Tab> tabs;

  TabManager({required this.tabs});

  @override
  _TabManagerState createState() => _TabManagerState();
}

class _TabManagerState extends State<TabManager> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: widget.tabs.map((tab) => tab.content).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: widget.tabs
            .map(
              (tab) => BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: tab.title,
              ),
            )
            .toList(),
      ),
    );
  }
}

class Tab {
  final String title;
  final Widget content;

  Tab({required this.title, required this.content});
}

class SuportTabManagerStatelessWidget {
  @override
  Widget build(BuildContext context) {
    tabs: [
          Tab(
            title: 'Page 1',
            content: Center(child: Text('Page One Content')),
          ),
          Tab(
            title: 'Page 2',
            content: Center(child: Text('Page Two Content')),
          ),
          Tab(
            title: 'Page 3',
            content: Center(child: Text('Page Three Content')),
          ),
        ],
  }
}

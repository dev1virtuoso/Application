import 'package:flutter/material.dart';
import 'arcade_page.dart';
import 'utility_page.dart';
import 'custom_side_navigation_bar.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('dev1virtuoso', style: TextStyle(color: Colors.white)),
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
              Text('Your content here', style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              Text('Upcoming Event: Event details here',
                  style: TextStyle(fontSize: 16)),
              Text('News: Latest news updates here',
                  style: TextStyle(fontSize: 16)),
              Text('Blogs: Recent blog posts here',
                  style: TextStyle(fontSize: 16)),
              Text('Release: New releases information here',
                  style: TextStyle(fontSize: 16)),
              Text('Research: Research findings here',
                  style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.red),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gamepad, color: Colors.blue),
            label: 'Arcade',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build, color: Colors.green),
            label: 'Utility',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Colors.orange),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

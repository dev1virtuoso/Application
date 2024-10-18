import 'package:flutter/material.dart';
import 'arcade_page.dart';
import 'utility_page.dart';
import 'custom_side_navigation_bar.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

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
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
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
    );
  }
}

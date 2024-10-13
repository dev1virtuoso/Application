import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dev1virtuoso',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const IndexPage(),
    );
  }
}

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Placeholder for logo (removed)
            // SizedBox(width: 8.0),
            // Add 'dev1virtuoso' in the middle
            Text('dev1virtuoso'),
          ],
        ),
        actions: [
          // Add a search button on the top right corner
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search button press
            },
          ),
          // Add a user account button with a circular profile picture on the top right corner
          IconButton(
            icon: CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/images/profile_picture.jpg'), // Replace with your user's profile picture path
            ),
            onPressed: () {
              // Handle user account button press
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Your content here'),
      ),
    );
  }
}

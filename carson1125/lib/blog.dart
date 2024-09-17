import 'package:flutter/material.dart';
import 'blog_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Blogs'),
        ),
        body: ListView.builder(
          itemCount: blogs.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(blogs[index]['title']),
              subtitle: Text(blogs[index]['subtitle']),
              onTap: () {
                // Handle tap on the blog entry
              },
            );
          },
        ),
      ),
    );
  }
}

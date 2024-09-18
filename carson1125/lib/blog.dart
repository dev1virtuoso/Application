import 'package:flutter/material.dart';
import 'blog_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Blogs'),
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

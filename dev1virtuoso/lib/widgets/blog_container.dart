import 'package:flutter/material.dart';

class BlogPost {
  String title;
  String summary;
  String publishDate;
  String author;
  String content;

  BlogPost({
    required this.title,
    required this.summary,
    required this.publishDate,
    required this.author,
    required this.content,
  });
}

class BlogPostCard extends StatelessWidget {
  final BlogPost blogPost;

  const BlogPostCard({Key? key, required this.blogPost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              blogPost.title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              blogPost.summary,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Published on: ${blogPost.publishDate}',
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
            Text(
              'Author: ${blogPost.author}',
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
            Text(
              blogPost.content,
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<BlogPost> blogPosts = [
      BlogPost(
        title: 'Title 1',
        summary: 'Summary 1',
        publishDate: '2025-01-03',
        author: 'Author A',
        content: 'Content 1',
      ),
      BlogPost(
        title: 'Title 2',
        summary: 'Summary 2',
        publishDate: '2025-01-04',
        author: 'Author B',
        content: 'Content 2',
      ),
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: blogPosts.length,
      itemBuilder: (context, index) {
        return BlogPostCard(blogPost: blogPosts[index]);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

class ExpandableCardContent extends StatelessWidget {
  final BlogPost blogPost;

  const ExpandableCardContent({Key? key, required this.blogPost})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
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
            color: Colors.grey,
          ),
        ),
        Text(
          'Author: ${blogPost.author}',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey,
          ),
        ),
        Text(
          blogPost.content,
          style: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }
}

class BlogPostCard extends StatefulWidget {
  final BlogPost blogPost;

  const BlogPostCard({Key? key, required this.blogPost}) : super(key: key);

  @override
  _BlogPostCardState createState() => _BlogPostCardState();
}

class _BlogPostCardState extends State<BlogPostCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text(
                widget.blogPost.title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: _expanded
                  ? ExpandableCardContent(blogPost: widget.blogPost)
                  : null,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(_expanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down),
                  onPressed: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                  },
                ),
              ],
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
      itemCount: blogPosts.length,
      itemBuilder: (context, index) {
        return BlogPostCard(blogPost: blogPosts[index]);
      },
    );
  }
}

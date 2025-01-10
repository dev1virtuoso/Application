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
    var t = AppLocalizations.of(context)!;

    List<BlogPost> blogPosts = [
      BlogPost(
        title: t.post9Title,
        summary: t.post9Summary,
        publishDate: t.post9PublishDate,
        author: t.post9Author,
        content: t.post9Context,
      ),
      BlogPost(
        title: t.post8Title,
        summary: t.post8Summary,
        publishDate: t.post8PublishDate,
        author: t.post8Author,
        content: t.post8Context,
      ),
      BlogPost(
        title: t.post7Title,
        summary: t.post7Summary,
        publishDate: t.post7PublishDate,
        author: t.post7Author,
        content: t.post7Context,
      ),
      BlogPost(
        title: t.post6Title,
        summary: t.post6Summary,
        publishDate: t.post6PublishDate,
        author: t.post6Author,
        content: t.post6Context,
      ),
      BlogPost(
        title: t.post5Title,
        summary: t.post5Summary,
        publishDate: t.post5PublishDate,
        author: t.post5Author,
        content: t.post5Context,
      ),
      BlogPost(
        title: t.post4Title,
        summary: t.post4Summary,
        publishDate: t.post4PublishDate,
        author: t.post4Author,
        content: t.post4Context,
      ),
      BlogPost(
        title: t.post3Title,
        summary: t.post3Summary,
        publishDate: t.post3PublishDate,
        author: t.post3Author,
        content: t.post3Context,
      ),
      BlogPost(
        title: t.post2Title,
        summary: t.post2Summary,
        publishDate: t.post2PublishDate,
        author: t.post2Author,
        content: t.post2Context,
      ),
      BlogPost(
        title: t.post1Title,
        summary: t.post1Summary,
        publishDate: t.post1PublishDate,
        author: t.post1Author,
        content: t.post1Context,
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

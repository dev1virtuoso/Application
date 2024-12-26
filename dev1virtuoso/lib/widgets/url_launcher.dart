import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:markdown/markdown.dart' as markdown;

class UrlStyle {
  static const TextStyle url = TextStyle(
    color: Colors.blue,
    decoration: TextDecoration.underline,
  );

  static const TextStyle blueUnderline = TextStyle(
    color: Colors.blue,
    decoration: TextDecoration.underline,
  );
}

class UrlLauncher {
  static void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Widget buildClickableLink(String url) {
    return InkWell(
      onTap: () {
        launchURL(url);
      },
      child: Text(
        url,
        style: UrlStyle.url,
      ),
    );
  }

  static Widget buildBlueUnderlineText(String text) {
    return Text(
      text,
      style: UrlStyle.blueUnderline,
    );
  }
}

class MarkdownParser {
  static Widget parseMarkdown(String text) {
    List<InlineSpan> children = [];

    List<markdown.Node> nodes = markdown.Document().parseInline(text);

    for (var node in nodes) {
      if (node is markdown.Element && node.tag == 'a') {
        String linkText = node.textContent!;
        String url = node.attributes['href']!;

        children.add(
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                launchLink(url);
              },
              child: Text(
                linkText,
                style: TextStyle(
                    color: Colors.blue, decoration: TextDecoration.underline),
              ),
            ),
          ),
        );
      } else if (node is markdown.Text) {
        children.add(TextSpan(text: node.text));
      }
    }

    return RichText(
      text: TextSpan(children: children),
    );
  }

  static void launchLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

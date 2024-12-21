import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlStyle {
  static const TextStyle url =
      TextStyle(color: Colors.blue, decoration: TextDecoration.underline);
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
}

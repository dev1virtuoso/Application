import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'arcade_page.dart';
import 'utility_page.dart';
import 'custom_side_navigation_bar.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var intl = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(intl.appTitle, style: const TextStyle(color: Colors.white)),
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
              Text(intl.yourContent, style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 20),
              Text(intl.upcomingEvent, style: const TextStyle(fontSize: 16)),
              Text(intl.news, style: const TextStyle(fontSize: 16)),
              Text(intl.blogs, style: const TextStyle(fontSize: 16)),
              Text(intl.releaseInfo, style: const TextStyle(fontSize: 16)),
              Text(intl.researchFindings, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}

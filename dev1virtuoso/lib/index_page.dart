import 'package:flutter/material.dart';
import 'package:dev1virtuoso/app_localizations.dart';
import 'package:dev1virtuoso/scripts.dart';
import 'package:intl/intl.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).appTitle,
            style: const TextStyle(color: Colors.white)),
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
              Text(
                Intl.message('Your Content',
                    name: 'yourContent', desc: 'yourContent'),
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Text(
                Intl.message('Upcoming Event',
                    name: 'upcomingEvent', desc: 'upcomingEvent'),
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                Intl.message('News', name: 'news', desc: 'news'),
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                Intl.message('Blogs', name: 'blogs', desc: 'blogs'),
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                Intl.message('Release Information',
                    name: 'releaseInfo', desc: 'releaseInfo'),
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                Intl.message('Research Findings',
                    name: 'researchFindings', desc: 'researchFindings'),
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'localization.dart';
import 'package:intl/intl.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.appTitle,
          style: const TextStyle(color: Colors.white),
        ),
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
                AppLocalizations.of(context)!.yourContent,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Text(
                AppLocalizations.of(context)!.upcomingEvent,
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                AppLocalizations.of(context)!.news,
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                AppLocalizations.of(context)!.blogs,
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                AppLocalizations.of(context)!.releaseInfo,
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                AppLocalizations.of(context)!.researchFindings,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

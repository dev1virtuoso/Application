import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app_localizations.dart';
import 'package:intl/intl.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.translate("appTitle,
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
                AppLocalizations.of(context)!.translate("yourContent,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Text(
                AppLocalizations.of(context)!.translate("upcomingEvent,
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                AppLocalizations.of(context)!.translate("news"),
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                AppLocalizations.of(context)!.translate("blogs"),
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                AppLocalizations.of(context)!.translate("releaseInfo"),
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                AppLocalizations.of(context)!.translate("researchFindings"),
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

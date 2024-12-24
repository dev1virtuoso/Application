import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:dev1virtuoso/widgets/paragraph_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.pageHomeTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(t.helloWorld),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.purple,
              ),
              child: Text(
                t.pageHomeDrawerHeader,
                style: theme.textTheme.headlineMedium,
              ),
            ),
            ListTile(
              title: Text(
                t.pageHomeDrawerListTileAbout,
                style: theme.textTheme.titleMedium,
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/about',
                );
              },
            ),
            ListTile(
              title: Text(
                t.pageHomeDrawerListTileCredit,
                style: theme.textTheme.titleMedium,
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/credit',
                );
              },
            ),
            ListTile(
              title: Text(
                t.pageHomeDrawerListTileSettings,
                style: theme.textTheme.titleMedium,
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/settings',
                );
              },
            ),
            ListTile(
              title: Text(
                t.pageHomeDrawerListTileSupport,
                style: theme.textTheme.titleMedium,
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/support',
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

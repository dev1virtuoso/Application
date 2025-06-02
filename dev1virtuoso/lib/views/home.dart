import 'package:flutter/material.dart';
import '/l10n/app_localizations.dart';

class Home extends StatelessWidget {
  const Home({super.key, Key});

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
                t.pageHomeDrawerListTileAccount,
                style: theme.textTheme.titleMedium,
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/account',
                );
              },
            ),
            ListTile(
              title: Text(
                t.pageHomeDrawerListTileArcade,
                style: theme.textTheme.titleMedium,
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/arcade',
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
            ),
            ListTile(
              title: Text(
                t.pageHomeDrawerListTileutility,
                style: theme.textTheme.titleMedium,
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/utility',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

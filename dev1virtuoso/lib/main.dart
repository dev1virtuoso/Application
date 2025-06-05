import 'package:flutter/material.dart';
import '/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'views/home.dart';
import 'views/about.dart';
import 'views/account.dart';
import 'views/arcade.dart';
import 'views/credit.dart';
import 'views/playground.dart';
import 'views/private.dart';
import 'views/settings.dart';
import 'views/support.dart';
import 'views/utility.dart';

import 'model/locale.dart';

void main() {
  runApp(const Dev1virtuoso());
}

class Dev1virtuoso extends StatelessWidget {
  const Dev1virtuoso({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocaleModel(),
      child: Consumer<LocaleModel>(
        builder: (context, localeModel, child) => MaterialApp(
          title: 'dev1virtuoso',
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: localeModel.locale,
          routes: {
            '/': (context) => const Home(),
            '/about': (context) => const About(),
            '/account': (context) => const Account(),
            '/arcade': (context) => const Arcade(),
            '/credit': (context) => const Credit(),
            '/home': (context) => const Home(),
            '/playground': (context) => const Playground(),
            '/private': (context) => const Private(),
            '/settings': (context) => const Settings(),
            '/support': (context) => const Support(),
            '/utility': (context) => const Utility(),
          },
          initialRoute: '/',
        ),
      ),
    );
  }
}

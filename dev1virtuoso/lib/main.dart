import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'views/home.dart';
import 'views/about.dart';
import 'views/account.dart';
import 'views/arcade.dart';
import 'views/credit.dart';
import 'views/settings.dart';
import 'views/support.dart';
import 'views/utillty.dart';

import 'model/locale.dart';

import 'package:google_fonts/google_fonts.dart';

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
            textTheme: GoogleFonts.newsreaderTextTheme(),
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
            '/settings': (context) => const Settings(),
            '/support': (context) => const Support(),
            '/utillty': (context) => const Utillty(),
          },
          initialRoute: '/',
        ),
      ),
    );
  }
}

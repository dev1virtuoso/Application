import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'messages_all.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    await initializeMessages(localeName);

    Intl.defaultLocale = localeName;

    return AppLocalizations();
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}

class AppLocalizations {
  static final AppLocalizations _instance = AppLocalizations._();
  late Intl _intl;

  factory AppLocalizations() {
    return _instance;
  }

  AppLocalizations._() {
    _intl = Intl(this);
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  String workout() => _intl.message('Workout');

  String unitMinute() =>
      _intl.message('Minute', desc: 'The singular form of minute');

  String unitMinutes() => _intl.message('Minutes',
      name: 'unitMinutes', desc: 'The plural form of minute');
}

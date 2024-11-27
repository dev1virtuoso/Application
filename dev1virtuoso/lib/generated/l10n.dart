// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `About`
  String get aboutTitle {
    return Intl.message(
      'About',
      name: 'aboutTitle',
      desc: '',
      args: [],
    );
  }

  /// `dev1virtuoso`
  String get dev1virtuoso {
    return Intl.message(
      'dev1virtuoso',
      name: 'dev1virtuoso',
      desc: '',
      args: [],
    );
  }

  /// `Version v0.0.3.6(023)(0036_023-271124a)`
  String get version {
    return Intl.message(
      'Version v0.0.3.6(023)(0036_023-271124a)',
      name: 'version',
      desc: '',
      args: [],
    );
  }

  /// `Developed by Dev1Virtuoso`
  String get developer {
    return Intl.message(
      'Developed by Dev1Virtuoso',
      name: 'developer',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get accountPageTitle {
    return Intl.message(
      'Account',
      name: 'accountPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to your account page!`
  String get welcomeMessage {
    return Intl.message(
      'Welcome to your account page!',
      name: 'welcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Arcade Games`
  String get arcadeTitle {
    return Intl.message(
      'Arcade Games',
      name: 'arcadeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Guess the Number`
  String get guessTheNumber {
    return Intl.message(
      'Guess the Number',
      name: 'guessTheNumber',
      desc: '',
      args: [],
    );
  }

  /// `Apple Chess`
  String get appleChess {
    return Intl.message(
      'Apple Chess',
      name: 'appleChess',
      desc: '',
      args: [],
    );
  }

  /// `Chess`
  String get chess {
    return Intl.message(
      'Chess',
      name: 'chess',
      desc: '',
      args: [],
    );
  }

  /// `Chinese Chess`
  String get chineseChess {
    return Intl.message(
      'Chinese Chess',
      name: 'chineseChess',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Arcade`
  String get arcade {
    return Intl.message(
      'Arcade',
      name: 'arcade',
      desc: '',
      args: [],
    );
  }

  /// `Utility`
  String get utility {
    return Intl.message(
      'Utility',
      name: 'utility',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Your Content`
  String get yourContent {
    return Intl.message(
      'Your Content',
      name: 'yourContent',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming Event`
  String get upcomingEvent {
    return Intl.message(
      'Upcoming Event',
      name: 'upcomingEvent',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get news {
    return Intl.message(
      'News',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `Blogs`
  String get blogs {
    return Intl.message(
      'Blogs',
      name: 'blogs',
      desc: '',
      args: [],
    );
  }

  /// `Release Information`
  String get releaseInfo {
    return Intl.message(
      'Release Information',
      name: 'releaseInfo',
      desc: '',
      args: [],
    );
  }

  /// `Research Findings`
  String get researchFindings {
    return Intl.message(
      'Research Findings',
      name: 'researchFindings',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get general {
    return Intl.message(
      'General',
      name: 'general',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get appearance {
    return Intl.message(
      'Appearance',
      name: 'appearance',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `System Default`
  String get systemDefault {
    return Intl.message(
      'System Default',
      name: 'systemDefault',
      desc: '',
      args: [],
    );
  }

  /// `Text Size`
  String get textSize {
    return Intl.message(
      'Text Size',
      name: 'textSize',
      desc: '',
      args: [],
    );
  }

  /// `Checking for updates...`
  String get checkingUpdates {
    return Intl.message(
      'Checking for updates...',
      name: 'checkingUpdates',
      desc: '',
      args: [],
    );
  }

  /// `Update Available`
  String get updateAvailable {
    return Intl.message(
      'Update Available',
      name: 'updateAvailable',
      desc: '',
      args: [],
    );
  }

  /// `A new version is available. Please update.`
  String get newVersionAvailable {
    return Intl.message(
      'A new version is available. Please update.',
      name: 'newVersionAvailable',
      desc: '',
      args: [],
    );
  }

  /// `No Updates`
  String get noUpdates {
    return Intl.message(
      'No Updates',
      name: 'noUpdates',
      desc: '',
      args: [],
    );
  }

  /// `You are already using the latest version.`
  String get noUpdatesMessage {
    return Intl.message(
      'You are already using the latest version.',
      name: 'noUpdatesMessage',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Failed to fetch the latest version`
  String get updatefetch {
    return Intl.message(
      'Failed to fetch the latest version',
      name: 'updatefetch',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while checking for updates.`
  String get updateCheckError {
    return Intl.message(
      'An error occurred while checking for updates.',
      name: 'updateCheckError',
      desc: '',
      args: [],
    );
  }

  /// `Check for Updates`
  String get checkForUpdates {
    return Intl.message(
      'Check for Updates',
      name: 'checkForUpdates',
      desc: '',
      args: [],
    );
  }

  /// `Utility Page`
  String get utilityPageTitle {
    return Intl.message(
      'Utility Page',
      name: 'utilityPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Calculate Pi`
  String get calculatePiButton {
    return Intl.message(
      'Calculate Pi',
      name: 'calculatePiButton',
      desc: '',
      args: [],
    );
  }

  /// `Pi Value`
  String get piValueLabel {
    return Intl.message(
      'Pi Value',
      name: 'piValueLabel',
      desc: '',
      args: [],
    );
  }

  /// `Calculate BMI`
  String get calculateBMIButton {
    return Intl.message(
      'Calculate BMI',
      name: 'calculateBMIButton',
      desc: '',
      args: [],
    );
  }

  /// `BMI Result`
  String get bmiResultLabel {
    return Intl.message(
      'BMI Result',
      name: 'bmiResultLabel',
      desc: '',
      args: [],
    );
  }

  /// `Generate Random String`
  String get generateRandomStringButton {
    return Intl.message(
      'Generate Random String',
      name: 'generateRandomStringButton',
      desc: '',
      args: [],
    );
  }

  /// `Random String`
  String get randomStringLabel {
    return Intl.message(
      'Random String',
      name: 'randomStringLabel',
      desc: '',
      args: [],
    );
  }

  /// `Translate to Morse Code`
  String get translateToMorseCodeButton {
    return Intl.message(
      'Translate to Morse Code',
      name: 'translateToMorseCodeButton',
      desc: '',
      args: [],
    );
  }

  /// `Morse Code`
  String get morseCodeLabel {
    return Intl.message(
      'Morse Code',
      name: 'morseCodeLabel',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

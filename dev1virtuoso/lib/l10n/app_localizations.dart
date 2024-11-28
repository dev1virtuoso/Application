import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_kr.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('kr'),
    Locale('zh')
  ];

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutTitle;

  /// No description provided for @dev1virtuoso.
  ///
  /// In en, this message translates to:
  /// **'dev1virtuoso'**
  String get dev1virtuoso;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version v0.0.3.6(023)(0036_023-271124a)'**
  String get version;

  /// No description provided for @developer.
  ///
  /// In en, this message translates to:
  /// **'Developed by Dev1Virtuoso'**
  String get developer;

  /// No description provided for @accountPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get accountPageTitle;

  /// No description provided for @welcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'Welcome to your account page!'**
  String get welcomeMessage;

  /// No description provided for @arcadeTitle.
  ///
  /// In en, this message translates to:
  /// **'Arcade Games'**
  String get arcadeTitle;

  /// No description provided for @guessTheNumber.
  ///
  /// In en, this message translates to:
  /// **'Guess the Number'**
  String get guessTheNumber;

  /// No description provided for @appleChess.
  ///
  /// In en, this message translates to:
  /// **'Apple Chess'**
  String get appleChess;

  /// No description provided for @chess.
  ///
  /// In en, this message translates to:
  /// **'Chess'**
  String get chess;

  /// No description provided for @chineseChess.
  ///
  /// In en, this message translates to:
  /// **'Chinese Chess'**
  String get chineseChess;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @arcade.
  ///
  /// In en, this message translates to:
  /// **'Arcade'**
  String get arcade;

  /// No description provided for @utility.
  ///
  /// In en, this message translates to:
  /// **'Utility'**
  String get utility;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @yourContent.
  ///
  /// In en, this message translates to:
  /// **'Your Content'**
  String get yourContent;

  /// No description provided for @upcomingEvent.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Event'**
  String get upcomingEvent;

  /// No description provided for @news.
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get news;

  /// No description provided for @blogs.
  ///
  /// In en, this message translates to:
  /// **'Blogs'**
  String get blogs;

  /// No description provided for @releaseInfo.
  ///
  /// In en, this message translates to:
  /// **'Release Information'**
  String get releaseInfo;

  /// No description provided for @researchFindings.
  ///
  /// In en, this message translates to:
  /// **'Research Findings'**
  String get researchFindings;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @systemDefault.
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get systemDefault;

  /// No description provided for @textSize.
  ///
  /// In en, this message translates to:
  /// **'Text Size'**
  String get textSize;

  /// No description provided for @checkingUpdates.
  ///
  /// In en, this message translates to:
  /// **'Checking for updates...'**
  String get checkingUpdates;

  /// No description provided for @updateAvailable.
  ///
  /// In en, this message translates to:
  /// **'Update Available'**
  String get updateAvailable;

  /// No description provided for @newVersionAvailable.
  ///
  /// In en, this message translates to:
  /// **'A new version is available. Please update.'**
  String get newVersionAvailable;

  /// No description provided for @noUpdates.
  ///
  /// In en, this message translates to:
  /// **'No Updates'**
  String get noUpdates;

  /// No description provided for @noUpdatesMessage.
  ///
  /// In en, this message translates to:
  /// **'You are already using the latest version.'**
  String get noUpdatesMessage;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @updatefetch.
  ///
  /// In en, this message translates to:
  /// **'Failed to fetch the latest version'**
  String get updatefetch;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @updateCheckError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while checking for updates.'**
  String get updateCheckError;

  /// No description provided for @checkForUpdates.
  ///
  /// In en, this message translates to:
  /// **'Check for Updates'**
  String get checkForUpdates;

  /// No description provided for @utilityPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Utility Page'**
  String get utilityPageTitle;

  /// No description provided for @calculatePiButton.
  ///
  /// In en, this message translates to:
  /// **'Calculate Pi'**
  String get calculatePiButton;

  /// No description provided for @piValueLabel.
  ///
  /// In en, this message translates to:
  /// **'Pi Value'**
  String get piValueLabel;

  /// No description provided for @calculateBMIButton.
  ///
  /// In en, this message translates to:
  /// **'Calculate BMI'**
  String get calculateBMIButton;

  /// No description provided for @bmiResultLabel.
  ///
  /// In en, this message translates to:
  /// **'BMI Result'**
  String get bmiResultLabel;

  /// No description provided for @generateRandomStringButton.
  ///
  /// In en, this message translates to:
  /// **'Generate Random String'**
  String get generateRandomStringButton;

  /// No description provided for @randomStringLabel.
  ///
  /// In en, this message translates to:
  /// **'Random String'**
  String get randomStringLabel;

  /// No description provided for @translateToMorseCodeButton.
  ///
  /// In en, this message translates to:
  /// **'Translate to Morse Code'**
  String get translateToMorseCodeButton;

  /// No description provided for @morseCodeLabel.
  ///
  /// In en, this message translates to:
  /// **'Morse Code'**
  String get morseCodeLabel;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'kr', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'kr': return AppLocalizationsKr();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}

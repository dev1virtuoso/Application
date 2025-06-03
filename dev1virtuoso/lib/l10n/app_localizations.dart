import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

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
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @pageHomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get pageHomeTitle;

  /// No description provided for @pageHomeDrawerHeader.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get pageHomeDrawerHeader;

  /// No description provided for @pageHomeDrawerListTileAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get pageHomeDrawerListTileAbout;

  /// No description provided for @pageHomeDrawerListTileAccount.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get pageHomeDrawerListTileAccount;

  /// No description provided for @pageHomeDrawerListTileArcade.
  ///
  /// In en, this message translates to:
  /// **'Arcade'**
  String get pageHomeDrawerListTileArcade;

  /// No description provided for @pageHomeDrawerListTileCredit.
  ///
  /// In en, this message translates to:
  /// **'Credit'**
  String get pageHomeDrawerListTileCredit;

  /// No description provided for @pageHomeDrawerListTilePlayground.
  ///
  /// In en, this message translates to:
  /// **'Machine Learning Playground'**
  String get pageHomeDrawerListTilePlayground;

  /// No description provided for @pageHomeDrawerListTileSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get pageHomeDrawerListTileSettings;

  /// No description provided for @pageHomeDrawerListTileSupport.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get pageHomeDrawerListTileSupport;

  /// No description provided for @pageHomeDrawerListTileutility.
  ///
  /// In en, this message translates to:
  /// **'Utility'**
  String get pageHomeDrawerListTileutility;

  /// No description provided for @helloWorld.
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// No description provided for @pageAboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get pageAboutTitle;

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About Me'**
  String get aboutTitle;

  /// No description provided for @carsonWuAboutMe.
  ///
  /// In en, this message translates to:
  /// **'Software development is a creative craft, and I consider myself a masterful artist, weaving brilliance with every stroke of code. - Carson Wu, the Extraordinary Developer.\n\nI am Carson Wu, a talented young prodigy from Hong Kong specializing in the fascinating fields of Artificial Intelligence (AI) and Machine Learning (ML). Despite the perceived complexity of software development, I approach it with a mindset of awe and imagination. Every line of code represents a stroke of brilliance I use to create extraordinary things.\n\nFrom a young age, technology and its boundless possibilities have enthralled me. Fueled by curiosity and determination, I immersed myself in the enchanting world of AI and ML, eager to unravel their mysteries and harness their immense potential. What started as a hobby quickly transformed into a fervent passion, driving me to push boundaries and explore the frontiers of these cutting-edge technologies.\n\nDespite my youth, I have developed a profound understanding of AI and ML concepts, algorithms, and tools. My programming skills have been honed, and I am proficient in languages like Python, Java, and C, as well as frameworks such as TensorFlow, PyTorch, and OpenCV. Through dedicated self-study and active engagement within online communities, I have gained hands-on experience in developing AI models, training neural networks, and deriving meaningful insights from data.\n\nDespite my youth, I have developed a profound understanding of AI and ML concepts, algorithms, and tools. My programming skills have been honed, and I am proficient in languages like Python, Java, and C, as well as frameworks such as TensorFlow, PyTorch, and OpenCV. Through dedicated self-study and active engagement within online communities, I have gained hands-on experience in developing AI models, training neural networks, and deriving meaningful insights from data.\n\nMy projects have spanned a wide spectrum, including image recognition, natural language processing, predictive analytics, and recommendation systems. I am captivated by the transformative power of AI and ML to revolutionize industries, tackle intricate problems, and enrich human lives. Continuously seeking opportunities to apply my knowledge and expertise to real-world challenges, I am driven to make a tangible impact on the world.\n\nMy projects have spanned a wide spectrum, including image recognition, natural language processing, predictive analytics, and recommendation systems. I am captivated by the transformative power of AI and ML to revolutionize industries, tackle intricate problems, and enrich human lives. Continuously seeking opportunities to apply my knowledge and expertise to real-world challenges, I am driven to make a tangible impact on the world.\n\nBeyond my technical prowess, I am an inquisitive and adaptable learner. I embrace challenges with a growth mindset, fearlessly exploring new concepts and conquering obstacles. Recognizing the value of collaboration and effective communication, I relish opportunities to work with like-minded individuals, exchanging ideas and collectively pushing the boundaries of innovation.\n\nEmbarking on my journey as a world-class developer specializing in AI and ML, I remain committed to perpetual learning and evolution. The future possibilities and potential of these technologies to shape our world in profound ways fill me with excitement. With every project, I aim to leave an indelible impression, unveiling the brilliance of AI and ML through meticulously crafted code.\n\nIf you are seeking a young, talented enthusiast in the realms of AI and ML to contribute to your projects, I would be thrilled to collaborate with you. Together, let us paint a future where the possibilities of AI and ML are fully realized, and where brilliance radiates from every line of code.'**
  String get carsonWuAboutMe;

  /// No description provided for @personalInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Personal Information Table'**
  String get personalInfoTitle;

  /// No description provided for @personalInfoName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get personalInfoName;

  /// No description provided for @personalInfoNameContext.
  ///
  /// In en, this message translates to:
  /// **'Carson Wu'**
  String get personalInfoNameContext;

  /// No description provided for @personalInfoCName.
  ///
  /// In en, this message translates to:
  /// **'Chinese name'**
  String get personalInfoCName;

  /// No description provided for @personalInfoCNameContext.
  ///
  /// In en, this message translates to:
  /// **'胡梓燊'**
  String get personalInfoCNameContext;

  /// No description provided for @personalInfoBorn.
  ///
  /// In en, this message translates to:
  /// **'Born'**
  String get personalInfoBorn;

  /// No description provided for @personalInfoBornContext.
  ///
  /// In en, this message translates to:
  /// **'Wu Tsz San Carson\n25 November 2010\nHong Kong'**
  String get personalInfoBornContext;

  /// No description provided for @personalInfoEOL.
  ///
  /// In en, this message translates to:
  /// **'Epistemology of Love'**
  String get personalInfoEOL;

  /// No description provided for @personalInfoEOLContext.
  ///
  /// In en, this message translates to:
  /// **'Romantic view of love: This view of love emphasizes romance, passion, and attraction. People believe that love is an intense emotional experience and value romantic expressions and sparks of love.\nSacred view of love: This view of love considers love as a sacred force that transcends personal feelings and worldly factors. People believe that love is a sacred connection and value the union of spirit and emotions.'**
  String get personalInfoEOLContext;

  /// No description provided for @personalInfoFavoriteActor.
  ///
  /// In en, this message translates to:
  /// **'Favorite actor'**
  String get personalInfoFavoriteActor;

  /// No description provided for @personalInfoFavoriteActorContext.
  ///
  /// In en, this message translates to:
  /// **'Glen Thomas Powell Jr.'**
  String get personalInfoFavoriteActorContext;

  /// No description provided for @personalInfoFavoriteBotanical.
  ///
  /// In en, this message translates to:
  /// **'Favorite botanical'**
  String get personalInfoFavoriteBotanical;

  /// No description provided for @personalInfoFavoriteBotanicalContext.
  ///
  /// In en, this message translates to:
  /// **'Lavandula stoechas'**
  String get personalInfoFavoriteBotanicalContext;

  /// No description provided for @personalInfoFavoriteColor.
  ///
  /// In en, this message translates to:
  /// **'Favorite color'**
  String get personalInfoFavoriteColor;

  /// No description provided for @personalInfoFavoriteColorContext.
  ///
  /// In en, this message translates to:
  /// **'Dark Purple, HEX: 872B8D\nRGB: 135, 43, 141\nHSL: 292, 53%, 37%'**
  String get personalInfoFavoriteColorContext;

  /// No description provided for @personalInfoFavoriteCeature.
  ///
  /// In en, this message translates to:
  /// **'Favorite creature'**
  String get personalInfoFavoriteCeature;

  /// No description provided for @personalInfoFavoriteCeatureContext.
  ///
  /// In en, this message translates to:
  /// **'Felis catus domesticus (The Ragdoll)'**
  String get personalInfoFavoriteCeatureContext;

  /// No description provided for @personalInfoFavoriteInsecta.
  ///
  /// In en, this message translates to:
  /// **'Favorite insecta'**
  String get personalInfoFavoriteInsecta;

  /// No description provided for @personalInfoFavoriteInsectaContext.
  ///
  /// In en, this message translates to:
  /// **'Gromphadorhina portentosa'**
  String get personalInfoFavoriteInsectaContext;

  /// No description provided for @personalInfoFavoriteields.
  ///
  /// In en, this message translates to:
  /// **'Fields'**
  String get personalInfoFavoriteields;

  /// No description provided for @personalInfoFavoriteieldsContext.
  ///
  /// In en, this message translates to:
  /// **'Computer Science'**
  String get personalInfoFavoriteieldsContext;

  /// No description provided for @personalInfoGender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get personalInfoGender;

  /// No description provided for @personalInfoGenderContext.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get personalInfoGenderContext;

  /// No description provided for @personalInfoMBTI.
  ///
  /// In en, this message translates to:
  /// **'MBTI'**
  String get personalInfoMBTI;

  /// No description provided for @personalInfoMBTIContext.
  ///
  /// In en, this message translates to:
  /// **'ENTJ-T(Last updated: 09/02/2025)'**
  String get personalInfoMBTIContext;

  /// No description provided for @personalInfoPI.
  ///
  /// In en, this message translates to:
  /// **'Political ideologies'**
  String get personalInfoPI;

  /// No description provided for @personalInfoPIContext.
  ///
  /// In en, this message translates to:
  /// **'Left-wing politics'**
  String get personalInfoPIContext;

  /// No description provided for @personalInfoPronouns.
  ///
  /// In en, this message translates to:
  /// **'Pronouns'**
  String get personalInfoPronouns;

  /// No description provided for @personalInfoPronounsContext.
  ///
  /// In en, this message translates to:
  /// **'He, him, his'**
  String get personalInfoPronounsContext;

  /// No description provided for @personalInfoReligion.
  ///
  /// In en, this message translates to:
  /// **'Religion'**
  String get personalInfoReligion;

  /// No description provided for @personalInfoReligionContext.
  ///
  /// In en, this message translates to:
  /// **'Atheism'**
  String get personalInfoReligionContext;

  /// No description provided for @personalInfoSO.
  ///
  /// In en, this message translates to:
  /// **'Sexual orientation'**
  String get personalInfoSO;

  /// No description provided for @personalInfoSOContext.
  ///
  /// In en, this message translates to:
  /// **'Bisexuality, demisexuality'**
  String get personalInfoSOContext;

  /// No description provided for @personalInfoSignature.
  ///
  /// In en, this message translates to:
  /// **'Signature'**
  String get personalInfoSignature;

  /// No description provided for @personalInfoZS.
  ///
  /// In en, this message translates to:
  /// **'Zodiac Sign'**
  String get personalInfoZS;

  /// No description provided for @personalInfoZSContext.
  ///
  /// In en, this message translates to:
  /// **'Sagittarius'**
  String get personalInfoZSContext;

  /// No description provided for @creditInfoDesigner.
  ///
  /// In en, this message translates to:
  /// **'Designer'**
  String get creditInfoDesigner;

  /// No description provided for @creditInfoProgrammer.
  ///
  /// In en, this message translates to:
  /// **'Programmer'**
  String get creditInfoProgrammer;

  /// No description provided for @creditInfoHWS.
  ///
  /// In en, this message translates to:
  /// **'Human Utterance Tone, Word Choice, and Style Prediction System'**
  String get creditInfoHWS;

  /// No description provided for @creditInfoHWSContext.
  ///
  /// In en, this message translates to:
  /// **'H.A.R.P.E.R. (Humane Analysis of Rhetoric, Pronunciation, and Expression in Response)'**
  String get creditInfoHWSContext;

  /// No description provided for @creditInfoBM.
  ///
  /// In en, this message translates to:
  /// **'Language Model (Base Model)'**
  String get creditInfoBM;

  /// No description provided for @creditInfoBMContext.
  ///
  /// In en, this message translates to:
  /// **'A.R.I.E.L. (Advanced Retrieval and Inference Engine for Learning)'**
  String get creditInfoBMContext;

  /// No description provided for @contactTitle.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contactTitle;

  /// No description provided for @contactDiscord.
  ///
  /// In en, this message translates to:
  /// **'Discord'**
  String get contactDiscord;

  /// No description provided for @contactEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get contactEmail;

  /// No description provided for @contactFacebook.
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get contactFacebook;

  /// No description provided for @contactGitHub.
  ///
  /// In en, this message translates to:
  /// **'GitHub'**
  String get contactGitHub;

  /// No description provided for @contactInstagram.
  ///
  /// In en, this message translates to:
  /// **'Instagram'**
  String get contactInstagram;

  /// No description provided for @contactKakaoTalk.
  ///
  /// In en, this message translates to:
  /// **'KakaoTalk'**
  String get contactKakaoTalk;

  /// No description provided for @contactViber.
  ///
  /// In en, this message translates to:
  /// **'Viber'**
  String get contactViber;

  /// No description provided for @contactLINE.
  ///
  /// In en, this message translates to:
  /// **'LINE'**
  String get contactLINE;

  /// No description provided for @contactLinkedIn.
  ///
  /// In en, this message translates to:
  /// **'LinkedIn'**
  String get contactLinkedIn;

  /// No description provided for @contactLinktree.
  ///
  /// In en, this message translates to:
  /// **'Linktree'**
  String get contactLinktree;

  /// No description provided for @contactORCID.
  ///
  /// In en, this message translates to:
  /// **'ORCID'**
  String get contactORCID;

  /// No description provided for @contactPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get contactPhone;

  /// No description provided for @contactReddit.
  ///
  /// In en, this message translates to:
  /// **'Reddit'**
  String get contactReddit;

  /// No description provided for @contactSignal.
  ///
  /// In en, this message translates to:
  /// **'Signal'**
  String get contactSignal;

  /// No description provided for @contactTelegram.
  ///
  /// In en, this message translates to:
  /// **'Telegram'**
  String get contactTelegram;

  /// No description provided for @contactThreads.
  ///
  /// In en, this message translates to:
  /// **'Threads'**
  String get contactThreads;

  /// No description provided for @contactWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp'**
  String get contactWhatsApp;

  /// No description provided for @contactTwitter.
  ///
  /// In en, this message translates to:
  /// **'X(Formerly Twitter)'**
  String get contactTwitter;

  /// No description provided for @contactMethod.
  ///
  /// In en, this message translates to:
  /// **'Contact Method'**
  String get contactMethod;

  /// No description provided for @pageCreditTitle.
  ///
  /// In en, this message translates to:
  /// **'Credits'**
  String get pageCreditTitle;

  /// No description provided for @creditTitle.
  ///
  /// In en, this message translates to:
  /// **'Credits'**
  String get creditTitle;

  /// No description provided for @appVersion.
  ///
  /// In en, this message translates to:
  /// **'Software version'**
  String get appVersion;

  /// No description provided for @carsonwu.
  ///
  /// In en, this message translates to:
  /// **'Carson Wu'**
  String get carsonwu;

  /// No description provided for @donateTitle.
  ///
  /// In en, this message translates to:
  /// **'Donate'**
  String get donateTitle;

  /// No description provided for @donateTitle1.
  ///
  /// In en, this message translates to:
  /// **'Sponsors Profile'**
  String get donateTitle1;

  /// No description provided for @donateDescribe1.
  ///
  /// In en, this message translates to:
  /// **'Welcome to dev1virtuoso\'s Sponsors Profile! 🌟'**
  String get donateDescribe1;

  /// No description provided for @donateDescribeTitle1.
  ///
  /// In en, this message translates to:
  /// **'About Me'**
  String get donateDescribeTitle1;

  /// No description provided for @donateDescribe2.
  ///
  /// In en, this message translates to:
  /// **'I\'m dev1virtuoso, a software developer on a mission to craft innovative solutions with every line of code.'**
  String get donateDescribe2;

  /// No description provided for @donateDescribeTitle2.
  ///
  /// In en, this message translates to:
  /// **'My Vision'**
  String get donateDescribeTitle2;

  /// No description provided for @donateDescribe3.
  ///
  /// In en, this message translates to:
  /// **'🎨 Software development is my canvas, and each code snippet is a stroke of brilliance. Together, let\'s shape a future where technology empowers change and progress.'**
  String get donateDescribe3;

  /// No description provided for @donateDescribeTitle3.
  ///
  /// In en, this message translates to:
  /// **'Your Support'**
  String get donateDescribeTitle3;

  /// No description provided for @donateDescribe4.
  ///
  /// In en, this message translates to:
  /// **'🚀 Your sponsorship fuels my creative journey. Join me in building a tomorrow filled with endless possibilities through technology!'**
  String get donateDescribe4;

  /// No description provided for @donateDescribeTitle4.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Connect'**
  String get donateDescribeTitle4;

  /// No description provided for @donateDescribe5.
  ///
  /// In en, this message translates to:
  /// **'📧 Reach out at carson.developer1125@gmail.com to collaborate or just to say hello! Let\'s innovate together! 🌟'**
  String get donateDescribe5;

  /// No description provided for @donateBMC.
  ///
  /// In en, this message translates to:
  /// **'Buy Me a Coffee'**
  String get donateBMC;

  /// No description provided for @donateGHSP.
  ///
  /// In en, this message translates to:
  /// **'GitHub Sponsors profile'**
  String get donateGHSP;

  /// No description provided for @pageAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get pageAccountTitle;

  /// No description provided for @signUpTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUpTitle;

  /// No description provided for @signInTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signInTitle;

  /// No description provided for @pageArcadeTitle.
  ///
  /// In en, this message translates to:
  /// **'Arcade'**
  String get pageArcadeTitle;

  /// No description provided for @arcadeTitle.
  ///
  /// In en, this message translates to:
  /// **'Arcade'**
  String get arcadeTitle;

  /// No description provided for @pageExampleTitle.
  ///
  /// In en, this message translates to:
  /// **'Example'**
  String get pageExampleTitle;

  /// No description provided for @pagePlaygroundTitle.
  ///
  /// In en, this message translates to:
  /// **'Machine Learning Playground'**
  String get pagePlaygroundTitle;

  /// No description provided for @playgroundTitle.
  ///
  /// In en, this message translates to:
  /// **'Machine Learning Playground'**
  String get playgroundTitle;

  /// No description provided for @pageSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get pageSettingsTitle;

  /// No description provided for @pageSettingsInputLanguage.
  ///
  /// In en, this message translates to:
  /// **'{locale, select, ar {عربي} en {English} es {Español} other {-}}'**
  String pageSettingsInputLanguage(String locale);

  /// No description provided for @pageSettingsAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get pageSettingsAppearance;

  /// No description provided for @pageSettingsLanguageSelectionHeading.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get pageSettingsLanguageSelectionHeading;

  /// No description provided for @pageutilityTitle.
  ///
  /// In en, this message translates to:
  /// **'Utility'**
  String get pageutilityTitle;

  /// No description provided for @utilityTitle.
  ///
  /// In en, this message translates to:
  /// **'Utility'**
  String get utilityTitle;

  /// No description provided for @utility1Title.
  ///
  /// In en, this message translates to:
  /// **'Calculator'**
  String get utility1Title;

  /// No description provided for @utility1Summary.
  ///
  /// In en, this message translates to:
  /// **'A calculator is a tool that performs mathematical calculations. It allows users to perform basic arithmetic operations such as addition, subtraction, multiplication, and division.'**
  String get utility1Summary;

  /// No description provided for @utility1Context.
  ///
  /// In en, this message translates to:
  /// **'test'**
  String get utility1Context;

  /// No description provided for @utility2Title.
  ///
  /// In en, this message translates to:
  /// **'Clock'**
  String get utility2Title;

  /// No description provided for @utility2Summary.
  ///
  /// In en, this message translates to:
  /// **'The Clock utility consists of a UTC (Coordinated Universal Time) and local time clock, as well as a stopwatch. The UTC clock displays the current time in the UTC time zone, which is commonly used as a global time reference. The local time clock displays the current time based on the user\'s local time zone. The stopwatch feature allows users to measure elapsed time accurately.'**
  String get utility2Summary;

  /// No description provided for @utility2Context.
  ///
  /// In en, this message translates to:
  /// **'test'**
  String get utility2Context;

  /// No description provided for @utility3Title.
  ///
  /// In en, this message translates to:
  /// **'Random Code Generator'**
  String get utility3Title;

  /// No description provided for @utility3Summary.
  ///
  /// In en, this message translates to:
  /// **'A Random Code Generator is a tool that generates random codes or strings of characters. These codes can be useful for various purposes such as creating unique identifiers, generating secure passwords, or simulating random data. The generated codes are typically alphanumeric and can be customized based on specific requirements.'**
  String get utility3Summary;

  /// No description provided for @utility3Context.
  ///
  /// In en, this message translates to:
  /// **'test'**
  String get utility3Context;

  /// No description provided for @utility3Length.
  ///
  /// In en, this message translates to:
  /// **'Length'**
  String get utility3Length;

  /// No description provided for @utility3UpperCase.
  ///
  /// In en, this message translates to:
  /// **'Include Upper Case Letters'**
  String get utility3UpperCase;

  /// No description provided for @utility3LowerCase.
  ///
  /// In en, this message translates to:
  /// **'Include Lower Case Letters'**
  String get utility3LowerCase;

  /// No description provided for @utility3Digits.
  ///
  /// In en, this message translates to:
  /// **'Include Digits'**
  String get utility3Digits;

  /// No description provided for @utility3SpecialCharacters.
  ///
  /// In en, this message translates to:
  /// **'Include Special Characters'**
  String get utility3SpecialCharacters;

  /// No description provided for @utility3GeneratedTitle.
  ///
  /// In en, this message translates to:
  /// **'Generated Code'**
  String get utility3GeneratedTitle;

  /// No description provided for @utility3Generated.
  ///
  /// In en, this message translates to:
  /// **'Generated Code:'**
  String get utility3Generated;

  /// No description provided for @utility3CopyCode.
  ///
  /// In en, this message translates to:
  /// **'Copy Result'**
  String get utility3CopyCode;

  /// No description provided for @utility3NoCode.
  ///
  /// In en, this message translates to:
  /// **'The result is empty'**
  String get utility3NoCode;

  /// No description provided for @utility3CodeCopied.
  ///
  /// In en, this message translates to:
  /// **'Result Copied'**
  String get utility3CodeCopied;

  /// No description provided for @utility3NoCharacterType.
  ///
  /// In en, this message translates to:
  /// **'At least one type of character should be included'**
  String get utility3NoCharacterType;

  /// No description provided for @utility4Title.
  ///
  /// In en, this message translates to:
  /// **'π'**
  String get utility4Title;

  /// No description provided for @utility4SubTitle.
  ///
  /// In en, this message translates to:
  /// **'Pi Calculator'**
  String get utility4SubTitle;

  /// No description provided for @utility4Summary.
  ///
  /// In en, this message translates to:
  /// **'The π utility allows you to calculate the value of π (pi). Pi is a mathematical constant that represents the ratio of a circle\'s circumference to its diameter. It is an irrational number, approximately equal to 3.14159. The π utility provides a convenient way to calculate π and perform related calculations involving circles and trigonometry.'**
  String get utility4Summary;

  /// No description provided for @utility4Completed.
  ///
  /// In en, this message translates to:
  /// **'Calculation completed, please check the pi.txt file at:'**
  String get utility4Completed;

  /// No description provided for @utility4Enter.
  ///
  /// In en, this message translates to:
  /// **'Enter the number of decimal places'**
  String get utility4Enter;

  /// No description provided for @utility4Calculate.
  ///
  /// In en, this message translates to:
  /// **'Calculate'**
  String get utility4Calculate;

  /// No description provided for @utility4Result.
  ///
  /// In en, this message translates to:
  /// **'Result:'**
  String get utility4Result;

  /// No description provided for @utility4Progress.
  ///
  /// In en, this message translates to:
  /// **'Progress:'**
  String get utility4Progress;

  /// No description provided for @utility4CalculateTime.
  ///
  /// In en, this message translates to:
  /// **'Calculation completed in (seconds):'**
  String get utility4CalculateTime;

  /// No description provided for @pageSupportTitle.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get pageSupportTitle;

  /// No description provided for @copyrightStatement.
  ///
  /// In en, this message translates to:
  /// **'Copyright (c) 2023 - present Carson Wu. All rights reserved.'**
  String get copyrightStatement;

  /// No description provided for @copyrightNoticeTitle.
  ///
  /// In en, this message translates to:
  /// **'Copyright Notice'**
  String get copyrightNoticeTitle;

  /// No description provided for @copyrightNotice.
  ///
  /// In en, this message translates to:
  /// **'1. All content on this software, including but not limited to text, images, videos, audio, scripts, and other materials, is protected by copyright.\n\n2. All content is intended for personal use only and may not be used for commercial purposes. No content may be used for commercial purposes without the explicit written permission of the copyright owner.\n\n3. When reproducing content from this website, all copyright notices, attributions, rights protections, and other relevant information must be retained from the original content.\n\n4. When reproducing content from this website, the original author\'s name, original source, and other relevant information must be prominently indicated.\n\n5. No modifications, derivatives, distributions, sales, or any other forms of utilization of the content from this website are allowed without the explicit written permission of the copyright owner.\n\n6. The use of the content from this website must comply with all applicable laws and regulations.\n\n7. All trademarks, logos, and images on this website are the property of their respective owners. The use, copying, or display of these trademarks, logos, and images is prohibited without the explicit written permission of the respective owners.\n\n8. This website may contain third-party content or links provided for convenience. The inclusion of such content or links does not imply endorsement or responsibility for the third-party content.\n\n9. This website is not liable for any loss or damage incurred from the use of the content on this website or the access of third-party links.\n\n10. This copyright notice is subject to change or update at any time. Please check the latest version regularly.\n\nFor inquiries, please contact Carson:'**
  String get copyrightNotice;

  /// No description provided for @mitLTitle.
  ///
  /// In en, this message translates to:
  /// **'The MIT License'**
  String get mitLTitle;

  /// No description provided for @mitLContent.
  ///
  /// In en, this message translates to:
  /// **'All content and components on this website are licensed under the The MIT License.'**
  String get mitLContent;

  /// No description provided for @mitLAboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About The MIT License'**
  String get mitLAboutTitle;

  /// No description provided for @mitLAboutContent.
  ///
  /// In en, this message translates to:
  /// **'The MIT License(MPL) is a free and open-source software license developed by the Mozilla Foundation. It is a permissive license that allows you to use, modify, and distribute the licensed software under certain conditions.\n\nFor more information about the The MIT License, please visit the official MPL website:.'**
  String get mitLAboutContent;

  /// No description provided for @licenceTitle.
  ///
  /// In en, this message translates to:
  /// **'LICENSE'**
  String get licenceTitle;

  /// No description provided for @mitlicenceTitle.
  ///
  /// In en, this message translates to:
  /// **'MIT License'**
  String get mitlicenceTitle;

  /// No description provided for @licence.
  ///
  /// In en, this message translates to:
  /// **'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:\n\nThe above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.\n\nTHE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.'**
  String get licence;

  /// No description provided for @versionTitle.
  ///
  /// In en, this message translates to:
  /// **'Software Version Stages'**
  String get versionTitle;

  /// No description provided for @version1Context.
  ///
  /// In en, this message translates to:
  /// **'- Development Version (Alpha): This version indicates that the software is in the early stages of development, focusing primarily on implementing software features. It is usually used internally by the software developers. This version may have more errors and defects that need further refinement.\n\n- Testing Version (Beta): Compared to the Alpha version, the Beta version has significant improvements and resolves major errors. However, it may still have some defects that require testing and feedback for further improvement.\n\n- Release Candidate (RC) Version: The RC version is an important stage following the Beta version, indicating that the software has entered the final testing phase and may become a candidate for the official release. At this stage, the software usually eliminates most known errors and defects and meets the expected functionality and quality requirements.\n\n- Stable Version: This version indicates that the software has become relatively stable, with most errors and defects fixed. However, there may still be a few minor issues present.\n\n- Release Version: This version represents the final release, having undergone comprehensive testing and verification, and is ready for normal user use.'**
  String get version1Context;

  /// No description provided for @versionTitle2.
  ///
  /// In en, this message translates to:
  /// **'Version Numbering and Naming Guidelines'**
  String get versionTitle2;

  /// No description provided for @version2Context.
  ///
  /// In en, this message translates to:
  /// **'The software version number consists of five parts: the major version number, the minor version number, the stage version number, the revision version number, and the build number. For example: v1.1.5.0(001).\n\nMajor Version Number (1): Increase the major version number when there are significant functional changes or architectural adjustments in the software.\n\n- Minor Version Number (1): Increase the minor version number when there are feature additions or modifications in the software.\n\n- Stage Version Number (1): Generally used for bug fixes, performance improvements, or minor changes. Increment the stage version number.\n\n- Revision Version Number (1): Generally used for bug fixes, performance improvements, or minor changes. Increment the revision version number.\n\n- Build Number (001): Used to represent the specific build or release of the software. Increment the build number for each new build.'**
  String get version2Context;

  /// No description provided for @companyLicenseTitle.
  ///
  /// In en, this message translates to:
  /// **'Company License'**
  String get companyLicenseTitle;

  /// No description provided for @companyLicense.
  ///
  /// In en, this message translates to:
  /// **'Company License\n\nThis license grants commercial, team, or profit-generating use of the Company Version.\n\nTerms and Conditions:\n\n1. Companies must adhere to all applicable laws and regulations.\n\n2. The Company Version is protected by the author\'s intellectual property rights and may not be reproduced, modified, or distributed without authorization.\n\n3. The author\'s name and other identifiable rights must be displayed when using the Company Version.\n\n4. If the company\'s monthly net income exceeds \$5000, a 15% fee must be remitted to the author. GitHub will deduct a 6% charge, and companies must pay an additional 6% fee.\n\n5. Access will be maintained upon payment. Failure to make timely payments will result in temporary access suspension until payment is successfully processed.\n\nValidity Period: This license is effective upon issuance and is valid for one month, with the option to renew as needed.\n\nAuthor: Carson Wu\n\nLast Updated: November 5, 2024'**
  String get companyLicense;

  /// No description provided for @touaTitle.
  ///
  /// In en, this message translates to:
  /// **'Ownership of Products; Terms of Use Agreement'**
  String get touaTitle;

  /// No description provided for @touaDescribe1.
  ///
  /// In en, this message translates to:
  /// **'These Terms of Use govern the usage of all products developed by Carson Wu, including those from subsidiaries and affiliates. By using these products, you agree to these terms. If you disagree, please refrain from using them.\n\nI reserve the right to modify these Terms of Use at my discretion. Continued use of these products after any changes signifies acceptance of the revised terms. By complying with these Terms of Use, you are granted a limited right to access and use the products.'**
  String get touaDescribe1;

  /// No description provided for @touaDescribeTitle1.
  ///
  /// In en, this message translates to:
  /// **'Content'**
  String get touaDescribeTitle1;

  /// No description provided for @touaDescribe2.
  ///
  /// In en, this message translates to:
  /// **'All elements within our products—including text, images, interfaces, photographs, trademarks, logos, code, and more (collectively referred to as \"Content\")—are owned, controlled, or licensed by me and are protected by intellectual property laws. Without my explicit written consent, no part of the products or Content may be copied, distributed, or used for commercial purposes.\n\nSpecific information provided within the products may be used for personal, non-commercial purposes, subject to the following conditions outlined in the Terms of Use:\n\n1. The Content must not be modified in any way.\n\n2. Any use of the Content must retain all proprietary notices, copyright, and other relevant labels and markings.\n\n3. The use must not imply any association with me or any endorsement of products or services by me, unless explicitly authorized.\n\n4. The Content must not be exploited in a manner that competes with my interests or those of my subsidiaries and affiliates.'**
  String get touaDescribe2;

  /// No description provided for @touaDescribeTitle2.
  ///
  /// In en, this message translates to:
  /// **'Your Use of Our Products'**
  String get touaDescribeTitle2;

  /// No description provided for @touaDescribe3.
  ///
  /// In en, this message translates to:
  /// **'Unauthorized access to any part of our products, systems, or networks is strictly prohibited. You must not attempt to breach security measures, circumvent authentication procedures, or interfere with the proper operation of our products. This includes, but is not limited to:\n\n1. Access Restrictions: You may not attempt to gain unauthorized access to any part of our products, including the underlying systems or networks.\n\n2. Security Breaches: Any attempt to breach security or authentication measures, including, but not limited to, hacking, phishing, or password mining, is prohibited.\n\n3. Interference: You must not interfere with or disrupt the normal functioning of our products. This includes deploying viruses, malware, or any other harmful software.\n\n4. Excessive Load: Actions that impose an unreasonable or disproportionately large load on our systems, such as automated data scraping, denial of service attacks, or any similar activities, are not allowed.\n\nBy using our products, you agree to comply with these terms to ensure a safe and functional environment for all users.'**
  String get touaDescribe3;

  /// No description provided for @touaDescribeTitle3.
  ///
  /// In en, this message translates to:
  /// **'Purchase; Additional Terms'**
  String get touaDescribeTitle3;

  /// No description provided for @touaDescribe4.
  ///
  /// In en, this message translates to:
  /// **'Additional terms may apply to the purchase of products or services, and these terms are incorporated into these Terms of Use. These specific terms will be provided at the time of purchase and should be reviewed carefully.\n\nIn the event of any conflict between these Terms of Use and the specific terms related to a particular product or service, the specific product-related terms will take precedence.\n\nPayment and Billing: All purchases must be made using the payment methods specified at the time of purchase. You are responsible for providing accurate billing information and ensuring timely payment.\n\nRefunds and Returns: Any requests for refunds or returns will be governed by the specific refund and return policies applicable to the product or service purchased. These policies will be made available at the time of purchase.\n\nSubscription Services: If the product or service involves a subscription, additional terms related to the subscription duration, renewal, and cancellation will apply. It is important to review these terms before subscribing.\n\nPromotional Offers: Promotional offers may have additional terms and conditions. These will be clearly outlined and must be adhered to when taking advantage of such offers.'**
  String get touaDescribe4;

  /// No description provided for @touaDescribeTitle4.
  ///
  /// In en, this message translates to:
  /// **'Accounts, Passwords, and Security'**
  String get touaDescribeTitle4;

  /// No description provided for @touaDescribe5.
  ///
  /// In en, this message translates to:
  /// **'Some services we offer require you to create an account. You are solely responsible for maintaining the confidentiality of your account information, including your username and password. Here are the key points:\n\n1. Account Creation: When creating an account, you must provide accurate and complete information. You agree to update this information promptly if there are any changes.\n\n2. Account Security: You are responsible for maintaining the confidentiality of your account details and for all activities that occur under your account. This includes safeguarding your password and restricting access to your account.\n\n3. Unauthorized Access: If you become aware of any unauthorized use of your account or any other security breach, you must notify us immediately. We recommend regularly updating your password and using robust security practices to protect your account.\n\n4. Responsibility for Activities: You are responsible for any actions taken under your account, whether or not authorized by you. This includes any content posted or transactions made through your account.\n\nEnsuring account security helps protect your personal information and the integrity of our services.'**
  String get touaDescribe5;

  /// No description provided for @touaDescribeTitle5.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get touaDescribeTitle5;

  /// No description provided for @touaDescribe6.
  ///
  /// In en, this message translates to:
  /// **'Your privacy is critically important to us. Our Privacy Policy is an integral part of these Terms of Use, governing how we collect, use, and protect your personal information. Here are some key points:\n\n1. Data Collection: We collect personal information to provide and improve our products and services. This may include details such as your name, email address, and usage patterns.\n\n2. Data Use: We use the collected information to personalize your experience, communicate with you, and enhance our offerings. We may also use your data for security purposes and to comply with legal obligations.\n\n3. Data Protection: We implement industry-standard security measures to protect your personal information. However, you acknowledge that Internet transmissions are not entirely secure, and we cannot guarantee absolute security.\n\n4. Data Sharing: We do not sell your personal information. We may share your data with trusted third parties who assist us in operating our services, provided they agree to keep your information confidential and secure.\n\n5. User Rights: You have the right to access, update, or delete your personal information. If you have any concerns about your privacy, you can contact us for assistance.\n\nBy using our products, you agree to the terms outlined in our Privacy Policy. For a detailed understanding, please review the full Privacy Policy.'**
  String get touaDescribe6;

  /// No description provided for @touaDescribeTitle6.
  ///
  /// In en, this message translates to:
  /// **'Disclaimer'**
  String get touaDescribeTitle6;

  /// No description provided for @touaDescribe7.
  ///
  /// In en, this message translates to:
  /// **'Our products are provided on an \"as is\" and \"as available\" basis, without any warranties of any kind, either express or implied. We do not guarantee that the products will be error-free or uninterrupted. Your use of our products is at your own risk.\n\n1. Service Quality: We do not warrant that our products will meet your specific requirements, be accurate, reliable, or free from defects. Any errors or omissions in the products will be corrected at our discretion.\n\n2. Liability Limitation: We are not liable for any direct, indirect, incidental, consequential, or punitive damages arising from your use of our products. This includes, but is not limited to, damages for loss of profits, data, or other intangible losses.\n\n3. Third-Party Actions: We are not responsible for any actions or content provided by third parties in connection with your use of our products. This includes any interactions or transactions you have with third parties.\n\n4. External Links: Our products may contain links to external websites or services that are not operated by us. We do not have control over these sites and are not responsible for their content or practices.\n\n5. Legal Compliance: You are responsible for complying with all applicable local, state, and federal laws when using our products.\n\nBy using our products, you agree to this disclaimer and assume full responsibility for any risks associated with their use.'**
  String get touaDescribe7;

  /// No description provided for @touaDescribeTitle7.
  ///
  /// In en, this message translates to:
  /// **'Limitation of Liability'**
  String get touaDescribeTitle7;

  /// No description provided for @touaDescribe8.
  ///
  /// In en, this message translates to:
  /// **'Except as prohibited by law, we shall not be liable for indirect, consequential, or incidental damages. Our liability is limited to the total fees paid in the previous six months or \$100.00, whichever is greater.'**
  String get touaDescribe8;

  /// No description provided for @touaDescribeTitle8.
  ///
  /// In en, this message translates to:
  /// **'Modification and Termination of Services'**
  String get touaDescribeTitle8;

  /// No description provided for @touaDescribe9.
  ///
  /// In en, this message translates to:
  /// **'We reserve the right to modify, suspend, or terminate product operations at any time without prior notice.'**
  String get touaDescribe9;

  /// No description provided for @touaDescribeTitle9.
  ///
  /// In en, this message translates to:
  /// **'Changes to Terms'**
  String get touaDescribeTitle9;

  /// No description provided for @touaDescribe10.
  ///
  /// In en, this message translates to:
  /// **'These terms are subject to change at our discretion. Any revisions are effective immediately upon posting.'**
  String get touaDescribe10;

  /// No description provided for @touaDescribeTitle10.
  ///
  /// In en, this message translates to:
  /// **'Detailed Terms and Conditions'**
  String get touaDescribeTitle10;

  /// No description provided for @touaDescribe11.
  ///
  /// In en, this message translates to:
  /// **'1. Scope of Liability\n\n  - We are not responsible for indirect, consequential, or incidental damages, including but not limited to lost profits, loss of data, or business interruption.\n\n  - Our total liability is capped at the greater of the total fees paid by the user in the previous six months or \$100.00.\n\n2. Service Changes\n\n  - We reserve the right to modify, suspend, or terminate the service at any time without prior notice.\n\n  - Such changes may be due to upgrades, maintenance, or unforeseen circumstances.\n\n3. Amendments\n\n  - The terms of service can be revised at our discretion.\n\n  - Any changes are effective immediately upon being posted on our website.\n\n  - Users are encouraged to review the terms regularly to stay informed of any updates.\n\n4. Legal Compliance\n\n  - These terms comply with applicable laws and regulations.\n\n  - Any provision deemed invalid or unenforceable will be adjusted to reflect the parties\' intention, while the remaining provisions will remain in full force.'**
  String get touaDescribe11;

  /// No description provided for @touaDescribeTitle11.
  ///
  /// In en, this message translates to:
  /// **'Indemnification'**
  String get touaDescribeTitle11;

  /// No description provided for @touaDescribe12.
  ///
  /// In en, this message translates to:
  /// **'By using our products, you agree to indemnify and hold harmless me, my officers, directors, shareholders, predecessors, successors in interest, employees, agents, subsidiaries, and affiliates from any losses, liabilities, claims, expenses (including attorneys\' fees), or requests made by third parties arising from or related to your use of our products.'**
  String get touaDescribe12;

  /// No description provided for @touaDescribeTitle12.
  ///
  /// In en, this message translates to:
  /// **'Detailed Indemnification Terms'**
  String get touaDescribeTitle12;

  /// No description provided for @touaDescribe13.
  ///
  /// In en, this message translates to:
  /// **'1. Scope of Indemnification\n\n  - You agree to indemnify and hold us harmless from any losses, liabilities, claims, expenses (including attorneys\' fees), or requests made by third parties.\n\n  - This includes any claims arising from or related to your use of our products, any breach of these terms, or any violation of any law or rights of a third party.\n\n2. Extent of Liability\n\n  - This indemnification obligation extends to all officers, directors, shareholders, predecessors, successors in interest, employees, agents, subsidiaries, and affiliates.\n\n  - We are not responsible for any indirect, special, consequential, or punitive damages.\n\n3. Defense and Settlement\n\n  - You agree to cooperate fully with us in the defense of any claim that is the subject of your indemnification obligations.\n\n  - We reserve the right to assume the exclusive defense and control of any matter subject to indemnification by you, at your expense.\n\n  - You agree not to settle any such matter without our prior written consent.\n\n4. Notification of Claims\n\n  - You must promptly notify us of any claims, actions, or proceedings that may be subject to this indemnification.\n\n  - Failure to provide timely notice does not relieve you of your indemnification obligations except to the extent that it prejudices our ability to defend the claim.'**
  String get touaDescribe13;

  /// No description provided for @touaDescribeTitle13.
  ///
  /// In en, this message translates to:
  /// **'Violation of Terms of Use'**
  String get touaDescribeTitle13;

  /// No description provided for @touaDescribe14.
  ///
  /// In en, this message translates to:
  /// **'If there are any suspicions or complaints regarding your use of our products that may potentially harm or infringe upon our rights/property or the rights/property of other users, we reserve the right to disclose any information about you as required by law or deemed necessary. This disclosure may occur to comply with legal processes, regulations, or governmental requests. We may also disclose your information to prevent fraud or protect the rights, property, or safety of ourselves, our employees, users, visitors, or the public.'**
  String get touaDescribe14;

  /// No description provided for @touaDescribeTitle14.
  ///
  /// In en, this message translates to:
  /// **'Detailed Terms for Violation of Terms of Use'**
  String get touaDescribeTitle14;

  /// No description provided for @touaDescribe15.
  ///
  /// In en, this message translates to:
  /// **'1. Suspicion or Complaint Handling\n\n  - We reserve the right to investigate any suspicions or complaints regarding your use of our products.\n\n  - If your actions are found to potentially harm or infringe upon our rights or the rights of other users, we may take necessary actions to address the situation.\n\n2. Disclosure of Information\n\n  - We may disclose any information about you if required by law or deemed necessary to comply with legal processes, regulations, or governmental requests.\n\n  - Information disclosure may occur to prevent fraud or to protect our rights, property, or safety, as well as those of our employees, users, visitors, or the public.\n\n3. Retention and Disclosure of Communications\n\n  - We may retain any communications you have with us through our products and disclose such information if necessary for legal compliance or enforcement of these Terms of Use.\n\n  - Retained information may also be used to respond to claims of rights infringement or to safeguard our rights, property, or safety, as well as those of our employees, users, or the public.\n\n4. Termination of Access\n\n  - If we suspect a violation of these Terms of Use, we may, at our discretion, terminate your access to our products without prior notice.\n\n  - Reasons for termination may include, but are not limited to, requests from legal authorities or government agencies, account deletion upon your request, termination or significant modification of our products or services, or unexpected technical issues.\n\n  - Any violation of these Terms of Use will be considered an unfair business practice, and we may seek appropriate remedies beyond monetary damages. This indemnity is supplementary to any other remedies available to us under law or equity.\n\n5. Reimbursement of Legal Costs\n\n  - If legal action is taken against you for violating these Terms of Use, you agree to reimburse all reasonable attorneys\' fees and litigation costs in addition to any other legal remedies available to us.\n\n  - We shall not be liable to you or any third party for terminating your access to our products due to violations of these Terms of Use.'**
  String get touaDescribe15;

  /// No description provided for @touaDescribeTitle15.
  ///
  /// In en, this message translates to:
  /// **'Governing Law; Dispute Resolution'**
  String get touaDescribeTitle15;

  /// No description provided for @touaDescribe16.
  ///
  /// In en, this message translates to:
  /// **'All matters related to your use of our products, including any disputes, shall be governed by the local laws applicable to our operations, without regard to its conflict of law provisions.'**
  String get touaDescribe16;

  /// No description provided for @touaDescribeTitle16.
  ///
  /// In en, this message translates to:
  /// **'Detailed Governing Law and Dispute Resolution Terms'**
  String get touaDescribeTitle16;

  /// No description provided for @touaDescribe17.
  ///
  /// In en, this message translates to:
  /// **'1. Jurisdiction and Venue\n\n  - You consent to the exclusive jurisdiction of the local courts and waive any objections to such jurisdiction or venue, including any claims of inconvenient forum.\n\n  - If you are an EU consumer, you may file claims in your country/region of residence.\n\n2. Claim Filing Period\n\n  - Any claims under these Terms of Use must be filed within one year after the cause of action arises. This limitation applies regardless of any contrary statute of limitations under applicable law.\n\n  - For claims arising under separate purchase terms or agreements, the filing period may be different as specified in those terms.\n\n3. Recovery of Costs and Attorneys\' Fees\n\n  - The prevailing party in any legal action or proceeding to enforce these Terms of Use shall be entitled to recover costs and attorneys\' fees, in addition to any other relief to which they may be entitled.\n\n4. Good Faith Effort to Resolve Disputes\n\n  - In case of any disputes, both parties agree to attempt to resolve the matter in good faith through informal negotiations.\n\n  - If a resolution cannot be reached within a reasonable time, either party may seek mediation as a means to settle the dispute before pursuing other legal remedies.\n\n5. Mediation\n\n  - Both parties agree to engage in mediation conducted by a neutral third party. The mediator\'s fees and any administrative costs will be shared equally by both parties, unless otherwise agreed.\n\n  - Mediation shall take place in a mutually agreed-upon location or may be conducted virtually if both parties consent.'**
  String get touaDescribe17;

  /// No description provided for @touaDescribeTitle17.
  ///
  /// In en, this message translates to:
  /// **'Void where Prohibited'**
  String get touaDescribeTitle17;

  /// No description provided for @touaDescribe18.
  ///
  /// In en, this message translates to:
  /// **'While our products are accessible globally, not all features, products, or services may be available to all users due to legal restrictions. We reserve the right to limit availability based on geographic areas. Any offerings are void where prohibited. If you use our products outside your jurisdiction, you are responsible for compliance with local laws.'**
  String get touaDescribe18;

  /// No description provided for @touaDescribeTitle18.
  ///
  /// In en, this message translates to:
  /// **'Detailed Terms for Void where Prohibited'**
  String get touaDescribeTitle18;

  /// No description provided for @touaDescribe19.
  ///
  /// In en, this message translates to:
  /// **'1. Global Accessibility\n\n  - Our products and services are designed to be accessible worldwide, offering a wide range of features to users in various regions.\n\n  - However, due to differing legal and regulatory frameworks, not all features or services may be available to every user, depending on their geographic location.\n\n2. Geographic Limitations\n\n  - We reserve the right to limit the availability of our products, features, or services based on geographic areas.\n\n  - These limitations may be imposed due to local laws, regulations, or other restrictions that prevent us from offering certain products or services in specific regions.\n\n3. User Responsibility\n\n  - If you choose to use our products outside your jurisdiction, it is your responsibility to ensure compliance with all local laws and regulations.\n\n  - You agree to not use our products in any manner that would violate local laws, regulations, or customs.\n\n4. Void Where Prohibited\n\n  - Any offerings, features, or services provided by us are void where prohibited by law.\n\n  - Users are required to adhere to any legal restrictions in their jurisdiction that may affect their use of our products.\n\n5. Changes to Availability\n\n  - We reserve the right to modify, limit, or terminate the availability of our products, features, or services in any geographic area without prior notice.\n\n  - These changes may be made to comply with legal requirements, enhance user experience, or address operational challenges.'**
  String get touaDescribe19;

  /// No description provided for @touaDescribeTitle19.
  ///
  /// In en, this message translates to:
  /// **'Other Provisions'**
  String get touaDescribeTitle19;

  /// No description provided for @touaDescribe20.
  ///
  /// In en, this message translates to:
  /// **'1. Compliance with Laws\n\n  - You agree not to use our products in violation of any applicable laws, including but not limited to export regulations and trade laws.\n\n  - Any usage that contravenes local, national, or international laws is strictly prohibited.\n\n2. Severability\n\n  - If any provision of these Terms of Use is found to be invalid or unenforceable, such provision shall be limited to the minimum extent necessary so that the remaining provisions of these Terms of Use will continue in full force and effect.\n\n3. Superseding Prior Agreements\n\n  - These Terms of Use constitute the entire agreement between you and us regarding the use of our products and supersede all prior agreements and understandings, whether written or oral, regarding such subject matter.\n\n4. Rejection of Counter-Offers\n\n  - We reserve the right to reject any counter-offers or proposed amendments to these Terms of Use, and any such proposals will not be binding unless expressly agreed to in writing by us.\n\n5. No Waiver\n\n  - Our failure to enforce any provision of these Terms of Use shall not be deemed a waiver of such provision or of the right to enforce it at a later time.\n\n6. No Third-Party Rights\n\n  - These Terms of Use do not confer any rights or remedies on any third parties.\n\n7. Changes to Information\n\n  - Information about our products may change without notice. We reserve the right to make updates or modifications at any time.\n\n8. Non-Confidential Opinions\n\n  - Any opinions or feedback you provide to us are considered non-confidential and may be used by us without any obligation to you.\n\n9. Contact Information\n\n - For any inquiries or concerns, please reach out to Carson Wu through the provided contact methods\n\n10. Content Updates\n\n  - The content provided in our products is subject to updates and revisions without prior notice.'**
  String get touaDescribe20;

  /// No description provided for @touaDescribe21.
  ///
  /// In en, this message translates to:
  /// **'Last Updated by Carson Wu on November 2, 2024\n\nBy continuing to use our products, you agree to these detailed terms and conditions. If you have any questions or concerns, please contact our support team for further assistance:'**
  String get touaDescribe21;

  /// No description provided for @privacypolicyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacypolicyTitle;

  /// No description provided for @privacypolicyDescribe1.
  ///
  /// In en, this message translates to:
  /// **'This Privacy Policy describes our policies and procedures regarding the collection, use, and sharing of your personal information. This includes details on how we handle the information you provide to us, how it is utilized, and the protective measures we implement.'**
  String get privacypolicyDescribe1;

  /// No description provided for @privacypolicyDescribeTitle1.
  ///
  /// In en, this message translates to:
  /// **'1. Privacy as a Fundamental Right'**
  String get privacypolicyDescribeTitle1;

  /// No description provided for @privacypolicyDescribe2.
  ///
  /// In en, this message translates to:
  /// **'Privacy is not just a feature but a fundamental human right that we deeply respect and value. It serves as the cornerstone of our products and services, reflecting our unwavering commitment to safeguarding your privacy.'**
  String get privacypolicyDescribe2;

  /// No description provided for @privacypolicyDescribeTitle2.
  ///
  /// In en, this message translates to:
  /// **'2. Innovative Privacy Protection Measures'**
  String get privacypolicyDescribeTitle2;

  /// No description provided for @privacypolicyDescribe3.
  ///
  /// In en, this message translates to:
  /// **'In our pursuit of privacy excellence, we have integrated cutting-edge privacy protection technologies and methodologies into our products and features. These measures are meticulously designed to restrict access to your data by both us and any unauthorized entities. Our stringent security protocols are implemented to thwart any unauthorized attempts to access your device.'**
  String get privacypolicyDescribe3;

  /// No description provided for @privacypolicyDescribeTitle3.
  ///
  /// In en, this message translates to:
  /// **'3. Comprehensive Privacy Safeguards'**
  String get privacypolicyDescribeTitle3;

  /// No description provided for @privacypolicyDescribe4.
  ///
  /// In en, this message translates to:
  /// **'  - Data Encryption: Your data is encrypted to a degree where even we are unable to access it, ensuring that your information remains secure and confidential.\n\n  - On-Device Processing: All operations are conducted locally on your device, eliminating the necessity to transmit data to external servers. This approach enables us to deliver advanced features without compromising the security of your information.\n\n  - Machine Learning Model: Our machine learning model is engineered to learn offline directly on your device whenever possible. Searches and requests are linked to a random alphanumeric identifier rather than your personal identification, bolstering the confidentiality of your data.\n\n  - Device-Centric Recommendations: When leveraging our machine learning model for searches or recommendations, your personal data remains stored solely on your device and is not transmitted to our servers, ensuring that your information stays under your control.\n\n  - Privacy in Voice Requests: Audio requests made to our machine learning model are exclusively processed on your device unless you explicitly opt to share them. Our neural network-powered speech recognition model matches the performance capabilities of server-based recognition while upholding your privacy.\n\nThese meticulous privacy measures underscore our unwavering commitment to preserving the privacy and security of your data throughout your interaction with our products and services.'**
  String get privacypolicyDescribe4;

  /// No description provided for @privacypolicyDescribeTitle4.
  ///
  /// In en, this message translates to:
  /// **'4. Entertainment Services and Personalization'**
  String get privacypolicyDescribeTitle4;

  /// No description provided for @privacypolicyDescribe5.
  ///
  /// In en, this message translates to:
  /// **'Our entertainment services are meticulously crafted to tailor your experience based on the content you engage with. However, it\'s important to note that we do not construct exhaustive profiles about you by amalgamating your activities across various services. Your privacy and individuality are paramount to us, and we ensure that our personalization efforts are respectful of your boundaries.'**
  String get privacypolicyDescribe5;

  /// No description provided for @privacypolicyDescribeTitle5.
  ///
  /// In en, this message translates to:
  /// **'5. Information Collection Practices'**
  String get privacypolicyDescribeTitle5;

  /// No description provided for @privacypolicyDescribe6.
  ///
  /// In en, this message translates to:
  /// **'In the course of your interactions with us, we may collect a spectrum of information to better serve you. This data could encompass details such as your name, email address, contact information, and any other pertinent information shared with us during your engagement with our services.'**
  String get privacypolicyDescribe6;

  /// No description provided for @privacypolicyDescribeTitle6.
  ///
  /// In en, this message translates to:
  /// **'6. Utilization of Collected Information'**
  String get privacypolicyDescribeTitle6;

  /// No description provided for @privacypolicyDescribe7.
  ///
  /// In en, this message translates to:
  /// **'The information we gather from you serves as a foundational element in enhancing and optimizing our services to cater to your needs effectively. Here\'s how we leverage the collected information:\n\n  - Enhancing Service Delivery: The data collected enables us to deliver services that are tailored to your preferences and requirements, ensuring a more personalized and enriching experience.\n\n  - Communication Channels: Your information may be used for communication purposes, allowing us to keep you informed about updates, promotions, and other relevant information that enhances your interaction with our services.\n\n  - Customer Support: Your details aid us in providing efficient customer support, enabling us to address any queries, issues, or concerns you may have promptly and effectively.\n\n  - Research and Analysis: We engage in continuous research and analysis of the data gathered to gain insights that drive innovation and improvement in our products and services. This analytical approach allows us to refine our offerings, ensuring they align with your evolving preferences and expectations.'**
  String get privacypolicyDescribe7;

  /// No description provided for @privacypolicyDescribeTitle7.
  ///
  /// In en, this message translates to:
  /// **'7. Information Sharing Practices'**
  String get privacypolicyDescribeTitle7;

  /// No description provided for @privacypolicyDescribe8.
  ///
  /// In en, this message translates to:
  /// **'At the core of our privacy commitment, we uphold a strict policy of not engaging in the sale, trade, or transfer of your personal information to third parties. Your information is only shared with trusted partners when deemed essential to provide the requested services, ensuring that your data remains confidential and protected.'**
  String get privacypolicyDescribe8;

  /// No description provided for @privacypolicyDescribeTitle8.
  ///
  /// In en, this message translates to:
  /// **'8. Data Security and Protection Measures'**
  String get privacypolicyDescribeTitle8;

  /// No description provided for @privacypolicyDescribe9.
  ///
  /// In en, this message translates to:
  /// **'The security of your personal information is paramount to us. While we implement stringent measures to safeguard the data you entrust to us, it is crucial to acknowledge that internet transmissions are not entirely immune to vulnerabilities. We continuously strive to fortify our data protection protocols to uphold the integrity and confidentiality of your information.'**
  String get privacypolicyDescribe9;

  /// No description provided for @privacypolicyDescribeTitle9.
  ///
  /// In en, this message translates to:
  /// **'9. Data Retention Guidelines'**
  String get privacypolicyDescribeTitle9;

  /// No description provided for @privacypolicyDescribe10.
  ///
  /// In en, this message translates to:
  /// **'Your personal data is retained for a defined period as per our data retention policies. Upon the expiration of this specified timeframe, we are committed to securely deleting or anonymizing your data in accordance with the established retention guidelines. This practice ensures that your information is managed responsibly and in compliance with regulatory requirements.'**
  String get privacypolicyDescribe10;

  /// No description provided for @privacypolicyDescribeTitle10.
  ///
  /// In en, this message translates to:
  /// **'10. User Rights and Privacy Control'**
  String get privacypolicyDescribeTitle10;

  /// No description provided for @privacypolicyDescribe11.
  ///
  /// In en, this message translates to:
  /// **'As a user, you possess certain fundamental rights concerning the management of your personal data. These rights include:\n\n  - Access: You have the right to access the personal data we hold about you. This enables you to review the information we have collected and verify its accuracy.\n\n  - Correction: You have the authority to rectify any inaccuracies or incomplete details in your personal data. This ensures that the information we retain is up-to-date and accurate.\n\n  - Deletion: You can request the deletion of your personal data from our records. Upon your request, we will securely remove your information, subject to any legal obligations or legitimate interests that necessitate data retention.\n\nTo exercise these rights or seek further clarification on our data handling practices, please refer to the provided instructions on our platform or contact our dedicated support team. Your privacy and data management preferences are of utmost importance to us, and we are committed to empowering you with the necessary control over your personal information.'**
  String get privacypolicyDescribe11;

  /// No description provided for @privacypolicyDescribeTitle11.
  ///
  /// In en, this message translates to:
  /// **'11. Third-Party Service Usage:'**
  String get privacypolicyDescribeTitle11;

  /// No description provided for @privacypolicyDescribe12.
  ///
  /// In en, this message translates to:
  /// **'Explicitly list all third-party services used in the documentation, including the following detailed information:\n\n  - Service Names and Purposes: Provide the specific names of each third-party service along with a detailed explanation of their purposes within the system.\n\n  - Data Handling Practices: Describe in detail how each third-party service handles user data, including data collection methods, storage practices, data usage, and sharing protocols.\n\n  - Privacy Policy Links: Ensure that direct links to the privacy policy pages of each third-party service are included for easy access by users.'**
  String get privacypolicyDescribe12;

  /// No description provided for @privacypolicyDescribeTitle12.
  ///
  /// In en, this message translates to:
  /// **'12. Data Transfer Details:'**
  String get privacypolicyDescribeTitle12;

  /// No description provided for @privacypolicyDescribe13.
  ///
  /// In en, this message translates to:
  /// **'Enhance transparency by providing comprehensive information on data transfer practices:\n\n  - Transfer Mechanisms: Explain the specific mechanisms and protocols used for transferring data between different systems, both internally and externally.\n\n  - Storage Practices: Detail the precise locations where data is stored, the methods used for storage, the retention periods, and the security measures in place to protect stored data.\n\n  - Security Measures: Outline the security measures implemented during data transmission, such as encryption standards, access controls, and monitoring systems.'**
  String get privacypolicyDescribe13;

  /// No description provided for @privacypolicyDescribeTitle13.
  ///
  /// In en, this message translates to:
  /// **'13. Children\'s Privacy Protection:'**
  String get privacypolicyDescribeTitle13;

  /// No description provided for @privacypolicyDescribe14.
  ///
  /// In en, this message translates to:
  /// **'Implement robust measures to safeguard children\'s privacy if services involve child users:\n\n  - Special Policies: Develop and clearly outline policies specifically designed to protect children\'s privacy rights and ensure compliance with relevant regulations.\n\n  - Parental Consent: Establish procedures to obtain explicit parental consent before collecting any data from children, including information on how parents can review or revoke consent.\n\n  - Privacy Protection Measures: Implement stringent privacy protection measures such as pseudonymization, age-appropriate content filtering, and limited data collection to protect children\'s privacy.'**
  String get privacypolicyDescribe14;

  /// No description provided for @privacypolicyDescribeTitle14.
  ///
  /// In en, this message translates to:
  /// **'14. Regulatory Information:'**
  String get privacypolicyDescribeTitle14;

  /// No description provided for @privacypolicyDescribe15.
  ///
  /// In en, this message translates to:
  /// **'Provide detailed regulatory information and contact details for effective user recourse:\n\n  - Regulatory Agency Contact Information: Include specific contact details for relevant regulatory agencies, including names, addresses, phone numbers, and email addresses.\n\n  - Reporting Channels: Clearly outline the procedures for users to report privacy concerns or data breaches, including any online reporting forms or hotlines available.\n\n  - Legal Compliance: Specify the legal frameworks and regulations that the services adhere to, along with information on how users can verify compliance and seek assistance from regulatory authorities.\n\nFor further assistance or inquiries regarding these aspects, it is recommended to reach out to Carson Wu through the provided contact methods:'**
  String get privacypolicyDescribe15;

  /// No description provided for @privacypolicyDescribe16.
  ///
  /// In en, this message translates to:
  /// **'Last Updated by Carson Wu on November 2, 2024'**
  String get privacypolicyDescribe16;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}

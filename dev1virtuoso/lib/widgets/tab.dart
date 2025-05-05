import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dev1virtuoso/widgets/data_table.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:dev1virtuoso/widgets/utility_container.dart';

// About
class AboutTabBar extends StatelessWidget {
  const AboutTabBar({Key? key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    var theme = Theme.of(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: _getTabTitle(0, t)),
              Tab(text: _getTabTitle(1, t)),
              Tab(text: _getTabTitle(2, t)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    t.aboutTitle,
                    style: theme.textTheme.titleMedium,
                  ),
                  Text(t.carsonWuAboutMe),
                  SizedBox(height: 20),
                  Text(
                    t.personalInfoTitle,
                    style: theme.textTheme.titleSmall,
                  ),
                  PersonalInfoTable(),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    t.contactTitle,
                    style: theme.textTheme.titleMedium,
                  ),
                  ContactTable(),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    t.donateTitle,
                    style: theme.textTheme.titleMedium,
                  ),
                  DonateTable(),
                  Text(
                    t.donateTitle1,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.donateDescribe1),
                  Text(
                    t.donateDescribeTitle1,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.donateDescribe2),
                  Text(
                    t.donateDescribeTitle2,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.donateDescribe3),
                  Text(
                    t.donateDescribeTitle3,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.donateDescribe4),
                  Text(
                    t.donateDescribeTitle4,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.donateDescribe5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getTabTitle(int index, AppLocalizations t) {
    switch (index) {
      case 0:
        return t.aboutTitle;
      case 1:
        return t.contactTitle;
      case 2:
        return t.donateTitle;
      default:
        return '';
    }
  }
}

// Account
class AccountTabBar extends StatelessWidget {
  const AccountTabBar({Key? key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    var theme = Theme.of(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: _getTabTitle(0, t)),
              Tab(text: _getTabTitle(1, t)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getTabTitle(int index, AppLocalizations t) {
    switch (index) {
      case 0:
        return t.signUpTitle;
      case 1:
        return t.signInTitle;
      default:
        return '';
    }
  }
}

// Arcade
class ArcadeTabBar extends StatelessWidget {
  const ArcadeTabBar({Key? key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    var theme = Theme.of(context);

    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: _getTabTitle(0, t)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getTabTitle(int index, AppLocalizations t) {
    switch (index) {
      case 0:
        return t.companyLicenseTitle;
      default:
        return '';
    }
  }
}

// Support
class SupportTabBar extends StatelessWidget {
  const SupportTabBar({Key? key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    var appVersion = 'v0.0.4.4(047)(0044_047-050525a)';

    final TapGestureRecognizer _tapRecognizer = TapGestureRecognizer();

    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: _getTabTitle(0, t)),
              Tab(text: _getTabTitle(1, t)),
              Tab(text: _getTabTitle(2, t)),
              Tab(text: _getTabTitle(3, t)),
              Tab(text: _getTabTitle(4, t)),
              Tab(text: _getTabTitle(5, t)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    t.companyLicenseTitle,
                    style: theme.textTheme.titleMedium,
                  ),
                  Text(t.companyLicense),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    t.copyrightNoticeTitle,
                    style: theme.textTheme.titleMedium,
                  ),
                  Text(t.copyrightNotice),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    t.touaTitle,
                    style: theme.textTheme.titleMedium,
                  ),
                  Text(t.touaDescribe1),
                  Text(
                    t.touaDescribeTitle1,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.touaDescribe2),
                  Text(
                    t.touaDescribeTitle2,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.touaDescribe3),
                  Text(
                    t.touaDescribeTitle3,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.touaDescribe4),
                  Text(
                    t.touaDescribeTitle4,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.touaDescribe5),
                  Text(
                    t.touaDescribeTitle5,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: t.touaDescribe6,
                        ),
                        TextSpan(
                          text:
                              "https://github.com/dev1virtuoso/Documentation/blob/main/dev1virtuoso/Attachment/dev1virtuoso/carson-wu.md",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: _tapRecognizer
                            ..onTap = () {
                              launch(
                                  "https://github.com/dev1virtuoso/Documentation/blob/main/dev1virtuoso/Attachment/dev1virtuoso/carson-wu.md/");
                            },
                        ),
                      ],
                    ),
                  ),
                  Text(
                    t.touaDescribeTitle6,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.touaDescribe7),
                  Text(
                    t.touaDescribeTitle7,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.touaDescribe8),
                  Text(
                    t.touaDescribeTitle8,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.touaDescribe9),
                  Text(
                    t.touaDescribeTitle9,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.touaDescribe10),
                  Text(
                    t.touaDescribeTitle10,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.touaDescribe11),
                  Text(
                    t.touaDescribeTitle11,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.touaDescribe12),
                  Text(
                    t.touaDescribeTitle12,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.touaDescribe13),
                  Text(
                    t.touaDescribeTitle13,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.touaDescribe14),
                  Text(
                    t.touaDescribeTitle14,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.touaDescribe15),
                  Text(
                    t.touaDescribeTitle15,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.touaDescribe16),
                  Text(
                    t.touaDescribeTitle16,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.touaDescribe17),
                  Text(
                    t.touaDescribeTitle17,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.touaDescribe18),
                  Text(
                    t.touaDescribeTitle18,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.touaDescribe19),
                  Text(
                    t.touaDescribeTitle19,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.touaDescribe20),
                  Text(t.copyrightStatement),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: t.touaDescribe21,
                        ),
                        TextSpan(
                          text:
                              "https://github.com/dev1virtuoso/Documentation/blob/main/dev1virtuoso/Attachment/dev1virtuoso/carson-wu.md",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: _tapRecognizer
                            ..onTap = () {
                              launch(
                                  "https://github.com/dev1virtuoso/Documentation/blob/main/dev1virtuoso/Attachment/dev1virtuoso/carson-wu.md/");
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    t.privacypolicyTitle,
                    style: theme.textTheme.titleMedium,
                  ),
                  Text(t.privacypolicyDescribe1),
                  Text(
                    t.privacypolicyDescribeTitle1,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.privacypolicyDescribe2),
                  Text(
                    t.privacypolicyDescribeTitle2,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.touaDescribe3),
                  Text(
                    t.privacypolicyDescribeTitle3,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.privacypolicyDescribe4),
                  Text(
                    t.privacypolicyDescribeTitle4,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.privacypolicyDescribe5),
                  Text(
                    t.privacypolicyDescribeTitle5,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.privacypolicyDescribe6),
                  Text(
                    t.privacypolicyDescribeTitle6,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.privacypolicyDescribe7),
                  Text(
                    t.privacypolicyDescribeTitle7,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.privacypolicyDescribe8),
                  Text(
                    t.privacypolicyDescribeTitle8,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.privacypolicyDescribe9),
                  Text(
                    t.privacypolicyDescribeTitle9,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.privacypolicyDescribe10),
                  Text(
                    t.privacypolicyDescribeTitle10,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.privacypolicyDescribe11),
                  Text(
                    t.privacypolicyDescribeTitle11,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.privacypolicyDescribe12),
                  Text(
                    t.privacypolicyDescribeTitle12,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.privacypolicyDescribe13),
                  Text(
                    t.privacypolicyDescribeTitle13,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.privacypolicyDescribe14),
                  Text(
                    t.privacypolicyDescribeTitle14,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: t.privacypolicyDescribe15,
                        ),
                        TextSpan(
                          text:
                              "https://github.com/dev1virtuoso/Documentation/blob/main/dev1virtuoso/Attachment/dev1virtuoso/carson-wu.md",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: _tapRecognizer
                            ..onTap = () {
                              launch(
                                  "https://github.com/dev1virtuoso/Documentation/blob/main/dev1virtuoso/Attachment/dev1virtuoso/carson-wu.md/");
                            },
                        ),
                      ],
                    ),
                  ),
                  Text(t.privacypolicyDescribe16),
                  SizedBox(height: 20),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    t.mitLTitle,
                    style: theme.textTheme.titleMedium,
                  ),
                  Text(t.mitLContent),
                  Text(
                    t.mitLAboutTitle,
                    style: theme.textTheme.titleMedium,
                  ),
                  Text(t.mitLAboutContent),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: t.mitLAboutContent,
                        ),
                        TextSpan(
                          text: "https://www.mozilla.org/MPL/",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: _tapRecognizer
                            ..onTap = () {
                              launch("https://www.mozilla.org/MPL/");
                            },
                        ),
                      ],
                    ),
                  ),
                  Text(
                    t.licenceTitle,
                    style: theme.textTheme.titleMedium,
                  ),
                  Text(t.mitlicenceTitle),
                  Text(t.copyrightStatement),
                  Text(t.licence),
                  SizedBox(height: 20),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    t.versionTitle,
                    style: theme.textTheme.titleMedium,
                  ),
                  Text(t.version1Context),
                  Text(
                    t.versionTitle2,
                    style: theme.textTheme.titleSmall,
                  ),
                  Text(t.version2Context),
                  Text(
                    '${t.appVersion}: $appVersion',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getTabTitle(int index, AppLocalizations t) {
    switch (index) {
      case 0:
        return t.companyLicenseTitle;
      case 1:
        return t.copyrightNoticeTitle;
      case 2:
        return t.touaTitle;
      case 3:
        return t.privacypolicyTitle;
      case 4:
        return t.mitLTitle;
      case 5:
        return t.versionTitle;
      default:
        return '';
    }
  }
}

// utility
class utilityTabBar extends StatelessWidget {
  const utilityTabBar({Key? key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    var theme = Theme.of(context);

    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: _getTabTitle(0, t)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    t.utilityTitle,
                    style: theme.textTheme.titleMedium,
                  ),
                  CardDisplay(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getTabTitle(int index, AppLocalizations t) {
    switch (index) {
      case 0:
        return t.pageutilityTitle;
      default:
        return '';
    }
  }
}

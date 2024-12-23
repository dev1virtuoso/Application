import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dev1virtuoso/widgets/paragraph_widget.dart';
import 'package:dev1virtuoso/widgets/data_table.dart';
import 'package:dev1virtuoso/widgets/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:linkable/linkable.dart';

// Support
class SupportTabBar extends StatelessWidget {
  const SupportTabBar({Key? key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    var appVersion = 'v0.0.3.16(034)(00316_034-241224a)';

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
                  ParagraphWidget(t.companyLicense),
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
                  ParagraphWidget(t.copyrightNotice),
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
                  ParagraphWidget(t.touaDescribe1),
                  Text(
                    t.touaDescribeTitle1,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.touaDescribe2),
                  Text(
                    t.touaDescribeTitle2,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.touaDescribe3),
                  Text(
                    t.touaDescribeTitle3,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.touaDescribe4),
                  Text(
                    t.touaDescribeTitle4,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.touaDescribe5),
                  Text(
                    t.touaDescribeTitle5,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.touaDescribe6),
                  Text(
                    t.touaDescribeTitle6,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.touaDescribe7),
                  Text(
                    t.touaDescribeTitle7,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.touaDescribe8),
                  Text(
                    t.touaDescribeTitle8,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.touaDescribe9),
                  Text(
                    t.touaDescribeTitle9,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.touaDescribe10),
                  Text(
                    t.touaDescribeTitle10,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.touaDescribe11),
                  Text(
                    t.touaDescribeTitle11,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.touaDescribe12),
                  Text(
                    t.touaDescribeTitle12,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.touaDescribe13),
                  Text(
                    t.touaDescribeTitle13,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.touaDescribe14),
                  Text(
                    t.touaDescribeTitle14,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.touaDescribe15),
                  Text(
                    t.touaDescribeTitle15,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.touaDescribe16),
                  Text(
                    t.touaDescribeTitle16,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.touaDescribe17),
                  Text(
                    t.touaDescribeTitle17,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.touaDescribe18),
                  Text(
                    t.touaDescribeTitle18,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.touaDescribe19),
                  Text(
                    t.touaDescribeTitle19,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.touaDescribe20),
                  ParagraphWidget(t.copyrightStatement),
                  ParagraphWidget(t.touaDescribe21),
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
                  ParagraphWidget(t.privacypolicyDescribe1),
                  Text(
                    t.privacypolicyDescribeTitle1,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.privacypolicyDescribe2),
                  Text(
                    t.privacypolicyDescribeTitle2,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.touaDescribe3),
                  Text(
                    t.privacypolicyDescribeTitle3,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.privacypolicyDescribe4),
                  Text(
                    t.privacypolicyDescribeTitle4,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.privacypolicyDescribe5),
                  Text(
                    t.privacypolicyDescribeTitle5,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.privacypolicyDescribe6),
                  Text(
                    t.privacypolicyDescribeTitle6,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.privacypolicyDescribe7),
                  Text(
                    t.privacypolicyDescribeTitle7,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.privacypolicyDescribe8),
                  Text(
                    t.privacypolicyDescribeTitle8,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.privacypolicyDescribe9),
                  Text(
                    t.privacypolicyDescribeTitle9,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.privacypolicyDescribe10),
                  Text(
                    t.privacypolicyDescribeTitle10,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.privacypolicyDescribe11),
                  Text(
                    t.privacypolicyDescribeTitle11,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.privacypolicyDescribe12),
                  Text(
                    t.privacypolicyDescribeTitle12,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.privacypolicyDescribe13),
                  Text(
                    t.privacypolicyDescribeTitle13,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.privacypolicyDescribe14),
                  Text(
                    t.privacypolicyDescribeTitle14,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.privacypolicyDescribe15),
                  ParagraphWidget(t.privacypolicyDescribe16),
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
                  ParagraphWidget(t.mitLContent),
                  Text(
                    t.mitLAboutTitle,
                    style: theme.textTheme.titleMedium,
                  ),
                  InkWell(
                    onTap: () {
                      launch('https://www.mozilla.org/MPL/');
                    },
                    child: ParagraphWidget(t.mitLAboutContent),
                  ),
                  Text(
                    t.licenceTitle,
                    style: theme.textTheme.titleMedium,
                  ),
                  ParagraphWidget(t.mitlicenceTitle),
                  ParagraphWidget(t.copyrightStatement),
                  ParagraphWidget(t.licence),
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
                  ParagraphWidget(t.version1Context),
                  Text(
                    t.versionTitle2,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.version2Context),
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
                  ParagraphWidget(t.carsonWuAboutMe),
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
                  ParagraphWidget(t.donateDescribe1),
                  Text(
                    t.donateDescribeTitle1,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.donateDescribe2),
                  Text(
                    t.donateDescribeTitle2,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.donateDescribe3),
                  Text(
                    t.donateDescribeTitle3,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.donateDescribe4),
                  Text(
                    t.donateDescribeTitle4,
                    style: theme.textTheme.titleSmall,
                  ),
                  ParagraphWidget(t.donateDescribe5),
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

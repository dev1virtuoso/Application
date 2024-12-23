import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dev1virtuoso/widgets/paragraph_widget.dart';
import 'package:dev1virtuoso/widgets/data_table.dart';

// Support
class SupportTabBar extends StatelessWidget {
  const SupportTabBar({Key? key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    var appVersion = 'v0.0.3.15(033)(00315_033-231224a)';
    var licence2 = t.copyrightStatement;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: _getTabTitle(0, t)),
              Tab(text: _getTabTitle(1, t)),
              Tab(text: _getTabTitle(2, t)),
              Tab(text: _getTabTitle(3, t)),
              Tab(text: _getTabTitle(4, t)),
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
                    t.mitLTitle,
                    style: theme.textTheme.titleMedium,
                  ),
                  ParagraphWidget(t.mitLContent),
                  Text(
                    t.mitLAboutTitle,
                    style: theme.textTheme.titleMedium,
                  ),
                  ParagraphWidget(t.mitLAboutContent),
                  Text(
                    t.licenceTitle,
                    style: theme.textTheme.titleMedium,
                  ),
                  ParagraphWidget(t.mitlicenceTitle),
                  ParagraphWidget(licence2),
                  ParagraphWidget(t.licence),
                  SizedBox(height: 20),
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
        return t.mitLTitle;
      case 3:
        return t.touaTitle;
      case 4:
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
              Tab(text: _getTabTitle(3, t)),
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

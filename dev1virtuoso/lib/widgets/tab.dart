import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dev1virtuoso/widgets/paragraph_widget.dart';
import 'package:dev1virtuoso/widgets/data_table.dart';

class SupportTabBar extends StatelessWidget {
  const SupportTabBar({Key? key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    var appVersion = 'v0.0.3.13(031)(00313_031-201224a)';
    var licenceTitle = 'MIT License';
    var licence2 = 'Copyright (c) 2023 - present Carson Wu';
    var licence3 =
        'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge,publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:';
    var licence4 =
        'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.';
    var licence5 =
        'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.';

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
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Text(
                  t.companyLicenseTitle,
                  style: theme.textTheme.titleMedium,
                ),
                ParagraphWidget(t.companyLicense1),
                ParagraphWidget(t.companyLicense2),
                ParagraphWidget(t.companyLicense3),
                ParagraphWidget('1. ${t.companyLicense4}'),
                ParagraphWidget('2. ${t.companyLicense5}'),
                ParagraphWidget('3. ${t.companyLicense6}'),
                ParagraphWidget('4. ${t.companyLicense7}'),
                ParagraphWidget('5. ${t.companyLicense8}'),
                ParagraphWidget(t.companyLicense9),
                ParagraphWidget(t.companyLicense10),
                ParagraphWidget(t.companyLicense11),
                // Add more content for Tab 1
              ],
            ),
            Column(
              children: [
                Text(
                  t.copyrightNoticeTitle,
                  style: theme.textTheme.titleMedium,
                ),
                ParagraphWidget('1. ${t.copyrightNotice1}'),
                ParagraphWidget('2. ${t.copyrightNotice2}'),
                ParagraphWidget('3. ${t.copyrightNotice3}'),
                ParagraphWidget('4. ${t.copyrightNotice4}'),
                ParagraphWidget('5. ${t.copyrightNotice5}'),
                ParagraphWidget('6. ${t.copyrightNotice6}'),
                ParagraphWidget('7. ${t.copyrightNotice7}'),
                ParagraphWidget('8. ${t.copyrightNotice8}'),
                ParagraphWidget('9. ${t.copyrightNotice9}'),
                ParagraphWidget('10. ${t.copyrightNotice10}'),
                ParagraphWidget(t.copyrightNoticeContact),
                // Add more content for Tab 2
              ],
            ),
            Column(
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
                ParagraphWidget(t.mitLAboutContent2),
                Text(
                  t.licenceTitle,
                  style: theme.textTheme.titleMedium,
                ),
                ParagraphWidget(licenceTitle),
                ParagraphWidget(licence2),
                ParagraphWidget(licence3),
                ParagraphWidget(licence4),
                ParagraphWidget(licence5),
                SizedBox(height: 20),
              ],
            ),
            Column(
              children: [
                Text(
                  t.versionTitle,
                  style: theme.textTheme.titleMedium,
                ),
                ParagraphWidget('- ${t.version1Context}'),
                ParagraphWidget('- ${t.version2Context}'),
                ParagraphWidget('- ${t.version3Context}'),
                ParagraphWidget('- ${t.version4Context}'),
                ParagraphWidget('- ${t.version5Context}'),
                Text(
                  t.versionTitle2,
                  style: theme.textTheme.titleSmall,
                ),
                ParagraphWidget(t.version6Context),
                ParagraphWidget(t.version7Context),
                ParagraphWidget('- ${t.version8Context}'),
                ParagraphWidget('- ${t.version9Context}'),
                ParagraphWidget('- ${t.version10Context}'),
                ParagraphWidget('- ${t.version11Context}'),
                Text(
                  '${t.appVersion}: $appVersion',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
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
        return t.versionTitle;
      default:
        return '';
    }
  }
}

class AboutTabBar extends StatelessWidget {
  const AboutTabBar({Key? key});

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
            Column(
              children: [
                Text(
                  t.aboutTitle,
                  style: theme.textTheme.titleMedium,
                ),
                ParagraphWidget(t.carsonWuIntroduction),
                ParagraphWidget(t.carsonWuBackground),
                ParagraphWidget(t.carsonWuPassion),
                ParagraphWidget(t.carsonWuSkills),
                ParagraphWidget(t.carsonWuProjects),
                ParagraphWidget(t.carsonWuLearning),
                ParagraphWidget(t.carsonWuFuture),
                ParagraphWidget(t.carsonWuCollaboration),
                SizedBox(height: 20),
              ],
            ),
            Column(
              children: [
                Text(
                  t.personalInfoTitle,
                  style: theme.textTheme.titleMedium,
                ),
                PersonalInfoTable(),
              ],
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
        return t.personalInfoTitle;
      default:
        return '';
    }
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.pageSupportTitle),
      ),
      body: const SupportTabBar(),
    );
  }
}

class SupportTabBar extends StatefulWidget {
  const SupportTabBar({super.key});

  @override
  _SupportTabBarState createState() => _SupportTabBarState();
}

class _SupportTabBarState extends State<SupportTabBar> {
  final List<bool> _isExpanded = List.generate(6, (_) => false);
  final String appVersion = 'v0.0.5.10(058)(00510_058-191025rc)';

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    var theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildExpansionCard(
            context,
            index: 0,
            title: t.companyLicenseTitle,
            isExpanded: _isExpanded[0],
            content: [
              Text(t.companyLicense),
            ],
          ),
          const SizedBox(height: 16),
          _buildExpansionCard(
            context,
            index: 1,
            title: t.copyrightNoticeTitle,
            isExpanded: _isExpanded[1],
            content: [
              Text(t.copyrightNotice),
            ],
          ),
          const SizedBox(height: 16),
          _buildExpansionCard(
            context,
            index: 2,
            title: t.touaTitle,
            isExpanded: _isExpanded[2],
            content: [
              Text(t.touaDescribe1),
              Text(t.touaDescribeTitle1, style: theme.textTheme.titleSmall),
              Text(t.touaDescribe2),
              Text(t.touaDescribeTitle2, style: theme.textTheme.titleSmall),
              Text(t.touaDescribe3),
              Text(t.touaDescribeTitle3, style: theme.textTheme.titleSmall),
              Text(t.touaDescribe4),
              Text(t.touaDescribeTitle4, style: theme.textTheme.titleSmall),
              Text(t.touaDescribe5),
              Text(t.touaDescribeTitle5, style: theme.textTheme.titleSmall),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: t.touaDescribe6),
                    TextSpan(
                      text:
                          "https://github.com/dev1virtuoso/Documentation/blob/main/dev1virtuoso/Attachment/dev1virtuoso/carson-wu.md",
                      style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => _launchUrl(
                            "https://github.com/dev1virtuoso/Documentation/blob/main/dev1virtuoso/Attachment/dev1virtuoso/carson-wu.md"),
                    ),
                  ],
                ),
              ),
              Text(t.touaDescribeTitle6, style: theme.textTheme.titleSmall),
              Text(t.touaDescribe7),
              Text(t.touaDescribeTitle7, style: theme.textTheme.titleSmall),
              Text(t.touaDescribe8),
              Text(t.touaDescribeTitle8, style: theme.textTheme.titleSmall),
              Text(t.touaDescribe9),
              Text(t.touaDescribeTitle9, style: theme.textTheme.titleSmall),
              Text(t.touaDescribe10),
              Text(t.touaDescribeTitle10, style: theme.textTheme.titleSmall),
              Text(t.touaDescribe11),
              Text(t.touaDescribeTitle11, style: theme.textTheme.titleSmall),
              Text(t.touaDescribe12),
              Text(t.touaDescribeTitle12, style: theme.textTheme.titleSmall),
              Text(t.touaDescribe13),
              Text(t.touaDescribeTitle13, style: theme.textTheme.titleSmall),
              Text(t.touaDescribe14),
              Text(t.touaDescribeTitle14, style: theme.textTheme.titleSmall),
              Text(t.touaDescribe15),
              Text(t.touaDescribeTitle15, style: theme.textTheme.titleSmall),
              Text(t.touaDescribe16),
              Text(t.touaDescribeTitle16, style: theme.textTheme.titleSmall),
              Text(t.touaDescribe17),
              Text(t.touaDescribeTitle17, style: theme.textTheme.titleSmall),
              Text(t.touaDescribe18),
              Text(t.touaDescribeTitle18, style: theme.textTheme.titleSmall),
              Text(t.touaDescribe19),
              Text(t.touaDescribeTitle19, style: theme.textTheme.titleSmall),
              Text(t.touaDescribe20),
              Text(t.copyrightStatement),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: t.touaDescribe21),
                    TextSpan(
                      text:
                          "https://github.com/dev1virtuoso/Documentation/blob/main/dev1virtuoso/Attachment/dev1virtuoso/carson-wu.md",
                      style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => _launchUrl(
                            "https://github.com/dev1virtuoso/Documentation/blob/main/dev1virtuoso/Attachment/dev1virtuoso/carson-wu.md"),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildExpansionCard(
            context,
            index: 3,
            title: t.privacypolicyTitle,
            isExpanded: _isExpanded[3],
            content: [
              Text(t.privacypolicyDescribe1),
              Text(t.privacypolicyDescribeTitle1,
                  style: theme.textTheme.titleSmall),
              Text(t.privacypolicyDescribe2),
              Text(t.privacypolicyDescribeTitle2,
                  style: theme.textTheme.titleSmall),
              Text(t.touaDescribe3),
              Text(t.privacypolicyDescribeTitle3,
                  style: theme.textTheme.titleSmall),
              Text(t.privacypolicyDescribe4),
              Text(t.privacypolicyDescribeTitle4,
                  style: theme.textTheme.titleSmall),
              Text(t.privacypolicyDescribe5),
              Text(t.privacypolicyDescribeTitle5,
                  style: theme.textTheme.titleSmall),
              Text(t.privacypolicyDescribe6),
              Text(t.privacypolicyDescribeTitle6,
                  style: theme.textTheme.titleSmall),
              Text(t.privacypolicyDescribe7),
              Text(t.privacypolicyDescribeTitle7,
                  style: theme.textTheme.titleSmall),
              Text(t.privacypolicyDescribe8),
              Text(t.privacypolicyDescribeTitle8,
                  style: theme.textTheme.titleSmall),
              Text(t.privacypolicyDescribe9),
              Text(t.privacypolicyDescribeTitle9,
                  style: theme.textTheme.titleSmall),
              Text(t.privacypolicyDescribe10),
              Text(t.privacypolicyDescribeTitle10,
                  style: theme.textTheme.titleSmall),
              Text(t.privacypolicyDescribe11),
              Text(t.privacypolicyDescribeTitle11,
                  style: theme.textTheme.titleSmall),
              Text(t.privacypolicyDescribe12),
              Text(t.privacypolicyDescribeTitle12,
                  style: theme.textTheme.titleSmall),
              Text(t.privacypolicyDescribe13),
              Text(t.privacypolicyDescribeTitle13,
                  style: theme.textTheme.titleSmall),
              Text(t.privacypolicyDescribe14),
              Text(t.privacypolicyDescribeTitle14,
                  style: theme.textTheme.titleSmall),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: t.privacypolicyDescribe15),
                    TextSpan(
                      text:
                          "https://github.com/dev1virtuoso/Documentation/blob/main/dev1virtuoso/Attachment/dev1virtuoso/carson-wu.md",
                      style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => _launchUrl(
                            "https://github.com/dev1virtuoso/Documentation/blob/main/dev1virtuoso/Attachment/dev1virtuoso/carson-wu.md"),
                    ),
                  ],
                ),
              ),
              Text(t.privacypolicyDescribe16),
            ],
          ),
          const SizedBox(height: 16),
          _buildExpansionCard(
            context,
            index: 4,
            title: t.mitLTitle,
            isExpanded: _isExpanded[4],
            content: [
              Text(t.mitLContent),
              Text(t.mitLAboutTitle, style: theme.textTheme.titleMedium),
              Text(t.mitLAboutContent),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: t.mitLAboutContent),
                    TextSpan(
                      text: "https://www.mozilla.org/MPL/",
                      style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap =
                            () => _launchUrl("https://www.mozilla.org/MPL/"),
                    ),
                  ],
                ),
              ),
              Text(t.licenceTitle, style: theme.textTheme.titleMedium),
              Text(t.mitlicenceTitle),
              Text(t.copyrightStatement),
              Text(t.licence),
            ],
          ),
          const SizedBox(height: 16),
          _buildExpansionCard(
            context,
            index: 5,
            title: t.versionTitle,
            isExpanded: _isExpanded[5],
            content: [
              Text(t.version1Context),
              Text(t.versionTitle2, style: theme.textTheme.titleSmall),
              Text(t.version2Context),
              Text(
                '${t.appVersion}: $appVersion',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExpansionCard(
    BuildContext context, {
    required int index,
    required String title,
    required bool isExpanded,
    required List<Widget> content,
  }) {
    var theme = Theme.of(context);
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        title: Text(
          title,
          style: theme.textTheme.titleMedium,
        ),
        trailing: Icon(
          isExpanded ? Icons.expand_less : Icons.expand_more,
        ),
        onExpansionChanged: (expanded) {
          setState(() {
            _isExpanded[index] = expanded;
          });
        },
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: content,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}

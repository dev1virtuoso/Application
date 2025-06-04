import 'package:flutter/material.dart';
import '/l10n/app_localizations.dart';
import 'package:dev1virtuoso/widgets/url_launcher.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.pageAboutTitle),
      ),
      body: const AboutTabBar(),
    );
  }
}

class AboutTabBar extends StatefulWidget {
  const AboutTabBar({super.key});

  @override
  _AboutTabBarState createState() => _AboutTabBarState();
}

class _AboutTabBarState extends State<AboutTabBar> {
  final List<bool> _isExpanded = [false, false, false];

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
            title: t.aboutTitle,
            isExpanded: _isExpanded[0],
            content: [
              Text(t.carsonWuAboutMe),
              const SizedBox(height: 20),
            ],
          ),
          const SizedBox(height: 16),
          _buildExpansionCard(
            context,
            index: 1,
            title: t.contactTitle,
            isExpanded: _isExpanded[1],
            content: [
              ContactTable(),
            ],
          ),
          const SizedBox(height: 16),
          _buildExpansionCard(
            context,
            index: 2,
            title: t.donateTitle,
            isExpanded: _isExpanded[2],
            content: [
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
}

class ContactTable extends StatelessWidget {
  const ContactTable({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Table(
        border: TableBorder.all(),
        children: [
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(t.contactDiscord),
                ),
              ),
              TableCell(
                child: InkWell(
                    onTap: () {
                      UrlLauncher.buildClickableLink(
                          'https://discord.com/users/893165893469732935');
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child:
                          UrlLauncher.buildBlueUnderlineText(t.contactDiscord),
                    )),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0), child: Text(t.contactEmail)),
              ),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'mailto:carson.developer1125@gmail.com');
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: UrlLauncher.buildBlueUnderlineText(t.contactEmail),
                  ),
                ),
              )
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.contactFacebook)),
              ),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'https://www.facebook.com/apple.we.98');
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child:
                        UrlLauncher.buildBlueUnderlineText(t.contactFacebook),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0), child: Text(t.contactGitHub)),
              ),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'https://github.com/dev1virtuoso');
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: UrlLauncher.buildBlueUnderlineText(t.contactGitHub),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.contactInstagram)),
              ),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'https://instagram.com/dev1virtuoso');
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child:
                        UrlLauncher.buildBlueUnderlineText(t.contactInstagram),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.contactKakaoTalk)),
              ),
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0), child: Text('Carson1125')),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0), child: Text(t.contactViber)),
              ),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'viber://add?number=63078780');
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: UrlLauncher.buildBlueUnderlineText(t.contactViber),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0), child: Text(t.contactLINE)),
              ),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'https://line.me/ti/p/k4_I_vkqFZ');
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: UrlLauncher.buildBlueUnderlineText(t.contactLINE),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.contactLinkedIn)),
              ),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'https://www.linkedin.com/in/carson-wu-34a615325/');
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child:
                        UrlLauncher.buildBlueUnderlineText(t.contactLinkedIn),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.contactLinktree)),
              ),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'https://linktr.ee/carsonwe');
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child:
                        UrlLauncher.buildBlueUnderlineText(t.contactLinktree),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0), child: Text(t.contactORCID)),
              ),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'https://orcid.org/0009-0004-2238-8912');
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: UrlLauncher.buildBlueUnderlineText(t.contactORCID),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0), child: Text(t.contactPhone)),
              ),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink('tel:85263078780');
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: UrlLauncher.buildBlueUnderlineText(t.contactPhone),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0), child: Text(t.contactReddit)),
              ),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'https://www.reddit.com/user/carson_we/');
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: UrlLauncher.buildBlueUnderlineText(t.contactReddit),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0), child: Text(t.contactSignal)),
              ),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'https://signal.me/#eu/os05Q0OzC3s1NRRYvDNmobxTzCq1SPfX0ReOgDSQQbju04OeyaRG3rHClOwaf_m2');
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: UrlLauncher.buildBlueUnderlineText(t.contactSignal),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.contactTelegram)),
              ),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'https://telegram.me/dev1virtuoso');
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child:
                        UrlLauncher.buildBlueUnderlineText(t.contactTelegram),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.contactThreads)),
              ),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'https://www.threads.net/@dev1virtuoso');
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: UrlLauncher.buildBlueUnderlineText(t.contactThreads),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.contactWhatsApp)),
              ),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink('https://wa.me/63078780');
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child:
                        UrlLauncher.buildBlueUnderlineText(t.contactWhatsApp),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(t.contactTwitter)),
              ),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'https://x.com/dev1virtuoso/');
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: UrlLauncher.buildBlueUnderlineText(t.contactTwitter),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Donate
class DonateTable extends StatelessWidget {
  const DonateTable({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Table(
        border: TableBorder.all(),
        children: [
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(t.donateBMC),
                ),
              ),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'https://www.buymeacoffee.com/dev1virtuoso');
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: UrlLauncher.buildBlueUnderlineText(t.donateBMC),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(t.donateGHSP),
                ),
              ),
              TableCell(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.buildClickableLink(
                        'https://github.com/sponsors/dev1virtuoso/');
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: UrlLauncher.buildBlueUnderlineText(t.donateGHSP),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

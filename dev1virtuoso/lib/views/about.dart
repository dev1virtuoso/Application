import 'package:flutter/material.dart';
import '/l10n/app_localizations.dart';
import 'package:dev1virtuoso/widgets/url_launcher.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.pageAboutTitle),
        elevation: 2,
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
  final List<bool> _isExpanded = [false, false, false, false, false];
  List<dynamic> _blogs = [];
  List<dynamic> _researches = [];
  String _sortMode = 'date_newest';

  @override
  void initState() {
    super.initState();
    _loadBlogs();
    _loadResearches();
  }

  Future<void> _loadBlogs() async {
    try {
      final String response = await rootBundle.loadString('assets/blogs.json');
      if (response.isEmpty) {
        print('blogs.json is empty');
        return;
      }
      final data = json.decode(response);
      setState(() {
        _blogs = data;
        _sortBlogs();
      });
    } catch (e) {
      print('Error loading blogs: $e');
    }
  }

  void _sortBlogs() {
    setState(() {
      _blogs.sort((a, b) {
        final aTitle = a['title']?.toString().toLowerCase() ?? '';
        final bTitle = b['title']?.toString().toLowerCase() ?? '';
        final aDate =
            DateTime.tryParse(a['date']?.toString() ?? '') ?? DateTime(1970);
        final bDate =
            DateTime.tryParse(b['date']?.toString() ?? '') ?? DateTime(1970);

        switch (_sortMode) {
          case 'title_asc':
            return aTitle.compareTo(bTitle);
          case 'title_desc':
            return bTitle.compareTo(aTitle);
          case 'date_newest':
            return bDate.compareTo(aDate);
          case 'date_oldest':
            return aDate.compareTo(bDate);
          default:
            return 0;
        }
      });
    });
  }

  Future<void> _loadResearches() async {
    try {
      final String response =
          await rootBundle.loadString('assets/researches.json');
      if (response.isEmpty) {
        print('researches.json is empty');
        return;
      }
      final data = json.decode(response);
      setState(() {
        _researches = data;
        _sortResearches();
      });
    } catch (e) {
      print('Error loading researches: $e');
    }
  }

  void _sortResearches() {
    setState(() {
      _researches.sort((a, b) {
        final aTitle = a['title']?.toString().toLowerCase() ?? '';
        final bTitle = b['title']?.toString().toLowerCase() ?? '';
        final aDate =
            DateTime.tryParse(a['date']?.toString() ?? '') ?? DateTime(1970);
        final bDate =
            DateTime.tryParse(b['date']?.toString() ?? '') ?? DateTime(1970);

        switch (_sortMode) {
          case 'title_asc':
            return aTitle.compareTo(bTitle);
          case 'title_desc':
            return bTitle.compareTo(aTitle);
          case 'date_newest':
            return bDate.compareTo(aDate);
          case 'date_oldest':
            return aDate.compareTo(bDate);
          default:
            return 0;
        }
      });
    });
  }

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
              Text(t.carsonWuAboutMe, style: theme.textTheme.bodyMedium),
              const SizedBox(height: 20),
            ],
          ),
          const SizedBox(height: 16),
          _buildExpansionCard(
            context,
            index: 3,
            title: t.blogTitle,
            isExpanded: _isExpanded[3],
            content: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DropdownButton<String>(
                    value: _sortMode,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _sortMode = newValue;
                          _sortBlogs();
                        });
                      }
                    },
                    items: [
                      DropdownMenuItem(
                        value: 'title_asc',
                        child: Text(t.sortTitleAsc),
                      ),
                      DropdownMenuItem(
                        value: 'title_desc',
                        child: Text(t.sortTitleDesc),
                      ),
                      DropdownMenuItem(
                        value: 'date_newest',
                        child: Text(t.sortDateNewest),
                      ),
                      DropdownMenuItem(
                        value: 'date_oldest',
                        child: Text(t.sortDateOldest),
                      ),
                    ],
                    style: theme.textTheme.bodyMedium,
                    dropdownColor: theme.cardColor,
                    icon: Icon(Icons.sort, color: theme.iconTheme.color),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ...(_blogs.isEmpty
                  ? [Text(t.blogLoading, style: theme.textTheme.bodyMedium)]
                  : _blogs
                      .map<Widget>((blog) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: blog['url'] != null
                                    ? () => UrlLauncher.buildClickableLink(
                                        blog['url'])
                                    : null,
                                child: Text(
                                  blog['title'] ?? 'Untitled',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: blog['url'] != null
                                        ? theme.colorScheme.primary
                                        : theme.textTheme.titleMedium?.color,
                                    decoration: blog['url'] != null
                                        ? TextDecoration.underline
                                        : null,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                blog['content'] ?? '',
                                style: theme.textTheme.bodyMedium,
                              ),
                              if (blog['date'] != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    blog['date'],
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: theme.textTheme.bodySmall?.color
                                          ?.withOpacity(0.7),
                                    ),
                                  ),
                                ),
                              const Divider(height: 24),
                            ],
                          ))
                      .toList()),
            ],
          ),
          const SizedBox(height: 16),
          _buildExpansionCard(
            context,
            index: 1,
            title: t.contactTitle,
            isExpanded: _isExpanded[1],
            content: [
              const ContactTable(),
            ],
          ),
          const SizedBox(height: 16),
          _buildExpansionCard(
            context,
            index: 2,
            title: t.donateTitle,
            isExpanded: _isExpanded[2],
            content: [
              const DonateTable(),
              const SizedBox(height: 8),
              Text(t.donateTitle1, style: theme.textTheme.titleSmall),
              Text(t.donateDescribe1, style: theme.textTheme.bodyMedium),
              const SizedBox(height: 8),
              Text(t.donateDescribeTitle1, style: theme.textTheme.titleSmall),
              Text(t.donateDescribe2, style: theme.textTheme.bodyMedium),
              const SizedBox(height: 8),
              Text(t.donateDescribeTitle2, style: theme.textTheme.titleSmall),
              Text(t.donateDescribe3, style: theme.textTheme.bodyMedium),
              const SizedBox(height: 8),
              Text(t.donateDescribeTitle3, style: theme.textTheme.titleSmall),
              Text(t.donateDescribe4, style: theme.textTheme.bodyMedium),
              const SizedBox(height: 8),
              Text(t.donateDescribeTitle4, style: theme.textTheme.titleSmall),
              Text(t.donateDescribe5, style: theme.textTheme.bodyMedium),
            ],
          ),
          const SizedBox(height: 16),
          _buildExpansionCard(
            context,
            index: 3,
            title: t.researchTitle,
            isExpanded: _isExpanded[3],
            content: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DropdownButton<String>(
                    value: _sortMode,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _sortMode = newValue;
                          _sortResearches();
                        });
                      }
                    },
                    items: [
                      DropdownMenuItem(
                        value: 'title_asc',
                        child: Text(t.sortTitleAsc),
                      ),
                      DropdownMenuItem(
                        value: 'title_desc',
                        child: Text(t.sortTitleDesc),
                      ),
                      DropdownMenuItem(
                        value: 'date_newest',
                        child: Text(t.sortDateNewest),
                      ),
                      DropdownMenuItem(
                        value: 'date_oldest',
                        child: Text(t.sortDateOldest),
                      ),
                    ],
                    style: theme.textTheme.bodyMedium,
                    dropdownColor: theme.cardColor,
                    icon: Icon(Icons.sort, color: theme.iconTheme.color),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ...(_researches.isEmpty
                  ? [Text(t.researchLoading, style: theme.textTheme.bodyMedium)]
                  : _researches
                      .map<Widget>((research) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: research['url'] != null
                                    ? () => UrlLauncher.buildClickableLink(
                                        research['url'])
                                    : null,
                                child: Text(
                                  research['title'] ?? 'Untitled',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: research['url'] != null
                                        ? theme.colorScheme.primary
                                        : theme.textTheme.titleMedium?.color,
                                    decoration: research['url'] != null
                                        ? TextDecoration.underline
                                        : null,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                research['content'] ?? '',
                                style: theme.textTheme.bodyMedium,
                              ),
                              if (research['date'] != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    research['date'],
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: theme.textTheme.bodySmall?.color
                                          ?.withOpacity(0.7),
                                    ),
                                  ),
                                ),
                              const Divider(height: 24),
                            ],
                          ))
                      .toList()),
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
          style: theme.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        trailing: Icon(
          isExpanded ? Icons.expand_less : Icons.expand_more,
          color: theme.iconTheme.color,
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

class blog extends State<AboutTabBar> {
  final List<bool> _isExpanded = [false, false, false, false];
  List<dynamic> _blogs = [];

  @override
  void initState() {
    super.initState();
    _loadBlogs();
  }

  Future<void> _loadBlogs() async {
    try {
      final String response = await rootBundle.loadString('assets/blogs.json');
      final data = json.decode(response);
      setState(() {
        _blogs = data;
      });
    } catch (e) {
      print('Error loading blogs: $e');
    }
  }

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
              Text(t.carsonWuAboutMe, style: theme.textTheme.bodyMedium),
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
              const ContactTable(),
            ],
          ),
          const SizedBox(height: 16),
          _buildExpansionCard(
            context,
            index: 2,
            title: t.donateTitle,
            isExpanded: _isExpanded[2],
            content: [
              const DonateTable(),
              const SizedBox(height: 8),
              Text(t.donateTitle1, style: theme.textTheme.titleSmall),
              Text(t.donateDescribe1, style: theme.textTheme.bodyMedium),
              const SizedBox(height: 8),
              Text(t.donateDescribeTitle1, style: theme.textTheme.titleSmall),
              Text(t.donateDescribe2, style: theme.textTheme.bodyMedium),
              const SizedBox(height: 8),
              Text(t.donateDescribeTitle2, style: theme.textTheme.titleSmall),
              Text(t.donateDescribe3, style: theme.textTheme.bodyMedium),
              const SizedBox(height: 8),
              Text(t.donateDescribeTitle3, style: theme.textTheme.titleSmall),
              Text(t.donateDescribe4, style: theme.textTheme.bodyMedium),
              const SizedBox(height: 8),
              Text(t.donateDescribeTitle4, style: theme.textTheme.titleSmall),
              Text(t.donateDescribe5, style: theme.textTheme.bodyMedium),
            ],
          ),
          const SizedBox(height: 16),
          _buildExpansionCard(
            context,
            index: 3,
            title: t.blogTitle,
            isExpanded: _isExpanded[3],
            content: _blogs.isEmpty
                ? [Text(t.blogLoading, style: theme.textTheme.bodyMedium)]
                : _blogs
                    .map<Widget>((blog) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: blog['url'] != null
                                  ? () => UrlLauncher.buildClickableLink(
                                      blog['url'])
                                  : null,
                              child: Text(
                                blog['title'],
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: blog['url'] != null
                                      ? theme.colorScheme.primary
                                      : theme.textTheme.titleMedium?.color,
                                  decoration: blog['url'] != null
                                      ? TextDecoration.underline
                                      : null,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              blog['content'],
                              style: theme.textTheme.bodyMedium,
                            ),
                            if (blog['date'] != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  blog['date'],
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: theme.textTheme.bodySmall?.color
                                        ?.withOpacity(0.7),
                                  ),
                                ),
                              ),
                            const Divider(height: 24),
                          ],
                        ))
                    .toList(),
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
          style: theme.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        trailing: Icon(
          isExpanded ? Icons.expand_less : Icons.expand_more,
          color: theme.iconTheme.color,
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
    var theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Table(
        border: TableBorder.all(
          color: theme.dividerColor,
          borderRadius: BorderRadius.circular(8),
        ),
        columnWidths: const {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(2),
        },
        children: [
          _buildTableRow(context, t.contactDiscord,
              'https://discord.com/users/893165893469732935'),
          _buildTableRow(
              context, t.contactEmail, 'mailto:carson.developer1125@gmail.com'),
          _buildTableRow(context, t.contactFacebook,
              'https://www.facebook.com/apple.we.98'),
          _buildTableRow(
              context, t.contactGitHub, 'https://github.com/dev1virtuoso'),
          _buildTableRow(context, t.contactInstagram,
              'https://instagram.com/dev1virtuoso'),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(t.contactKakaoTalk,
                      style: theme.textTheme.bodyMedium),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Carson1125', style: theme.textTheme.bodyMedium),
                ),
              ),
            ],
          ),
          _buildTableRow(
              context, t.contactViber, 'viber://add?number=63078780'),
          _buildTableRow(
              context, t.contactLINE, 'https://line.me/ti/p/k4_I_vkqFZ'),
          _buildTableRow(context, t.contactLinkedIn,
              'https://www.linkedin.com/in/carson-wu-34a615325/'),
          _buildTableRow(
              context, t.contactLinktree, 'https://linktr.ee/carsonwe'),
          _buildTableRow(
              context, t.contactORCID, 'https://orcid.org/0009-0004-2238-8912'),
          _buildTableRow(context, t.contactPhone, 'tel:85263078780'),
          _buildTableRow(context, t.contactReddit,
              'https://www.reddit.com/user/carson_we/'),
          _buildTableRow(context, t.contactSignal,
              'https://signal.me/#eu/os05Q0OzC3s1NRRYvDNmobxTzCq1SPfX0ReOgDSQQbju04OeyaRG3rHClOwaf_m2'),
          _buildTableRow(
              context, t.contactTelegram, 'https://telegram.me/dev1virtuoso'),
          _buildTableRow(context, t.contactThreads,
              'https://www.threads.net/@dev1virtuoso'),
          _buildTableRow(context, t.contactWhatsApp, 'https://wa.me/63078780'),
          _buildTableRow(
              context, t.contactTwitter, 'https://x.com/dev1virtuoso/'),
        ],
      ),
    );
  }

  TableRow _buildTableRow(BuildContext context, String label, String url) {
    var theme = Theme.of(context);
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(label, style: theme.textTheme.bodyMedium),
          ),
        ),
        TableCell(
          child: InkWell(
            onTap: () => UrlLauncher.buildClickableLink(url),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: UrlLauncher.buildBlueUnderlineText(label),
            ),
          ),
        ),
      ],
    );
  }
}

class DonateTable extends StatelessWidget {
  const DonateTable({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    var theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Table(
        border: TableBorder.all(
          color: theme.dividerColor,
          borderRadius: BorderRadius.circular(8),
        ),
        columnWidths: const {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(2),
        },
        children: [
          _buildTableRow(context, t.donateBMC,
              'https://www.buymeacoffee.com/dev1virtuoso'),
          _buildTableRow(context, t.donateGHSP,
              'https://github.com/sponsors/dev1virtuoso/'),
        ],
      ),
    );
  }

  TableRow _buildTableRow(BuildContext context, String label, String url) {
    var theme = Theme.of(context);
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(label, style: theme.textTheme.bodyMedium),
          ),
        ),
        TableCell(
          child: InkWell(
            onTap: () => UrlLauncher.buildClickableLink(url),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: UrlLauncher.buildBlueUnderlineText(label),
            ),
          ),
        ),
      ],
    );
  }
}

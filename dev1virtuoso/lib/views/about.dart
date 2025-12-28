import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Clipboard
import '/l10n/app_localizations.dart';
import 'package:dev1virtuoso/widgets/url_launcher.dart';
import 'dart:convert';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_markdown_latex/flutter_markdown_latex.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown/markdown.dart' as md;

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
  State<AboutTabBar> createState() => _AboutTabBarState();
}

class _AboutTabBarState extends State<AboutTabBar> {
  final List<bool> _isExpanded = [false, false, false, false, false];

  List<dynamic> _blogs = [];
  List<dynamic> _researches = [];

  String _blogSortMode = 'date_newest';
  String _researchSortMode = 'date_newest';

  @override
  void initState() {
    super.initState();
    _loadBlogs();
    _loadResearches();
  }

  Future<void> _loadBlogs() async {
    try {
      final String response = await rootBundle.loadString('assets/blogs.json');
      if (response.isEmpty) return;
      final data = json.decode(response) as List<dynamic>;
      setState(() {
        _blogs = data;
        _sortBlogs();
      });
    } catch (e) {
      debugPrint('Error loading blogs: $e');
    }
  }

  Future<void> _loadResearches() async {
    try {
      final String response =
          await rootBundle.loadString('assets/research.json');
      if (response.isEmpty) return;
      final data = json.decode(response) as List<dynamic>;
      setState(() {
        _researches = data;
        _sortResearches();
      });
    } catch (e) {
      debugPrint('Error loading researches: $e');
    }
  }

  void _sortBlogs() {
    setState(() {
      final String locale = AppLocalizations.of(context)!.localeName;
      _blogs.sort((a, b) {
        final aTitle = (a['title']?[locale] ?? a['title']?['en'] ?? '')
            .toString()
            .toLowerCase();
        final bTitle = (b['title']?[locale] ?? b['title']?['en'] ?? '')
            .toString()
            .toLowerCase();
        final aDate = DateTime.tryParse(a['date'] ?? '') ?? DateTime(1970);
        final bDate = DateTime.tryParse(b['date'] ?? '') ?? DateTime(1970);

        return switch (_blogSortMode) {
          'title_asc' => aTitle.compareTo(bTitle),
          'title_desc' => bTitle.compareTo(aTitle),
          'date_newest' => bDate.compareTo(aDate),
          'date_oldest' => aDate.compareTo(bDate),
          _ => 0,
        };
      });
    });
  }

  void _sortResearches() {
    setState(() {
      final String locale = AppLocalizations.of(context)!.localeName;
      _researches.sort((a, b) {
        final aTitle = (a['title']?[locale] ?? a['title']?['en'] ?? '')
            .toString()
            .toLowerCase();
        final bTitle = (b['title']?[locale] ?? b['title']?['en'] ?? '')
            .toString()
            .toLowerCase();
        final aDate = DateTime.tryParse(a['date'] ?? '') ?? DateTime(1970);
        final bDate = DateTime.tryParse(b['date'] ?? '') ?? DateTime(1970);

        return switch (_researchSortMode) {
          'title_asc' => aTitle.compareTo(bTitle),
          'title_desc' => bTitle.compareTo(aTitle),
          'date_newest' => bDate.compareTo(aDate),
          'date_oldest' => aDate.compareTo(bDate),
          _ => 0,
        };
      });
    });
  }

  Widget _buildMarkdownContent(String content, ThemeData theme) {
    return MarkdownBody(
      data: content,
      selectable: true,
      styleSheet: MarkdownStyleSheet.fromTheme(theme).copyWith(
        p: theme.textTheme.bodyMedium,
        h1: theme.textTheme.headlineMedium,
        h2: theme.textTheme.headlineSmall,
        blockquotePadding: const EdgeInsets.all(16),
        blockquoteDecoration: BoxDecoration(
          color: theme.colorScheme.surfaceVariant,
          border: Border(
              left: BorderSide(color: theme.colorScheme.primary, width: 4)),
          borderRadius: BorderRadius.circular(8),
        ),
        codeblockPadding: const EdgeInsets.all(16),
        codeblockDecoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),
        tableHead:
            theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        tableBody: theme.textTheme.bodyMedium,
        checkbox: theme.textTheme.bodyMedium
            ?.copyWith(color: theme.colorScheme.primary),
      ),
      builders: {
        'code': CodeElementBuilder(theme: theme, context: context),
        'alert': AlertElementBuilder(theme: theme),
        'latex': LatexElementBuilder(
          textStyle: theme.textTheme.bodyMedium,
          textScaleFactor: 1.3,
        ),
      },
      // 修正錯誤：使用可修改的 List 複製 GFM 並加入 LaTeX
      extensionSet: md.ExtensionSet(
        [...md.ExtensionSet.gitHubFlavored.blockSyntaxes, LatexBlockSyntax()],
        [...md.ExtensionSet.gitHubFlavored.inlineSyntaxes, LatexInlineSyntax()],
      ),
      onTapLink: (text, href, title) {
        if (href != null) {
          UrlLauncher.buildClickableLink(href);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    final locale = t.localeName;

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

          // Blogs
          _buildExpansionCard(
            context,
            index: 1,
            title: t.blogTitle,
            isExpanded: _isExpanded[1],
            content: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DropdownButton<String>(
                    value: _blogSortMode,
                    onChanged: (v) {
                      if (v != null) {
                        setState(() {
                          _blogSortMode = v;
                          _sortBlogs();
                        });
                      }
                    },
                    items: [
                      DropdownMenuItem(
                          value: 'title_asc', child: Text(t.sortTitleAsc)),
                      DropdownMenuItem(
                          value: 'title_desc', child: Text(t.sortTitleDesc)),
                      DropdownMenuItem(
                          value: 'date_newest', child: Text(t.sortDateNewest)),
                      DropdownMenuItem(
                          value: 'date_oldest', child: Text(t.sortDateOldest)),
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
                  : _blogs.map<Widget>((blog) {
                      final title = blog['title']?[locale] ??
                          blog['title']?['en'] ??
                          'Untitled';
                      final content = blog['content']?[locale] ??
                          blog['content']?['en'] ??
                          '';
                      final url = blog['url'] as String?;
                      final date = blog['date'] as String?;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: url != null
                                ? () => UrlLauncher.buildClickableLink(url)
                                : null,
                            child: Text(
                              title,
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: url != null
                                    ? theme.colorScheme.primary
                                    : null,
                                decoration: url != null
                                    ? TextDecoration.underline
                                    : null,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          _buildMarkdownContent(content, theme),
                          if (date != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                date,
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: theme.textTheme.bodySmall?.color
                                      ?.withOpacity(0.7),
                                ),
                              ),
                            ),
                          const Divider(height: 32),
                        ],
                      );
                    }).toList()),
            ],
          ),
          const SizedBox(height: 16),

          // Contact
          _buildExpansionCard(
            context,
            index: 2,
            title: t.contactTitle,
            isExpanded: _isExpanded[2],
            content: [const ContactTable()],
          ),
          const SizedBox(height: 16),

          // Donate
          _buildExpansionCard(
            context,
            index: 3,
            title: t.donateTitle,
            isExpanded: _isExpanded[3],
            content: [
              const DonateTable(),
              const SizedBox(height: 16),
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

          // Research
          _buildExpansionCard(
            context,
            index: 4,
            title: t.researchTitle,
            isExpanded: _isExpanded[4],
            content: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DropdownButton<String>(
                    value: _researchSortMode,
                    onChanged: (v) {
                      if (v != null) {
                        setState(() {
                          _researchSortMode = v;
                          _sortResearches();
                        });
                      }
                    },
                    items: [
                      DropdownMenuItem(
                          value: 'title_asc', child: Text(t.sortTitleAsc)),
                      DropdownMenuItem(
                          value: 'title_desc', child: Text(t.sortTitleDesc)),
                      DropdownMenuItem(
                          value: 'date_newest', child: Text(t.sortDateNewest)),
                      DropdownMenuItem(
                          value: 'date_oldest', child: Text(t.sortDateOldest)),
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
                  : _researches.map<Widget>((research) {
                      final title = research['title']?[locale] ??
                          research['title']?['en'] ??
                          'Untitled';
                      final content = research['content']?[locale] ??
                          research['content']?['en'] ??
                          '';
                      final url = research['url'] as String?;
                      final date = research['date'] as String?;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: url != null
                                ? () => UrlLauncher.buildClickableLink(url)
                                : null,
                            child: Text(
                              title,
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: url != null
                                    ? theme.colorScheme.primary
                                    : null,
                                decoration: url != null
                                    ? TextDecoration.underline
                                    : null,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          _buildMarkdownContent(content, theme),
                          if (date != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                date,
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: theme.textTheme.bodySmall?.color
                                      ?.withOpacity(0.7),
                                ),
                              ),
                            ),
                          const Divider(height: 32),
                        ],
                      );
                    }).toList()),
            ],
          ),
          const SizedBox(height: 32),
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
    final theme = Theme.of(context);
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
        onExpansionChanged: (expanded) =>
            setState(() => _isExpanded[index] = expanded),
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

// 程式碼高亮 + 複製按鈕
class CodeElementBuilder extends MarkdownElementBuilder {
  final ThemeData theme;
  final BuildContext context;

  CodeElementBuilder({required this.theme, required this.context});

  @override
  Widget? visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    final language =
        element.attributes['class']?.replaceFirst('language-', '') ?? 'text';
    final code = element.children?.isNotEmpty == true
        ? element.children!.first.textContent.trim()
        : '';

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.12),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(language, style: theme.textTheme.labelSmall),
                const SizedBox(width: 12),
                IconButton(
                  icon: const Icon(Icons.copy, size: 18),
                  tooltip: 'Copy code',
                  onPressed: () async {
                    await Clipboard.setData(ClipboardData(text: code));
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Code copied to clipboard!')),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          HighlightView(
            code,
            language: language,
            theme: vs2015Theme,
            padding: const EdgeInsets.all(16),
            textStyle: GoogleFonts.jetBrainsMono(fontSize: 13),
          ),
        ],
      ),
    );
  }
}

// GitHub-style Alert
class AlertElementBuilder extends MarkdownElementBuilder {
  final ThemeData theme;

  AlertElementBuilder({required this.theme});

  @override
  Widget? visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    final rawType = element.attributes['type'] ?? 'note';
    final type = rawType.toUpperCase();
    final (icon, color) = switch (type) {
      'TIP' => (Icons.lightbulb_outline, Colors.green),
      'IMPORTANT' => (Icons.error_outline, Colors.purple),
      'WARNING' => (Icons.warning_amber_outlined, Colors.orange),
      'CAUTION' => (Icons.dangerous_outlined, Colors.red),
      _ => (Icons.info_outline, Colors.blue),
    };

    final childrenText =
        element.children?.map((e) => e.textContent).join('\n') ?? '';

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border(left: BorderSide(color: color, width: 4)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: MarkdownBody(
              data: childrenText,
              styleSheet: MarkdownStyleSheet.fromTheme(theme).copyWith(
                p: theme.textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Contact Table
class ContactTable extends StatelessWidget {
  const ContactTable({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    var theme = Theme.of(context);

    TableRow _row(String label, String url) => TableRow(
          children: [
            TableCell(
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(label, style: theme.textTheme.bodyMedium))),
            TableCell(
              child: InkWell(
                onTap: () => UrlLauncher.buildClickableLink(url),
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: UrlLauncher.buildBlueUnderlineText(label)),
              ),
            ),
          ],
        );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Table(
        border: TableBorder.all(
            color: theme.dividerColor, borderRadius: BorderRadius.circular(8)),
        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
        children: [
          _row(
              t.contactDiscord, 'https://discord.com/users/893165893469732935'),
          _row(t.contactEmail, 'mailto:carson.developer1125@gmail.com'),
          _row(t.contactFacebook, 'https://www.facebook.com/apple.we.98'),
          _row(t.contactGitHub, 'https://github.com/dev1virtuoso'),
          _row(t.contactInstagram, 'https://instagram.com/dev1virtuoso'),
          TableRow(children: [
            TableCell(
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(t.contactKakaoTalk,
                        style: theme.textTheme.bodyMedium))),
            TableCell(
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child:
                        Text('Carson1125', style: theme.textTheme.bodyMedium))),
          ]),
          _row(t.contactViber, 'viber://add?number=63078780'),
          _row(t.contactLINE, 'https://line.me/ti/p/k4_I_vkqFZ'),
          _row(t.contactLinkedIn,
              'https://www.linkedin.com/in/carson-wu-34a615325/'),
          _row(t.contactLinktree, 'https://linktr.ee/carsonwe'),
          _row(t.contactORCID, 'https://orcid.org/0009-0004-2238-8912'),
          _row(t.contactPhone, 'tel:85263078780'),
          _row(t.contactReddit, 'https://www.reddit.com/user/carson_we/'),
          _row(t.contactSignal,
              'https://signal.me/#eu/os05Q0OzC3s1NRRYvDNmobxTzCq1SPfX0ReOgDSQQbju04OeyaRG3rHClOwaf_m2'),
          _row(t.contactTelegram, 'https://telegram.me/dev1virtuoso'),
          _row(t.contactThreads, 'https://www.threads.net/@dev1virtuoso'),
          _row(t.contactWhatsApp, 'https://wa.me/63078780'),
          _row(t.contactTwitter, 'https://x.com/dev1virtuoso/'),
        ],
      ),
    );
  }
}

// Donate Table
class DonateTable extends StatelessWidget {
  const DonateTable({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    var theme = Theme.of(context);

    TableRow _row(String label, String url) => TableRow(
          children: [
            TableCell(
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(label, style: theme.textTheme.bodyMedium))),
            TableCell(
              child: InkWell(
                onTap: () => UrlLauncher.buildClickableLink(url),
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: UrlLauncher.buildBlueUnderlineText(label)),
              ),
            ),
          ],
        );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Table(
        border: TableBorder.all(
            color: theme.dividerColor, borderRadius: BorderRadius.circular(8)),
        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
        children: [
          _row(t.donateBMC, 'https://www.buymeacoffee.com/dev1virtuoso'),
          _row(t.donateGHSP, 'https://github.com/sponsors/dev1virtuoso/'),
        ],
      ),
    );
  }
}

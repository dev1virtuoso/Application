import 'package:flutter/material.dart';
import '/l10n/app_localizations.dart';

class Arcade extends StatelessWidget {
  const Arcade({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.pageArcadeTitle),
      ),
      body: const ArcadeTabBar(),
    );
  }
}

class ArcadeTabBar extends StatefulWidget {
  const ArcadeTabBar({super.key});

  @override
  _ArcadeTabBarState createState() => _ArcadeTabBarState();
}

class _ArcadeTabBarState extends State<ArcadeTabBar> {
  bool _isExpanded = false;

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
            title: t.arcadeTitle,
            isExpanded: _isExpanded,
            content: [
              // Add arcade content here
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExpansionCard(
    BuildContext context, {
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
            _isExpanded = expanded;
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

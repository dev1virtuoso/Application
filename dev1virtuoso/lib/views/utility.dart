import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dev1virtuoso/widgets/utility_container.dart';

class Utility extends StatelessWidget {
  const Utility({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.pageutilityTitle),
      ),
      body: const UtilityTabBar(),
    );
  }
}

class UtilityTabBar extends StatefulWidget {
  const UtilityTabBar({Key? key}) : super(key: key);

  @override
  _UtilityTabBarState createState() => _UtilityTabBarState();
}

class _UtilityTabBarState extends State<UtilityTabBar> {
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
            title: t.pageutilityTitle,
            isExpanded: _isExpanded,
            content: [
              CardDisplay(),
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

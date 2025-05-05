import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.pageAccountTitle),
      ),
      body: const AccountTabBar(),
    );
  }
}

class AccountTabBar extends StatefulWidget {
  const AccountTabBar({Key? key}) : super(key: key);

  @override
  _AccountTabBarState createState() => _AccountTabBarState();
}

class _AccountTabBarState extends State<AccountTabBar> {
  final List<bool> _isExpanded = [false, false];

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
            title: t.signUpTitle,
            isExpanded: _isExpanded[0],
            content: [
              // Add sign-up content here
            ],
          ),
          const SizedBox(height: 16),
          _buildExpansionCard(
            context,
            index: 1,
            title: t.signInTitle,
            isExpanded: _isExpanded[1],
            content: [
              // Add sign-in content here
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

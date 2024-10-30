import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'about_page.dart';
import 'account_page.dart';
import 'arcade_page.dart';
import 'index_page.dart';
import 'settings_page.dart';
import 'utility_page.dart';

class CustomSideNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomSideNavigationBar(
      {Key? key, required this.currentIndex, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var intl = AppLocalizations.of(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildListTile(context, Icons.home, intl.home, 0, currentIndex, onTap,
              const IndexPage()),
          _buildListTile(context, Icons.account_circle, intl.about, 1,
              currentIndex, onTap, const AboutHomePage()),
          _buildListTile(context, Icons.account_circle, intl.account, 2,
              currentIndex, onTap, AccountPage()),
          _buildListTile(context, Icons.gamepad, intl.arcade, 3, currentIndex,
              onTap, ArcadePage()),
          _buildListTile(context, Icons.settings, intl.utility, 4, currentIndex,
              onTap, const UtilityPage()),
          _buildListTile(context, Icons.settings, intl.settings, 5,
              currentIndex, onTap, const SettingsPage()),
        ],
      ),
    );
  }

  ListTile _buildListTile(BuildContext context, IconData icon, String title,
      int index, int currentIndex, Function(int) onTap, Widget widget) {
    return ListTile(
      leading:
          Icon(icon, color: currentIndex == index ? Colors.blue : Colors.grey),
      title: Text(title),
      onTap: () {
        onTap(index);
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget),
        );
      },
    );
  }
}

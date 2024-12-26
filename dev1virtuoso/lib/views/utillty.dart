import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dev1virtuoso/widgets/tab.dart';

class Utillty extends StatelessWidget {
  const Utillty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.pageUtilltyTitle),
      ),
      body: (const UtilltyTabBar()),
    );
  }
}

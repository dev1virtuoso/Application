import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var intl = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(intl.accountPageTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.account_circle,
              size: 100,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            Text(
              intl.welcomeMessage,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

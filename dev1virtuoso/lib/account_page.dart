import 'package:flutter/material.dart';
import 'package:dev1virtuoso/app_localizations.dart';
import 'package:dev1virtuoso/scripts.dart';
import 'package:intl/intl.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Intl.message('Account',
            name: 'accountPageTitle', desc: 'accountPageTitle')),
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
              Intl.message('Welcome to your account page!',
                  name: 'welcomeMessage', desc: 'welcomeMessage'),
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

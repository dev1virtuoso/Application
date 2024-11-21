import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UtilityPage extends StatefulWidget {
  const UtilityPage({Key? key}) : super(key: key);

  @override
  _UtilityPageState createState() => _UtilityPageState();
}

class _UtilityPageState extends State<UtilityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Intl.message('Utility',
            name: 'utilityTitle', desc: 'utilityTitle')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to Guess the Number game page
              },
              child: Text(
                  Intl.message('Utility', name: 'utility', desc: 'utility')),
            ),
          ],
        ),
      ),
    );
  }
}

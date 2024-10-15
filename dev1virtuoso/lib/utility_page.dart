import 'package:flutter/material.dart';
import 'custom_side_navigation_bar.dart';

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
        title: Text('Utility Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Add functionality for Utility Option 1
                print('Utility Option 1 selected');
              },
              child: Text('Utility Option 1'),
            ),
            ElevatedButton(
              onPressed: () {
                // Add functionality for Utility Option 2
                print('Utility Option 2 selected');
              },
              child: Text('Utility Option 2'),
            ),
            ElevatedButton(
              onPressed: () {
                // Add functionality for Utility Option 3
                print('Utility Option 3 selected');
              },
              child: Text('Utility Option 3'),
            ),
          ],
        ),
      ),
    );
  }
}

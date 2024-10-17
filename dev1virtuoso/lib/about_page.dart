import 'package:flutter/material.dart';
import 'custom_side_navigation_bar.dart';
import 'scripts.dart';

void main() {
  aboutMe(); // Call the aboutMe function from scripts.dart

  print("\nContact Information:");
  var contactInfo;
  contactInfo.forEach((contact) => print(contact));

  print("\nDonation Links:");
  var donationLinks;
  donationLinks.forEach((donation) => print(donation));

  runApp(AboutPage());
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'About App',
      home: AboutHomePage(),
    );
  }
}

class AboutHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'dev1virtuoso',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Version: v0.0.1.0(001)(0010_001-181024a)',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Developer: Carson Wu',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

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
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Page'),
      ),
      body: Center(
        child: Text('About Page Content'),
      ),
    );
  }
}

class AboutHomePage extends StatelessWidget {
  const AboutHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'dev1virtuoso',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Version: v0.0.2.1(003)(0021_003-211024a)',
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

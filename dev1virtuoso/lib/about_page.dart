import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await fetchContactInfo();
  await fetchDonationLinks();
}

Future<void> fetchContactInfo() async {
  var response =
      await http.get(Uri.parse('https://api.example.com/contact_info'));

  if (response.statusCode == 200) {
    var data = response.body;
    print('Contact Information: $data');
    // Parse and handle the contact information data here
  } else {
    print(
        'Failed to fetch contact information. Status code: ${response.statusCode}');
  }
}

Future<void> fetchDonationLinks() async {
  var response =
      await http.get(Uri.parse('https://api.example.com/donation_links'));

  if (response.statusCode == 200) {
    var data = response.body;
    print('Donation Links: $data');
    // Parse and handle the donation links data here
  } else {
    print(
        'Failed to fetch donation links. Status code: ${response.statusCode}');
  }
}

class AboutHomePage extends StatelessWidget {
  const AboutHomePage({Key key}) : super(key: key);

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
              'Version: v0.0.2.11(013)(00211_013-301024a)',
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

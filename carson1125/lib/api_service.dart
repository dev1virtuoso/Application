import 'package:http/http.dart' as http;

class ApiService {
  static Future<String> fetchGitHubTxtFile() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/yourUsername/yourRepository/master/content.txt'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load txt file');
    }
  }
}

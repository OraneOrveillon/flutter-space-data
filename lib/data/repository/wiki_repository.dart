import 'package:http/http.dart' as http;

import '../model/wiki_model.dart';

class WikiRepository {
  WikiRepository({required this.bodyName});

  final String bodyName;

  static const String url = 'https://en.wikipedia.org/w/api.php?action=opensearch&search=';

  Future<List<dynamic>> getWiki() async {
    final response = await http.get(
      Uri.parse('$url$bodyName'),
    );
    if (response.statusCode == 200) {
      return wikiFromMap(response.body);
    } else {
      throw Exception('Failed to load wiki');
    }
  }
}

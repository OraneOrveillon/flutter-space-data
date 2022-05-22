import 'package:flutter_space_data/data/model/body_model.dart';
import 'package:http/http.dart' as http;

class BodyRepository {
  final String _baseUrl = "https://api.le-systeme-solaire.net/rest/bodies/";

  Future<BodyModel> getJoke() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return bodyFromMap(response.body);
    } else {
      throw Exception("Failed to load bodies");
    }
  }
}

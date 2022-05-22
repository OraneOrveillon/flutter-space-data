import 'package:flutter_space_data/data/model/solar_system_model.dart';
import 'package:http/http.dart' as http;

class SolarSystemRepository {
  final String _baseUrl = "https://api.le-systeme-solaire.net/rest/bodies/";

  Future<SolarSystemModel> getSolarSystem() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return bodyFromMap(response.body);
    } else {
      throw Exception("Failed to load bodies");
    }
  }
}

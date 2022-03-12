import 'dart:convert';
import 'package:http/http.dart' as http;

/// Gets responses from API's
class APIManager {
  /// Returns data about bodies of the Solar System
  static apiBodies() async {
    var response = jsonDecode(await http
        .read(Uri.parse('https://api.le-systeme-solaire.net/rest/bodies/')));
    var jsonBodies = response['bodies'];

    return jsonBodies;
  }

  /// Returns picture links of the given [bodyName]
  static apiPictures(String bodyName) async {
    var response = jsonDecode(await http
        .read(Uri.parse('https://images-api.nasa.gov/search?q=$bodyName')));
    var jsonPictures = response['collection']['items'];

    return jsonPictures;
  }
}

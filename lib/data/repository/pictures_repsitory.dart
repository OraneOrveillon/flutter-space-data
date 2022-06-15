import 'package:flutter_space_data/data/model/pictures_model.dart';
import 'package:http/http.dart' as http;

class PicturesRepository {
  PicturesRepository({required this.bodyName});

  static const String _url = "https://images-api.nasa.gov/search?q=";

  final String bodyName;

  Future<Pictures> getPictures() async {
    final response = await http.get(Uri.parse('$_url$bodyName'));
    if (response.statusCode == 200) {
      return picturesFromMap(response.body);
    } else {
      throw Exception("Failed to load pictures");
    }
  }
}

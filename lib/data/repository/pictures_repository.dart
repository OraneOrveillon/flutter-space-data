import 'package:http/http.dart' as http;

import '../model/pictures_model.dart';

class PicturesRepository {
  PicturesRepository({required this.bodyName});

  static const String _url = "https://images-api.nasa.gov/search?keywords=";

  final String bodyName;

  /// '&media_type=image' to only get images and not videos etc...
  Future<Pictures> getPictures() async {
    final response = await http.get(Uri.parse('$_url$bodyName&media_type=image'));
    if (response.statusCode == 200) {
      return picturesFromMap(response.body);
    } else {
      throw Exception("Failed to load pictures");
    }
  }
}

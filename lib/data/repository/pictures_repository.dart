import 'package:http/http.dart' as http;

import '../model/pictures_model.dart';

class PicturesRepository {
  PicturesRepository({this.bodyName, this.url});

  final String? bodyName;
  final String? url;

  /// '&media_type=image' to only get images and not videos etc...
  Future<Pictures> getPictures() async {
    final response = await http.get(
      Uri.parse(
        url ?? 'https://images-api.nasa.gov/search?keywords=${bodyName!.replaceAll("'", '')}&media_type=image&page=1',
      ),
    );
    if (response.statusCode == 200) {
      return picturesFromMap(response.body);
    } else {
      throw Exception('Failed to load pictures');
    }
  }
}

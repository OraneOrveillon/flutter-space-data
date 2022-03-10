import 'dart:convert';

import 'package:flutter_space_data/controller/mto_manager.dart';
import 'package:flutter_space_data/model/body.dart';
import 'package:http/http.dart' as http;

// ! Remove after
void main() async {
  Future<List<Map>> pictures = APIManager.apiPictures("saturn");
  print(MapToObjectManager.mapToGallery(pictures).pictures);

  // print(APIManager.apiBodies());
  // APIManager.apiPictures('saturn');
}

class APIManager {
  static apiBodies() async {
    var response = jsonDecode(await http
        .read(Uri.parse('https://api.le-systeme-solaire.net/rest/bodies/')));
    var bodies = response['bodies'];
    print(bodies);
    return bodies;
  }

  static apiPictures(String bodyName) async {
    var response = jsonDecode(await http
        .read(Uri.parse('https://images-api.nasa.gov/search?q=$bodyName')));
    var pictures = response['collection']['items'];
    print(pictures);
    return pictures;
  }
}

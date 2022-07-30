import 'dart:convert';

List<dynamic> wikiFromMap(String str) {
  return List<dynamic>.from(json.decode(str).map((x) => x));
}

String wikiToMap(List<dynamic> data) => json.encode(List<dynamic>.from(data.map((x) => x)));

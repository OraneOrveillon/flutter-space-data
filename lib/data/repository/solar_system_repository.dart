import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/solar_system_model.dart';

class SolarSystemRepository {
  static const String _allBodiesUrl = "https://api.le-systeme-solaire.net/rest/bodies/";
  static const String _planetsUrl =
      "https://api.le-systeme-solaire.net/rest.php/bodies?filter%5B%5D=bodyType%2Ceq%2CPlanet";
  static const String _moonsUrl =
      "https://api.le-systeme-solaire.net/rest.php/bodies?filter%5B%5D=bodyType%2Ceq%2CMoon";
  static const String _sunUrl = "https://api.le-systeme-solaire.net/rest.php/bodies?filter%5B%5D=bodyType%2Ceq%2CStar";
  static const String _dwarfPlanetsUrl =
      "https://api.le-systeme-solaire.net/rest.php/bodies?filter%5B%5D=bodyType%2Ceq%2CDwarf%20Planet";
  static const String _asteroidsUrl =
      "https://api.le-systeme-solaire.net/rest.php/bodies?filter%5B%5D=bodyType%2Ceq%2CAsteroid";
  static const String _cometsUrl =
      "https://api.le-systeme-solaire.net/rest.php/bodies?filter%5B%5D=bodyType%2Ceq%2CComet";

  Future<SolarSystem> getAllBodies() async => _getHttp(_allBodiesUrl);
  Future<SolarSystem> getPlanets() async => _getHttp(_planetsUrl);
  Future<SolarSystem> getMoons() async => _getHttp(_moonsUrl);
  Future<SolarSystem> getSun() async => _getHttp(_sunUrl);
  Future<SolarSystem> getDwarfPlanets() async => _getHttp(_dwarfPlanetsUrl);
  Future<SolarSystem> getAsteroids() async => _getHttp(_asteroidsUrl);
  Future<SolarSystem> getComets() async => _getHttp(_cometsUrl);

  Future<Body> getSingleBody(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Body.fromMap(json.decode(response.body));
    } else {
      throw Exception("Failed to load bodies");
    }
  }

  Future<SolarSystem> _getHttp(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return solarSystemFromMap(response.body);
    } else {
      throw Exception("Failed to load bodies");
    }
  }
}

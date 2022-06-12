import 'package:flutter_space_data/data/model/solar_system_model.dart';
import 'package:http/http.dart' as http;

class SolarSystemRepository {
  static const String _allBodies = "https://api.le-systeme-solaire.net/rest/bodies/";
  static const String _planets =
      "https://api.le-systeme-solaire.net/rest.php/bodies?filter%5B%5D=bodyType%2Ceq%2CPlanet";
  static const String _moons = "https://api.le-systeme-solaire.net/rest.php/bodies?filter%5B%5D=bodyType%2Ceq%2CMoon";
  static const String _sun = "https://api.le-systeme-solaire.net/rest.php/bodies?filter%5B%5D=bodyType%2Ceq%2CStar";
  static const String _dwarfPlanets =
      "https://api.le-systeme-solaire.net/rest.php/bodies?filter%5B%5D=bodyType%2Ceq%2CDwarf%20Planet";
  static const String _asteroids =
      "https://api.le-systeme-solaire.net/rest.php/bodies?filter%5B%5D=bodyType%2Ceq%2CAsteroid";
  static const String _comets = "https://api.le-systeme-solaire.net/rest.php/bodies?filter%5B%5D=bodyType%2Ceq%2CComet";

  Future<SolarSystemModel> getAllBodies() async => _getHttp(_allBodies);
  Future<SolarSystemModel> getPlanets() async => _getHttp(_planets);
  Future<SolarSystemModel> getMoons() async => _getHttp(_moons);
  Future<SolarSystemModel> getSun() async => _getHttp(_sun);
  Future<SolarSystemModel> getDwarfPlanets() async => _getHttp(_dwarfPlanets);
  Future<SolarSystemModel> getAsteroids() async => _getHttp(_asteroids);
  Future<SolarSystemModel> getComets() async => _getHttp(_comets);

  Future<SolarSystemModel> _getHttp(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return bodyFromMap(response.body);
    } else {
      throw Exception("Failed to load bodies");
    }
  }
}

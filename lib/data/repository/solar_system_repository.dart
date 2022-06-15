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

  Future<SolarSystem> getAllBodies() async => _getHttp(_allBodies);
  Future<SolarSystem> getPlanets() async => _getHttp(_planets);
  Future<SolarSystem> getMoons() async => _getHttp(_moons);
  Future<SolarSystem> getSun() async => _getHttp(_sun);
  Future<SolarSystem> getDwarfPlanets() async => _getHttp(_dwarfPlanets);
  Future<SolarSystem> getAsteroids() async => _getHttp(_asteroids);
  Future<SolarSystem> getComets() async => _getHttp(_comets);

  Future<SolarSystem> _getHttp(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return solarSystemFromMap(response.body);
    } else {
      throw Exception("Failed to load bodies");
    }
  }
}

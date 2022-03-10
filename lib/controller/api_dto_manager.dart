import 'dart:convert';
import 'dart:math';
import 'package:flutter_space_data/model/solar_system.dart';
import 'package:http/http.dart' as http;

import '../model/body.dart';
import '../model/body_type.dart';
import '../model/gallery.dart';

// ! Remove after
void main() {
  DTOManager.jsonToSolarSystem();
}

class DTOManager {
  static Future<SolarSystem> jsonToSolarSystem() async {
    // * API request
    var response = jsonDecode(await http
        .read(Uri.parse('https://api.le-systeme-solaire.net/rest/bodies/')));
    var jsonBodies = response['bodies'];

    // * Mapping
    List<Body> bodies = [];
    for (Map jsonBody in jsonBodies) {
      Body body = await DTOManager._jsonToBody(jsonBody);
      print(body);
      bodies.add(body);
    }

    return SolarSystem(bodies);
  }

  static Future<Body> _jsonToBody(Map jsonBody) async {
    String id = jsonBody['id'];
    String name = jsonBody['name'];
    String englishName = jsonBody['englishName'];
    bool isPlanet = jsonBody['isPlanet'];
    List<String>? moons;

    if (jsonBody['moon'] != null) {
      moons = [];
      for (Map moon in jsonBody['moons']) {
        moons.add(moon['moon']);
      }
    } else {
      moons = null;
    }

    int semimajorAxis = jsonBody['semimajorAxis'];
    int perihelion = jsonBody['perihelion'];
    double eccentricity = jsonBody['eccentricity'];
    double inclination = jsonBody['inclination'];
    double? mass = (jsonBody['mass'] != null)
        ? jsonBody['mass']['massValue'] *
            pow(10, jsonBody['mass']['massExponent'])
        : null;
    double? vol = (jsonBody['vol'] != null)
        ? jsonBody['vol']['volValue'] * pow(10, jsonBody['vol']['volExponent'])
        : null;
    double density = jsonBody['density'];
    double gravity = jsonBody['gravity'];
    double escape = jsonBody['escape'];
    double meanRadius = jsonBody['meanRadius'];
    double equaRadius = jsonBody['equaRadius'];
    double polarRadius = jsonBody['polarRadius'];
    double flattening = jsonBody['flattening'];
    String dimension = jsonBody['dimension'];
    double sideralOrbit = jsonBody['sideralOrbit'];
    double sideralRotation = jsonBody['sideralRotation'];
    String? aroundPlanet =
        (jsonBody['aroudPlanet'] != null) ? jsonBody['aroudPlanet'] : null;
    String discoveredBy = jsonBody['discoveredBy'];
    String discoveryDate = jsonBody['discoveryDate'];
    String alternativeName = jsonBody['alternativeName'];
    double axialTilt = jsonBody['axialTilt'].toDouble();
    int avgTemp = jsonBody['avgTemp'];
    double mainAnomaly = jsonBody['mainAnomaly'];
    double argPeriapsis = jsonBody['argPeriapsis'];
    double longAscNode = jsonBody['longAscNode'];
    BodyType? bodyType;
    switch (jsonBody['bodyType']) {
      case 'Asteroid':
        {
          bodyType = BodyType.asteroid;
        }
        break;
      case 'Comet':
        {
          bodyType = BodyType.comet;
        }
        break;
      case 'Dwarf Planet':
        {
          bodyType = BodyType.dwarfPlanet;
        }
        break;
      case 'Moon':
        {
          bodyType = BodyType.moon;
        }
        break;
      case 'Planet':
        {
          bodyType = BodyType.planet;
        }
        break;
      case 'Star':
        {
          bodyType = BodyType.star;
        }
    }
    Gallery gallery = await DTOManager._jsonToGallery(englishName);

    return Body(
      id: id,
      name: name,
      englishName: englishName,
      isPlanet: isPlanet,
      moons: moons,
      semimajorAxis: semimajorAxis,
      perihelion: perihelion,
      eccentricity: eccentricity,
      inclination: inclination,
      mass: mass,
      vol: vol,
      density: density,
      gravity: gravity,
      escape: escape,
      meanRadius: meanRadius,
      equaRadius: equaRadius,
      polarRadius: polarRadius,
      flattening: flattening,
      dimension: dimension,
      sideralOrbit: sideralOrbit,
      sideralRotation: sideralRotation,
      aroundPlanet: aroundPlanet,
      discoveredBy: discoveredBy,
      discoveryDate: discoveryDate,
      alternativeName: alternativeName,
      axialTilt: axialTilt,
      avgTemp: avgTemp,
      mainAnomaly: mainAnomaly,
      argPeriapsis: argPeriapsis,
      longAscNode: longAscNode,
      bodyType: bodyType,
      gallery: gallery,
    );
  }

  static Future<Gallery> _jsonToGallery(String bodyName) async {
    // * API request
    var response = jsonDecode(await http
        .read(Uri.parse('https://images-api.nasa.gov/search?q=$bodyName')));
    var jsonPictures = response['collection']['items'];

    // * Mapping
    List<String> pictures = [];

    for (Map mapPicture in jsonPictures) {
      if (mapPicture['data'][0]['media_type'] == 'image') {
        pictures.add(mapPicture['links'][0]['href']);
      }
    }

    return Gallery(pictures);
  }
}

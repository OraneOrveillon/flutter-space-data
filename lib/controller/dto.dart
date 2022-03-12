import 'dart:math';
import 'package:flutter_space_data/controller/api.dart';
import 'package:flutter_space_data/model/solar_system.dart';

import '../model/body.dart';
import '../model/body_type.dart';
import '../model/gallery.dart';

// TODO Remove after
Future<void> main() async {
  // ? Don't forget 'await' keyword
  DTOManager.jsonToSolarSystem(await APIManager.apiBodies());
}

/// Converts json data into objects
class DTOManager {
  /// Transforms a list of [jsonBodies] into a [SolarSystem]
  static Future<SolarSystem> jsonToSolarSystem(List jsonBodies) async {
    List<Body> bodies = [];
    for (Map jsonBody in jsonBodies) {
      Body body = await DTOManager._jsonToBody(jsonBody);
      print(body);
      bodies.add(body);
    }

    return SolarSystem(bodies);
  }

  /// Transforms a [jsonBody] into a [Body]
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
    // ? Don't forget 'await' keyword
    Gallery gallery = await DTOManager._jsonToGallery(
        await APIManager.apiPictures(englishName));

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

  /// Transforms a list of [jsonPictures] into a [Gallery]
  static Future<Gallery> _jsonToGallery(List jsonPictures) async {
    List<String> pictures = [];

    for (Map jsonPicture in jsonPictures) {
      if (jsonPicture['data'][0]['media_type'] == 'image') {
        pictures.add(jsonPicture['links'][0]['href']);
      }
    }

    return Gallery(pictures);
  }
}

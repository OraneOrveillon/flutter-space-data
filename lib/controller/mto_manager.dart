import 'dart:math';

import '../model/body.dart';
import '../model/body_type.dart';
import '../model/gallery.dart';

class MapToObjectManager {
  static List<Body> mapToBodies(List<dynamic> mapBodies) {
    List<Body> bodies = [];
    for (Map mapBody in mapBodies) {
      bodies.add(MapToObjectManager.mapToBody(mapBody));
    }
    return bodies;
  }

  static Body mapToBody(Map mapBody) {
    String id = mapBody['id'];
    String name = mapBody['name'];
    String englishName = mapBody['englishName'];
    bool isPlanet = mapBody['isPlanet'];
    List<String>? moons;

    if (mapBody['moon']) {
      moons = [];
      for (Map moon in mapBody['moons']) {
        moons.add(moon['moon']);
      }
    } else {
      moons = null;
    }

    int semimajorAxis = mapBody['semimajorAxis'];
    int perihelion = mapBody['perihelion'];
    double eccentricity = mapBody['eccentricity'];
    double inclination = mapBody['inclination'];
    double mass = (mapBody['mass'])
        ? mapBody['mass']['massValue'] *
            pow(10, mapBody['mass']['massExponent'])
        : null;
    double vol = (mapBody['vol'])
        ? mapBody['vol']['volValue'] * pow(10, mapBody['vol']['volExponent'])
        : null;
    double density = mapBody['density'];
    double gravity = mapBody['gravity'];
    double escape = mapBody['escape'];
    double meanRadius = mapBody['meanRadius'];
    double equaRadius = mapBody['equaRadius'];
    double polarRadius = mapBody['polarRadius'];
    double flattening = mapBody['flattening'];
    String dimension = mapBody['dimension'];
    double sideralOrbit = mapBody['sideralOrbit'];
    double sideralRotation = mapBody['sideralRotation'];
    String? aroundPlanet =
        (mapBody['aroudPlanet']) ? mapBody['aroudPlanet'] : null;
    String discoveredBy = mapBody['discoveredBy'];
    String discoveryDate = mapBody['discoveryDate'];
    String alternativeName = mapBody['alternativeName'];
    double axialTilt = mapBody['axialTilt'];
    int avgTemp = mapBody['avgTemp'];
    double mainAnomaly = mapBody['mainAnomaly'];
    double argPeriapsis = mapBody['argPeriapsis'];
    double longAscNode = mapBody['longAscNode'];
    BodyType? bodyType;
    switch (mapBody['bodyType']) {
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

    return Body(
      id,
      name,
      englishName,
      isPlanet,
      moons,
      semimajorAxis,
      perihelion,
      eccentricity,
      inclination,
      mass,
      vol,
      density,
      gravity,
      escape,
      meanRadius,
      equaRadius,
      polarRadius,
      flattening,
      dimension,
      sideralOrbit,
      sideralRotation,
      aroundPlanet,
      discoveredBy,
      discoveryDate,
      alternativeName,
      axialTilt,
      avgTemp,
      mainAnomaly,
      argPeriapsis,
      longAscNode,
      bodyType,
      null,
    );
  }

  static Gallery mapToGallery(List<Map> mapPictures) {
    List<String> pictures = [];

    if (mapPictures.isNotEmpty) {
      for (Map mapPicture in mapPictures) {
        if (mapPicture['data'][0]['media_type'] == 'image') {
          pictures.add(mapPicture['links'][0]['href']);
        }
      }
    }

    return Gallery(pictures);
  }
}

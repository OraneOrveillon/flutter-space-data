import 'body_type.dart';
import 'gallery.dart';

/// A celestial object with a bunch of characteristics
class Body {
  final String id;
  final String name;
  final String englishName;
  final bool isPlanet;
  final List<String>? moons;
  final int semimajorAxis;
  final int perihelion;
  final double eccentricity;
  final double inclination;
  final double? mass;
  final double? vol;
  final double density;
  final double gravity;
  final double escape;
  final double meanRadius;
  final double equaRadius;
  final double polarRadius;
  final double flattening;
  final String dimension;
  final double sideralOrbit;
  final double sideralRotation;
  final String? aroundPlanet;
  final String discoveredBy;
  final String discoveryDate;
  final String alternativeName;
  final double axialTilt;
  final int avgTemp;
  final double mainAnomaly;
  final double argPeriapsis;
  final double longAscNode;
  final BodyType? bodyType;
  final Gallery gallery;

  Body({
    required this.id,
    required this.name,
    required this.englishName,
    required this.isPlanet,
    required this.moons,
    required this.semimajorAxis,
    required this.perihelion,
    required this.eccentricity,
    required this.inclination,
    required this.mass,
    required this.vol,
    required this.density,
    required this.gravity,
    required this.escape,
    required this.meanRadius,
    required this.equaRadius,
    required this.polarRadius,
    required this.flattening,
    required this.dimension,
    required this.sideralOrbit,
    required this.sideralRotation,
    required this.aroundPlanet,
    required this.discoveredBy,
    required this.discoveryDate,
    required this.alternativeName,
    required this.axialTilt,
    required this.avgTemp,
    required this.mainAnomaly,
    required this.argPeriapsis,
    required this.longAscNode,
    required this.bodyType,
    required this.gallery,
  });

  @override
  String toString() {
    return "Nom : $name\n"
        "Type d'astre : $bodyType\n"
        "Nombre d'images : $gallery\n\n";
  }
}

import 'dart:convert';

SolarSystemModel bodyFromMap(String str) => SolarSystemModel.fromMap(json.decode(str));

String bodyToMap(SolarSystemModel data) => json.encode(data.toMap());

class SolarSystemModel {
  SolarSystemModel({
    required this.bodies,
  });

  final List<BodyModel> bodies;

  factory SolarSystemModel.fromMap(Map<String, dynamic> json) => SolarSystemModel(
        bodies: List<BodyModel>.from(json["bodies"].map((x) => BodyModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "bodies": List<dynamic>.from(bodies.map((x) => x.toMap())),
      };
}

class BodyModel {
  BodyModel({
    required this.id,
    required this.name,
    required this.englishName,
    required this.isPlanet,
    required this.moons,
    required this.semimajorAxis,
    required this.perihelion,
    required this.aphelion,
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
    required this.rel,
  });

  final String id;
  final String name;
  final String englishName;
  final bool isPlanet;
  final List<Moon>? moons;
  final int semimajorAxis;
  final int perihelion;
  final int aphelion;
  final double eccentricity;
  final double inclination;
  final Mass? mass;
  final Vol? vol;
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
  final AroundPlanet? aroundPlanet;
  final String discoveredBy;
  final String discoveryDate;
  final String alternativeName;
  final double axialTilt;
  final int avgTemp;
  final double mainAnomaly;
  final double argPeriapsis;
  final double longAscNode;
  final BodyType bodyType;
  final String rel;

  factory BodyModel.fromMap(Map<String, dynamic> json) => BodyModel(
        id: json["id"],
        name: json["name"],
        englishName: json["englishName"],
        isPlanet: json["isPlanet"],
        moons: json["moons"] == null ? null : List<Moon>.from(json["moons"].map((x) => Moon.fromMap(x))),
        semimajorAxis: json["semimajorAxis"],
        perihelion: json["perihelion"],
        aphelion: json["aphelion"],
        eccentricity: json["eccentricity"].toDouble(),
        inclination: json["inclination"].toDouble(),
        mass: json["mass"] == null ? null : Mass.fromMap(json["mass"]),
        vol: json["vol"] == null ? null : Vol.fromMap(json["vol"]),
        density: json["density"].toDouble(),
        gravity: json["gravity"].toDouble(),
        escape: json["escape"].toDouble(),
        meanRadius: json["meanRadius"].toDouble(),
        equaRadius: json["equaRadius"].toDouble(),
        polarRadius: json["polarRadius"].toDouble(),
        flattening: json["flattening"].toDouble(),
        dimension: json["dimension"],
        sideralOrbit: json["sideralOrbit"].toDouble(),
        sideralRotation: json["sideralRotation"].toDouble(),
        aroundPlanet: json["aroundPlanet"] == null ? null : AroundPlanet.fromMap(json["aroundPlanet"]),
        discoveredBy: json["discoveredBy"],
        discoveryDate: json["discoveryDate"],
        alternativeName: json["alternativeName"],
        axialTilt: json["axialTilt"].toDouble(),
        avgTemp: json["avgTemp"],
        mainAnomaly: json["mainAnomaly"].toDouble(),
        argPeriapsis: json["argPeriapsis"].toDouble(),
        longAscNode: json["longAscNode"].toDouble(),
        bodyType: bodyTypeValues.map[json["bodyType"]!]!,
        rel: json["rel"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "englishName": englishName,
        "isPlanet": isPlanet,
        "moons": moons == null ? null : List<dynamic>.from(moons!.map((x) => x.toMap())),
        "semimajorAxis": semimajorAxis,
        "perihelion": perihelion,
        "aphelion": aphelion,
        "eccentricity": eccentricity,
        "inclination": inclination,
        "mass": mass?.toMap(),
        "vol": vol?.toMap(),
        "density": density,
        "gravity": gravity,
        "escape": escape,
        "meanRadius": meanRadius,
        "equaRadius": equaRadius,
        "polarRadius": polarRadius,
        "flattening": flattening,
        "dimension": dimension,
        "sideralOrbit": sideralOrbit,
        "sideralRotation": sideralRotation,
        "aroundPlanet": aroundPlanet?.toMap(),
        "discoveredBy": discoveredBy,
        "discoveryDate": discoveryDate,
        "alternativeName": alternativeName,
        "axialTilt": axialTilt,
        "avgTemp": avgTemp,
        "mainAnomaly": mainAnomaly,
        "argPeriapsis": argPeriapsis,
        "longAscNode": longAscNode,
        "bodyType": bodyTypeValues.reverse[bodyType],
        "rel": rel,
      };
}

class AroundPlanet {
  AroundPlanet({
    required this.planet,
    required this.rel,
  });

  final String planet;
  final String rel;

  factory AroundPlanet.fromMap(Map<String, dynamic> json) => AroundPlanet(
        planet: json["planet"],
        rel: json["rel"],
      );

  Map<String, dynamic> toMap() => {
        "planet": planet,
        "rel": rel,
      };
}

enum BodyType { moon, asteroid, dwarfPlanet, planet, comet, star }

final bodyTypeValues = EnumValues({
  "Asteroid": BodyType.asteroid,
  "Comet": BodyType.comet,
  "Dwarf Planet": BodyType.dwarfPlanet,
  "Moon": BodyType.moon,
  "Planet": BodyType.planet,
  "Star": BodyType.star
});

class Mass {
  Mass({
    required this.massValue,
    required this.massExponent,
  });

  final double massValue;
  final int massExponent;

  factory Mass.fromMap(Map<String, dynamic> json) => Mass(
        massValue: json["massValue"].toDouble(),
        massExponent: json["massExponent"],
      );

  Map<String, dynamic> toMap() => {
        "massValue": massValue,
        "massExponent": massExponent,
      };
}

class Moon {
  Moon({
    required this.moon,
    required this.rel,
  });

  final String moon;
  final String rel;

  factory Moon.fromMap(Map<String, dynamic> json) => Moon(
        moon: json["moon"],
        rel: json["rel"],
      );

  Map<String, dynamic> toMap() => {
        "moon": moon,
        "rel": rel,
      };
}

class Vol {
  Vol({
    required this.volValue,
    required this.volExponent,
  });

  final double volValue;
  final int volExponent;

  factory Vol.fromMap(Map<String, dynamic> json) => Vol(
        volValue: json["volValue"].toDouble(),
        volExponent: json["volExponent"],
      );

  Map<String, dynamic> toMap() => {
        "volValue": volValue,
        "volExponent": volExponent,
      };
}

class EnumValues<T> {
  late final Map<String, T> map;
  late final Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

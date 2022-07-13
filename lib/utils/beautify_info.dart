import '../data/model/pictures_model.dart';
import '../data/model/solar_system_model.dart';

class BeautifyBodyInfo {
  final List<String> beautifiedBodyInfo = [];
  final Body body;

  BeautifyBodyInfo({required this.body}) {
    if (body.discoveredBy != '') {
      beautifiedBodyInfo.add('Discovered by : ${body.discoveredBy}');
    }
    if (body.discoveryDate != '') {
      beautifiedBodyInfo.add('Discovery date : ${body.discoveryDate}');
    }
    if (body.avgTemp != 0) {
      beautifiedBodyInfo.add('Average temperature : ${(body.avgTemp - 273.15).toStringAsFixed(2)}°C');
    }
    if (body.dimension != '') {
      beautifiedBodyInfo.add('Dimensions : ${body.dimension} km');
    }
    if (body.equaRadius != 0) {
      beautifiedBodyInfo.add('Radius : ${body.equaRadius.round()} km');
    }
    if (body.semimajorAxis != 0) {
      beautifiedBodyInfo.add('Semi major axis : ${body.semimajorAxis} km');
    }
    if (body.perihelion != 0) {
      beautifiedBodyInfo.add('Perihelion : ${body.perihelion} km');
    }
    if (body.aphelion != 0) {
      beautifiedBodyInfo.add('Aphelion : ${body.aphelion} km');
    }
    if (body.eccentricity != 0) {
      beautifiedBodyInfo.add('Eccentricity : ${body.eccentricity}');
    }
    if (body.inclination != 0) {
      beautifiedBodyInfo.add('Inclination : ${body.inclination}°');
    }
    if (body.mass != null) {
      beautifiedBodyInfo.add('Mass : ${body.mass?.massValue}x10^${body.mass?.massExponent} kg');
    }
    if (body.vol != null) {
      beautifiedBodyInfo.add('Volume : ${body.vol?.volValue}x10^${body.vol?.volExponent} km^3');
    }
    if (body.density != 0) {
      beautifiedBodyInfo.add('Density : ${body.density} g.cm^3');
    }
    if (body.gravity != 0) {
      beautifiedBodyInfo.add('Gravity : ${body.gravity} m.s^-2');
    }
    if (body.escape != 0) {
      beautifiedBodyInfo.add('Escape : ${body.escape} m.s^-1');
    }
    if (body.sideralOrbit != 0) {
      beautifiedBodyInfo.add('Sidereal orbit : ${body.sideralOrbit} earth days');
    }
    if (body.sideralRotation != 0) {
      beautifiedBodyInfo.add('Sidereal rotation : ${body.sideralRotation} hours');
    }
    if (body.axialTilt != 0) {
      beautifiedBodyInfo.add('Axial tilt : ${body.axialTilt}');
    }
    if (body.mainAnomaly != 0) {
      beautifiedBodyInfo.add('Main anomaly : ${body.mainAnomaly}°');
    }
    if (body.argPeriapsis != 0) {
      beautifiedBodyInfo.add('Argument of perihelion : ${body.argPeriapsis}°');
    }
    if (body.longAscNode != 0) {
      beautifiedBodyInfo.add('Longitude of ascending node :  ${body.longAscNode}°');
    }
    if (body.moons != null) {
      beautifiedBodyInfo.add('Moons : ');
    }
  }
}

class BeautifyPictureInfo {
  final List<String> beautifiedPictureInfo = [];
  final Datum pictureData;

  BeautifyPictureInfo({required this.pictureData}) {
    if (pictureData.title != null) {
      beautifiedPictureInfo.add('Title : ${pictureData.title}');
    }
    if (pictureData.dateCreated != null) {
      beautifiedPictureInfo.add('Creation date : ${pictureData.dateCreated}');
    }
    if (pictureData.location != null) {
      beautifiedPictureInfo.add('Location : ${pictureData.location}');
    }
    if (pictureData.photographer != null) {
      beautifiedPictureInfo.add('Photographer : ${pictureData.photographer}');
    }
    if (pictureData.secondaryCreator != null) {
      beautifiedPictureInfo.add('Secondary creator : ${pictureData.secondaryCreator}');
    }
    if (pictureData.description != null) {
      beautifiedPictureInfo.add('Description : ${pictureData.description}');
    }
    if (pictureData.description508 != null) {
      beautifiedPictureInfo.add('${pictureData.description508}');
    }
  }
}

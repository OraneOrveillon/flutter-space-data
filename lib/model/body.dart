import 'body_type.dart';
import 'gallery.dart';

class Body {
  final String _id;
  final String _name;
  final String _englishName;
  final bool _isPlanet;
  final List<String>? _moons;
  final int _semimajorAxis;
  final int _perihelion;
  final double _eccentricity;
  final double _inclination;
  final double _mass;
  final double _vol;
  final double _density;
  final double _gravity;
  final double _escape;
  final double _meanRadius;
  final double _equaRadius;
  final double _polarRadius;
  final double _flattening;
  final String _dimension;
  final double _sideralOrbit;
  final double _sideralRotation;
  final String? _aroundPlanet;
  final String _discoveredBy;
  final String _discoveryDate;
  final String _alternativeName;
  final double _axialTilt;
  final int _avgTemp;
  final double _mainAnomaly;
  final double _argPeriapsis;
  final double _longAscNode;
  final BodyType? _bodyType;
  final Gallery? _gallery;

  Body(
      this._id,
      this._name,
      this._englishName,
      this._isPlanet,
      this._moons,
      this._semimajorAxis,
      this._perihelion,
      this._eccentricity,
      this._inclination,
      this._mass,
      this._vol,
      this._density,
      this._gravity,
      this._escape,
      this._meanRadius,
      this._equaRadius,
      this._polarRadius,
      this._flattening,
      this._dimension,
      this._sideralOrbit,
      this._sideralRotation,
      this._aroundPlanet,
      this._discoveredBy,
      this._discoveryDate,
      this._alternativeName,
      this._axialTilt,
      this._avgTemp,
      this._mainAnomaly,
      this._argPeriapsis,
      this._longAscNode,
      this._bodyType,
      this._gallery);
}

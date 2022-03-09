from typing import List

from models.body import BodyType
from models.body import Body
from models.gallery import Gallery
from services.api_manager import APIManager


class DTOManager:
    """Converts json data into objects"""

    @staticmethod
    def json_to_bodies(json_bodies: {}) -> List[Body]:
        """
        :param json_bodies: A list of bodies in json format
        :return: A list of objects Body
        """
        bodies = []
        for json_body in json_bodies:
            bodies.append(DTOManager._json_to_body(json_body))
        return bodies

    @staticmethod
    def _json_to_body(json_body: {}) -> 'Body':
        """
        :param json_body: A body in json format
        :return: An object Body
        """
        id = json_body['id']
        name = json_body['name']
        english_name = json_body['englishName']
        is_planet = json_body['isPlanet']

        if json_body['moons']:
            moons = []
            for moon in json_body['moons']:
                moons.append(moon['moon'])
        else:
            moons = None

        semimajor_axis = json_body['semimajorAxis']
        perihelion = json_body['perihelion']
        aphelion = json_body['aphelion']
        eccentricity = json_body['eccentricity']
        inclination = json_body['inclination']
        mass = json_body['mass']['massValue'] * pow(10, json_body['mass']['massExponent']) \
            if json_body['mass'] else None
        vol = json_body['vol']['volValue'] * pow(10, json_body['vol']['volExponent']) \
            if json_body['vol'] else None
        density = json_body['density']
        gravity = json_body['gravity']
        escape = json_body['escape']
        mean_radius = json_body['meanRadius']
        equa_radius = json_body['equaRadius']
        polar_radius = json_body['polarRadius']
        flattening = json_body['flattening']
        dimension = json_body['dimension']
        sideral_orbit = json_body['sideralOrbit']
        sideral_rotation = json_body['sideralRotation']
        around_planet = json_body['aroundPlanet']['planet'] if json_body['aroundPlanet'] else None
        discovered_by = json_body['discoveredBy']
        discovery_date = json_body['discoveryDate']
        alternative_name = json_body['alternativeName']
        axial_tilt = json_body['axialTilt']
        avg_temp = json_body['avgTemp']
        main_anomaly = json_body['mainAnomaly']
        arg_periapsis = json_body['argPeriapsis']
        long_asc_node = json_body['longAscNode']

        body_type = BodyType.ASTEROID
        if json_body['bodyType'] == 'Comet':
            body_type = BodyType.COMET
        if json_body['bodyType'] == 'Dwarf Planet':
            body_type = BodyType.DWARF_PLANET
        if json_body['bodyType'] == 'Moon':
            body_type = BodyType.MOON
        if json_body['bodyType'] == 'Planet':
            body_type = BodyType.PLANET
        if json_body['bodyType'] == 'Star':
            body_type = BodyType.STAR

        return Body(id, name, english_name, is_planet, moons, semimajor_axis, perihelion, aphelion,
                    eccentricity, inclination, mass, vol, density, gravity, escape, mean_radius, equa_radius,
                    polar_radius, flattening, dimension, sideral_orbit, sideral_rotation, around_planet, discovered_by,
                    discovery_date, alternative_name, axial_tilt, avg_temp, main_anomaly, arg_periapsis, long_asc_node,
                    body_type, None)

    @staticmethod
    def json_to_gallery(json_pictures: {}) -> Gallery:
        """
        :param json_pictures: A list of pictures in json format
        :return: An object Gallery
        """
        pictures = []

        if json_pictures:
            for json_picture in json_pictures:
                if json_picture['data'][0]['media_type'] == 'image':
                    pictures.append(json_picture['links'][0]['href'])

        return Gallery(pictures)

from dataclasses import dataclass
from typing import Optional, List

from models.body_type import BodyType
from models.gallery import Gallery


@dataclass
class Body:
    _id: str
    _name: str
    _english_name: str
    _is_planet: bool
    _moons: Optional[List[str]]
    _semimajor_axis: int
    _perihelion: int
    _aphelion: int
    _eccentricity: float
    _inclination: float
    _mass: float
    _vol: float
    _density: float
    _gravity: float
    _escape: float
    _mean_radius: float
    _equa_radius: float
    _polar_radius: float
    _flattening: float
    _dimension: str
    _sideral_orbit: float
    _sideral_rotation: float
    _around_planet: str
    _discovered_by: str
    _discovery_date: str
    _alternative_name: str
    _axial_tilt: float
    _avg_temp: int
    _main_anomaly: float
    _arg_periapsis: float
    _long_asc_node: float
    _body_type: BodyType
    # Pictures getted from NASA's API
    _gallery: Optional[Gallery]

part of 'solar_system_bloc.dart';

@immutable
abstract class SolarSystemEvent extends Equatable {
  const SolarSystemEvent();

  @override
  List<Object> get props => [];
}

class LoadSolarSystem extends SolarSystemEvent {}

class LoadPlanets extends SolarSystemEvent {}

class LoadMoons extends SolarSystemEvent {}

class LoadSun extends SolarSystemEvent {}

class LoadDwarfPlanets extends SolarSystemEvent {}

class LoadAsteroids extends SolarSystemEvent {}

class LoadComets extends SolarSystemEvent {}

class LoadSingleBody extends SolarSystemEvent {
  final String bodyUrl;

  const LoadSingleBody({required this.bodyUrl});

  @override
  List<Object> get props => [bodyUrl];
}

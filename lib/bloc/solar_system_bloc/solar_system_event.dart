part of 'solar_system_bloc.dart';

@immutable
abstract class SolarSystemEvent extends Equatable {
  const SolarSystemEvent();
}

class LoadSolarSystemEvent extends SolarSystemEvent {
  @override
  List<Object> get props => [];
}

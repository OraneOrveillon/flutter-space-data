part of 'solar_system_bloc.dart';

@immutable
abstract class SolarSystemState extends Equatable {}

class SolarSystemLoadingState extends SolarSystemState {
  @override
  List<Object?> get props => [];
}

class SolarSystemLoadedState extends SolarSystemState {
  final SolarSystemModel solarSystem;

  SolarSystemLoadedState(this.solarSystem);

  @override
  List<Object?> get props => [solarSystem];
}

class SolarSystemErrorState extends SolarSystemState {
  final String error;

  SolarSystemErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

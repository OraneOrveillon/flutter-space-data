part of 'solar_system_bloc.dart';

@immutable
abstract class SolarSystemState extends Equatable {}

class SolarSystemLoading extends SolarSystemState {
  @override
  List<Object?> get props => [];
}

class SolarSystemLoaded extends SolarSystemState {
  final SolarSystem solarSystem;

  SolarSystemLoaded(this.solarSystem);

  @override
  List<Object?> get props => [solarSystem];
}

class SingleBodyLoaded extends SolarSystemState {
  final Body body;

  SingleBodyLoaded(this.body);

  @override
  List<Object?> get props => [body];
}

class SolarSystemError extends SolarSystemState {
  final String error;

  SolarSystemError(this.error);

  @override
  List<Object?> get props => [error];
}

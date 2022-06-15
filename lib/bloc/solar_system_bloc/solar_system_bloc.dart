import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_space_data/data/model/solar_system_model.dart';
import 'package:flutter_space_data/data/repository/solar_system_repository.dart';

part 'solar_system_event.dart';
part 'solar_system_state.dart';

class SolarSystemBloc extends Bloc<SolarSystemEvent, SolarSystemState> {
  final SolarSystemRepository _solarSystemRepository;

  void test() {
    print('cc');
  }

  // TODO : Refactoring
  SolarSystemBloc(this._solarSystemRepository) : super(SolarSystemLoadingState()) {
    on<LoadSolarSystemEvent>((event, emit) async {
      emit(SolarSystemLoadingState());
      try {
        final solarSystem = await _solarSystemRepository.getAllBodies();
        emit(SolarSystemLoadedState(solarSystem));
      } catch (e) {
        emit(SolarSystemErrorState(e.toString()));
      }
    });
  }

  SolarSystemBloc.planets(this._solarSystemRepository) : super(SolarSystemLoadingState()) {
    on<LoadSolarSystemEvent>((event, emit) async {
      emit(SolarSystemLoadingState());
      try {
        final solarSystem = await _solarSystemRepository.getPlanets();
        emit(SolarSystemLoadedState(solarSystem));
      } catch (e) {
        emit(SolarSystemErrorState(e.toString()));
      }
    });
  }

  SolarSystemBloc.moons(this._solarSystemRepository) : super(SolarSystemLoadingState()) {
    on<LoadSolarSystemEvent>((event, emit) async {
      emit(SolarSystemLoadingState());
      try {
        final solarSystem = await _solarSystemRepository.getMoons();
        emit(SolarSystemLoadedState(solarSystem));
      } catch (e) {
        emit(SolarSystemErrorState(e.toString()));
      }
    });
  }

  SolarSystemBloc.sun(this._solarSystemRepository) : super(SolarSystemLoadingState()) {
    on<LoadSolarSystemEvent>((event, emit) async {
      emit(SolarSystemLoadingState());
      try {
        final solarSystem = await _solarSystemRepository.getSun();
        emit(SolarSystemLoadedState(solarSystem));
      } catch (e) {
        emit(SolarSystemErrorState(e.toString()));
      }
    });
  }

  SolarSystemBloc.dwarfPlanets(this._solarSystemRepository) : super(SolarSystemLoadingState()) {
    on<LoadSolarSystemEvent>((event, emit) async {
      emit(SolarSystemLoadingState());
      try {
        final solarSystem = await _solarSystemRepository.getDwarfPlanets();
        emit(SolarSystemLoadedState(solarSystem));
      } catch (e) {
        emit(SolarSystemErrorState(e.toString()));
      }
    });
  }

  SolarSystemBloc.asteroids(this._solarSystemRepository) : super(SolarSystemLoadingState()) {
    on<LoadSolarSystemEvent>((event, emit) async {
      emit(SolarSystemLoadingState());
      try {
        final solarSystem = await _solarSystemRepository.getAsteroids();
        emit(SolarSystemLoadedState(solarSystem));
      } catch (e) {
        emit(SolarSystemErrorState(e.toString()));
      }
    });
  }

  SolarSystemBloc.comets(this._solarSystemRepository) : super(SolarSystemLoadingState()) {
    on<LoadSolarSystemEvent>((event, emit) async {
      emit(SolarSystemLoadingState());
      try {
        final solarSystem = await _solarSystemRepository.getComets();
        emit(SolarSystemLoadedState(solarSystem));
      } catch (e) {
        emit(SolarSystemErrorState(e.toString()));
      }
    });
  }
}

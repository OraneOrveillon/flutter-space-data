import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_space_data/data/model/solar_system_model.dart';
import 'package:flutter_space_data/data/repository/solar_system_repository.dart';

part 'solar_system_event.dart';
part 'solar_system_state.dart';

class SolarSystemBloc extends Bloc<SolarSystemEvent, SolarSystemState> {
  final SolarSystemRepository _solarSystemRepository = SolarSystemRepository();

  SolarSystemBloc() : super(SolarSystemLoading()) {
    on<LoadSolarSystem>(_onLoadSolarSystem);
    on<LoadPlanets>(_onLoadPlanets);
    on<LoadMoons>(_onLoadMoons);
    on<LoadSun>(_onLoadSun);
    on<LoadDwarfPlanets>(_onLoadDwarfPlanets);
    on<LoadAsteroids>(_onLoadAsteroids);
    on<LoadComets>(_onLoadComets);
  }

  Future<void> _onLoadSolarSystem(LoadSolarSystem event, Emitter<SolarSystemState> emit) async {
    emit(SolarSystemLoading());
    try {
      final solarSystem = await _solarSystemRepository.getAllBodies();
      emit(SolarSystemLoaded(solarSystem));
    } catch (e) {
      emit(SolarSystemError(e.toString()));
    }
  }

  Future<void> _onLoadPlanets(LoadPlanets event, Emitter<SolarSystemState> emit) async {
    emit(SolarSystemLoading());
    try {
      final planets = await _solarSystemRepository.getPlanets();
      emit(SolarSystemLoaded(planets));
    } catch (e) {
      emit(SolarSystemError(e.toString()));
    }
  }

  Future<void> _onLoadMoons(LoadMoons event, Emitter<SolarSystemState> emit) async {
    emit(SolarSystemLoading());
    try {
      final moons = await _solarSystemRepository.getMoons();
      emit(SolarSystemLoaded(moons));
    } catch (e) {
      emit(SolarSystemError(e.toString()));
    }
  }

  Future<void> _onLoadSun(LoadSun event, Emitter<SolarSystemState> emit) async {
    emit(SolarSystemLoading());
    try {
      final sun = await _solarSystemRepository.getSun();
      emit(SolarSystemLoaded(sun));
    } catch (e) {
      emit(SolarSystemError(e.toString()));
    }
  }

  Future<void> _onLoadDwarfPlanets(LoadDwarfPlanets event, Emitter<SolarSystemState> emit) async {
    emit(SolarSystemLoading());
    try {
      final dwarfPlanets = await _solarSystemRepository.getDwarfPlanets();
      emit(SolarSystemLoaded(dwarfPlanets));
    } catch (e) {
      emit(SolarSystemError(e.toString()));
    }
  }

  Future<void> _onLoadAsteroids(LoadAsteroids event, Emitter<SolarSystemState> emit) async {
    emit(SolarSystemLoading());
    try {
      final asteroids = await _solarSystemRepository.getAsteroids();
      emit(SolarSystemLoaded(asteroids));
    } catch (e) {
      emit(SolarSystemError(e.toString()));
    }
  }

  Future<void> _onLoadComets(LoadComets event, Emitter<SolarSystemState> emit) async {
    emit(SolarSystemLoading());
    try {
      final comets = await _solarSystemRepository.getComets();
      emit(SolarSystemLoaded(comets));
    } catch (e) {
      emit(SolarSystemError(e.toString()));
    }
  }
}

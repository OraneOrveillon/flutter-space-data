import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_space_data/data/model/solar_system_model.dart';
import 'package:flutter_space_data/data/repository/solar_system_repository.dart';

part 'solar_system_event.dart';
part 'solar_system_state.dart';

class SolarSystemBloc extends Bloc<SolarSystemEvent, SolarSystemState> {
  final SolarSystemRepository _solarSystemRepository;

  SolarSystemBloc(this._solarSystemRepository) : super(SolarSystemLoadingState()) {
    on<LoadSolarSystemEvent>((event, emit) async {
      emit(SolarSystemLoadingState());
      try {
        final solarSystem = await _solarSystemRepository.getSolarSystem();
        emit(SolarSystemLoadedState(solarSystem));
      } catch (e) {
        emit(SolarSystemErrorState(e.toString()));
      }
    });
  }
}

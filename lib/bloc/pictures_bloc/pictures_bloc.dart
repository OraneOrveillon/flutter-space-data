import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_space_data/data/model/pictures_model.dart';
import 'package:flutter_space_data/data/repository/pictures_repository.dart';

part 'pictures_event.dart';
part 'pictures_state.dart';

class PicturesBloc extends Bloc<PicturesEvent, PicturesState> {
  final PicturesRepository _picturesRepository;

  PicturesBloc(this._picturesRepository) : super(PicturesLoadingState()) {
    on<LoadPicturesEvent>((event, emit) async {
      emit(PicturesLoadingState());
      try {
        final solarSystem = await _picturesRepository.getPictures();
        emit(PicturesLoadedState(solarSystem));
      } catch (e) {
        emit(PicturesErrorState(e.toString()));
      }
    });
  }
}

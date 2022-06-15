import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_space_data/data/model/pictures_model.dart';
import 'package:flutter_space_data/data/repository/pictures_repository.dart';

part 'pictures_event.dart';
part 'pictures_state.dart';

class PicturesBloc extends Bloc<PicturesEvent, PicturesState> {
  late final PicturesRepository _picturesRepository;
  final String bodyName;

  PicturesBloc({required this.bodyName}) : super(PicturesLoading()) {
    _picturesRepository = PicturesRepository(bodyName: bodyName);
    on<LoadPictures>((event, emit) async {
      emit(PicturesLoading());
      try {
        final pictures = await _picturesRepository.getPictures();
        emit(PicturesLoaded(pictures));
      } catch (e) {
        emit(PicturesError(e.toString()));
      }
    });
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/pictures_model.dart';
import '../../data/repository/pictures_repository.dart';

part 'pictures_event.dart';
part 'pictures_state.dart';

class PicturesBloc extends Bloc<PicturesEvent, PicturesState> {
  late PicturesRepository _picturesRepository;

  PicturesBloc() : super(PicturesLoading()) {
    on<LoadPictures>(_onLoadPictures);
    on<LoadPicturesWithPage>(_onLoadPicturesWithPage);
  }

  Future<void> _onLoadPictures(LoadPictures event, Emitter<PicturesState> emit) async {
    _picturesRepository = PicturesRepository(bodyName: event.bodyName);
    return _getPictures(event, emit);
  }

  Future<void> _onLoadPicturesWithPage(LoadPicturesWithPage event, Emitter<PicturesState> emit) async {
    _picturesRepository = PicturesRepository(url: event.url);
    return _getPictures(event, emit);
  }

  Future<void> _getPictures(PicturesEvent event, Emitter<PicturesState> emit) async {
    try {
      final pictures = await _picturesRepository.getPictures();
      emit(PicturesLoaded(pictures));
    } catch (e) {
      emit(PicturesError(e.toString()));
    }
  }
}

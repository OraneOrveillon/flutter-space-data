import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_space_data/data/model/body_model.dart';
import 'package:flutter_space_data/data/repository/body_repository.dart';

part 'body_event.dart';
part 'body_state.dart';

class BodyBloc extends Bloc<BodyEvent, BodyState> {
  final BodyRepository _bodyRepository;

  BodyBloc(this._bodyRepository) : super(BodyLoadingState()) {
    on<LoadBodyEvent>((event, emit) async {
      emit(BodyLoadingState());
      try {
        final joke = await _bodyRepository.getJoke();
        emit(BodyLoadedState(joke));
      } catch (e) {
        emit(BodyErrorState(e.toString()));
      }
    });
  }
}

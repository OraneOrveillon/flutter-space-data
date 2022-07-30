import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_space_data/data/repository/wiki_repository.dart';

part 'wiki_event.dart';
part 'wiki_state.dart';

class WikiBloc extends Bloc<WikiEvent, WikiState> {
  late WikiRepository _wikiRepository;

  WikiBloc() : super(WikiLoading()) {
    on<LoadWiki>(_onLoadWiki);
  }

  Future<void> _onLoadWiki(LoadWiki event, Emitter<WikiState> emit) async {
    _wikiRepository = WikiRepository(bodyName: event.bodyName);
    emit(WikiLoading());
    try {
      final pictures = await _wikiRepository.getWiki();
      emit(WikiLoaded(pictures));
    } catch (e) {
      emit(WikiError(e.toString()));
    }
  }
}

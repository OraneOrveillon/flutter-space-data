part of 'wiki_bloc.dart';

abstract class WikiEvent extends Equatable {
  const WikiEvent();

  @override
  List<Object> get props => [];
}

class LoadWiki extends WikiEvent {
  final String bodyName;

  const LoadWiki({required this.bodyName});

  @override
  List<Object> get props => [bodyName];
}

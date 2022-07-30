part of 'wiki_bloc.dart';

@immutable
abstract class WikiState extends Equatable {}

class WikiLoading extends WikiState {
  @override
  List<Object?> get props => [];
}

class WikiLoaded extends WikiState {
  final List<dynamic> wiki;

  WikiLoaded(this.wiki);

  @override
  List<Object?> get props => [wiki];
}

class WikiError extends WikiState {
  final String error;

  WikiError(this.error);

  @override
  List<Object?> get props => [error];
}

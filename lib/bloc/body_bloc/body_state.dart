part of 'body_bloc.dart';

@immutable
abstract class BodyState extends Equatable {}

class BodyLoadingState extends BodyState {
  @override
  List<Object?> get props => [];
}

class BodyLoadedState extends BodyState {
  final BodyModel body;

  BodyLoadedState(this.body);

  @override
  List<Object?> get props => [body];
}

class BodyErrorState extends BodyState {
  final String error;

  BodyErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

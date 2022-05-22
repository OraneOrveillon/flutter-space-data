part of 'body_bloc.dart';

@immutable
abstract class BodyEvent extends Equatable {
  const BodyEvent();
}

class LoadBodyEvent extends BodyEvent {
  @override
  List<Object> get props => [];
}

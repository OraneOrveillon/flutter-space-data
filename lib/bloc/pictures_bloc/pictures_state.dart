part of 'pictures_bloc.dart';

@immutable
abstract class PicturesState extends Equatable {}

class PicturesLoading extends PicturesState {
  @override
  List<Object?> get props => [];
}

class PicturesLoaded extends PicturesState {
  final Pictures pictures;

  PicturesLoaded(this.pictures);

  @override
  List<Object?> get props => [pictures];
}

class PicturesError extends PicturesState {
  final String error;

  PicturesError(this.error);

  @override
  List<Object?> get props => [error];
}

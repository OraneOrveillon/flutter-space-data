part of 'pictures_bloc.dart';

@immutable
abstract class PicturesState extends Equatable {}

class PicturesLoadingState extends PicturesState {
  @override
  List<Object?> get props => [];
}

class PicturesLoadedState extends PicturesState {
  final PicturesModel pictures;

  PicturesLoadedState(this.pictures);

  @override
  List<Object?> get props => [pictures];
}

class PicturesErrorState extends PicturesState {
  final String error;

  PicturesErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

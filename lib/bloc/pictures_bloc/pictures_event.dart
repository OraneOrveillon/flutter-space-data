part of 'pictures_bloc.dart';

@immutable
abstract class PicturesEvent extends Equatable {
  const PicturesEvent();

  @override
  List<Object> get props => [];
}

class LoadPictures extends PicturesEvent {}

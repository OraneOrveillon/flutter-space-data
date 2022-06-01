part of 'pictures_bloc.dart';

@immutable
abstract class PicturesEvent extends Equatable {
  const PicturesEvent();
}

class LoadPicturesEvent extends PicturesEvent {
  @override
  List<Object> get props => [];
}

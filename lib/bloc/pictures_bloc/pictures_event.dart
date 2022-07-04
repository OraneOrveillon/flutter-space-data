part of 'pictures_bloc.dart';

// TODO : Doc
@immutable
abstract class PicturesEvent extends Equatable {
  const PicturesEvent();

  @override
  List<Object> get props => [];
}

class LoadPictures extends PicturesEvent {
  final String bodyName;

  const LoadPictures({required this.bodyName});

  @override
  List<Object> get props => [bodyName];
}

class LoadPicturesWithPage extends PicturesEvent {
  final String url;

  const LoadPicturesWithPage({required this.url});

  @override
  List<Object> get props => [url];
}

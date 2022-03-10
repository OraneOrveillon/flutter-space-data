class Gallery {
  final List<String> pictures;

  Gallery(this.pictures);

  @override
  String toString() {
    return pictures.length.toString();
  }
}

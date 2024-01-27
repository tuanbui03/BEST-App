class Images{
  final int imageID;
  final String image;

  Images(this.imageID, this.image);

  Map<String, dynamic> toMap() {
    return {'imageID': imageID, 'image': image};
  }
}

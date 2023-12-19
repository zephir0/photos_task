abstract class PhotoEvent {}

class LoadAllPhotos extends PhotoEvent {}

class LoadPhotosByAlbum extends PhotoEvent {
  final int albumId;

  LoadPhotosByAlbum(this.albumId);
}

class SelectAlbumEvent extends PhotoEvent {
  final int? albumId;

  SelectAlbumEvent(this.albumId);
}

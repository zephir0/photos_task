import 'package:photos_task/model/photo.dart';

abstract class PhotoState {}

class PhotosInitial extends PhotoState {}

class PhotosLoading extends PhotoState {}

class PhotosLoaded extends PhotoState {
  final List<Photo> photos;
  final int? selectedAlbumId;

  PhotosLoaded(this.photos, {this.selectedAlbumId});
}

class PhotosError extends PhotoState {}

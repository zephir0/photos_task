import 'package:photos_task/model/photo.dart';

abstract class PhotoRepository {
  Future<List<Photo>> fetchPhotos();
  Future<List<Photo>> fetchPhotosByAlbum(int albumId);
}

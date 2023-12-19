import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:photos_task/model/photo.dart';
import 'package:photos_task/repo/photo_repository.dart';

class PhotoApiDataSource implements PhotoRepository {
  @override
  Future<List<Photo>> fetchPhotos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    if (response.statusCode == 200) {
      List<dynamic> photoJson = json.decode(response.body);
      return photoJson.map((json) => Photo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }

  @override
  Future<List<Photo>> fetchPhotosByAlbum(int albumId) async {
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/photos?albumId=$albumId'));
    if (response.statusCode == 200) {
      List<dynamic> photoJson = json.decode(response.body);
      return photoJson.map((json) => Photo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}

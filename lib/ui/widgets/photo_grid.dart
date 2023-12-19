import 'package:flutter/material.dart';
import 'package:photos_task/model/photo.dart';

class PhotoGrid extends StatelessWidget {
  final List<Photo> photos;
  final int? selectedAlbumId;
  final Function(String) onImageTap;

  const PhotoGrid({
    Key? key,
    required this.photos,
    this.selectedAlbumId,
    required this.onImageTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Photo> filteredPhotos = selectedAlbumId == null
        ? photos
        : photos.where((photo) => photo.albumId == selectedAlbumId).toList();

    return GridView.builder(
      itemCount: filteredPhotos.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemBuilder: (context, index) {
        final photo = filteredPhotos[index];
        return GestureDetector(
          onTap: () => onImageTap(photo.url),
          child: Image.network(photo.thumbnailUrl, fit: BoxFit.cover),
        );
      },
    );
  }
}

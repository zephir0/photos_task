import 'package:flutter/material.dart';

class AlbumGrid extends StatelessWidget {
  final Set<int> albums;
  final Function(int) onAlbumSelected;

  const AlbumGrid({
    Key? key,
    required this.albums,
    required this.onAlbumSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: albums.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemBuilder: (context, index) {
        var albumId = albums.elementAt(index);
        return GestureDetector(
          onTap: () => onAlbumSelected(albumId),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              elevation: 4.0,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Album $albumId',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

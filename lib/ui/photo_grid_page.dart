import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos_task/bloc/photo_bloc.dart';
import 'package:photos_task/bloc/photo_event.dart';
import 'package:photos_task/bloc/photo_state.dart';
import 'package:photos_task/ui/widgets/album_grid.dart';
import 'package:photos_task/ui/widgets/photo_grid.dart';
import 'package:photos_task/ui/widgets/photo_menu.dart';

class PhotoGridPage extends StatefulWidget {
  const PhotoGridPage({super.key});

  @override
  _PhotoGridPageState createState() => _PhotoGridPageState();
}

class _PhotoGridPageState extends State<PhotoGridPage> {
  Set<int>? allAlbums;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<PhotoBloc, PhotoState>(
          builder: (context, state) {
            if (state is PhotosLoaded && state.selectedAlbumId != null) {
              return Text('Album ${state.selectedAlbumId}');
            }
            return const Text('All Photos');
          },
        ),
        actions: <Widget>[
          _buildPhotoMenu(),
        ],
      ),
      body: BlocBuilder<PhotoBloc, PhotoState>(
        builder: (context, state) {
          if (state is PhotosLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PhotosLoaded) {
            return PhotoGrid(
              photos: state.photos,
              onImageTap: (imageUrl) {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    child: Image.network(imageUrl, fit: BoxFit.cover),
                  ),
                );
              },
            );
          } else if (state is PhotosError) {
            return const Center(child: Text('Error loading photos'));
          }
          return const Center(child: Text('Please select an album'));
        },
      ),
    );
  }

  Widget _buildPhotoMenu() {
    return PhotoMenu(
      onSelected: (value) {
        if (value == 'show_albums') {
          _showAlbumsList(context);
        } else if (value == 'all_photos') {
          BlocProvider.of<PhotoBloc>(context).add(LoadAllPhotos());
        }
      },
    );
  }

  void _showAlbumsList(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey,
      builder: (BuildContext _) {
        return Stack(
          children: [
            BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(color: Colors.black.withOpacity(0.5)),
            ),
            BlocBuilder<PhotoBloc, PhotoState>(
              builder: (context, state) {
                if (state is PhotosLoaded) {
                  allAlbums ??=
                      state.photos.map((photo) => photo.albumId).toSet();
                  return AlbumGrid(
                    albums: allAlbums!,
                    onAlbumSelected: (albumId) {
                      Navigator.pop(context);
                      BlocProvider.of<PhotoBloc>(context)
                          .add(SelectAlbumEvent(albumId));
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        );
      },
    );
  }
}

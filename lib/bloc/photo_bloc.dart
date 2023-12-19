import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos_task/bloc/photo_event.dart';
import 'package:photos_task/bloc/photo_state.dart';
import 'package:photos_task/config/get_it.dart';
import 'package:photos_task/config/use_case.dart';
import 'package:photos_task/use_case/fetch_all_photos_use_case.dart';
import 'package:photos_task/use_case/fetch_photos_by_album_use_case.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoBloc() : super(PhotosInitial()) {
    on<LoadAllPhotos>(_onLoadAllPhotos);
    on<LoadPhotosByAlbum>(_onLoadPhotosByAlbum);
    on<SelectAlbumEvent>(_onSelectAlbumEvent);
  }

  Future<void> _onLoadAllPhotos(
      LoadAllPhotos event, Emitter<PhotoState> emit) async {
    emit(PhotosLoading());
    try {
      final fetchAllPhotosUseCase = getIt<FetchAllPhotosUseCase>();
      final photos = await fetchAllPhotosUseCase(NoParams());
      emit(PhotosLoaded(photos));
    } catch (_) {
      emit(PhotosError());
    }
  }

  Future<void> _onLoadPhotosByAlbum(
      LoadPhotosByAlbum event, Emitter<PhotoState> emit) async {
    emit(PhotosLoading());
    try {
      final fetchPhotosByAlbumUseCase = getIt<FetchPhotosByAlbumUseCase>();
      final photos = await fetchPhotosByAlbumUseCase(WithParams(event.albumId));
      emit(PhotosLoaded(photos, selectedAlbumId: event.albumId));
    } catch (_) {
      emit(PhotosError());
    }
  }

  Future<void> _onSelectAlbumEvent(
      SelectAlbumEvent event, Emitter<PhotoState> emit) async {
    if (event.albumId == null) {
      add(LoadAllPhotos());
    } else {
      add(LoadPhotosByAlbum(event.albumId!));
    }
  }
}

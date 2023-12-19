import 'package:get_it/get_it.dart';
import 'package:photos_task/repo/photo_api_data.dart';
import 'package:photos_task/repo/photo_repository.dart';
import 'package:photos_task/use_case/fetch_all_photos_use_case.dart';
import 'package:photos_task/use_case/fetch_photos_by_album_use_case.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<PhotoRepository>(() => PhotoApiDataSource());

  getIt.registerFactory(() => FetchAllPhotosUseCase());
  getIt.registerFactory(() => FetchPhotosByAlbumUseCase());
}

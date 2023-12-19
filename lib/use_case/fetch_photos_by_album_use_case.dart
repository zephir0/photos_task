import 'package:photos_task/config/get_it.dart';
import 'package:photos_task/config/use_case.dart';
import 'package:photos_task/model/photo.dart';
import 'package:photos_task/repo/photo_repository.dart';

class FetchPhotosByAlbumUseCase extends UseCase<List<Photo>, WithParams> {
  @override
  Future<List<Photo>> call(WithParams params) async {
    return await getIt<PhotoRepository>().fetchPhotosByAlbum(params.data);
  }
}

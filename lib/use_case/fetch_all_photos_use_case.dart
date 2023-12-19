import 'package:photos_task/config/get_it.dart';
import 'package:photos_task/config/use_case.dart';
import 'package:photos_task/model/photo.dart';
import 'package:photos_task/repo/photo_repository.dart';

class FetchAllPhotosUseCase extends UseCase<List<Photo>, NoParams> {
  @override
  Future<List<Photo>> call(NoParams params) async {
    return await getIt<PhotoRepository>().fetchPhotos();
  }
}

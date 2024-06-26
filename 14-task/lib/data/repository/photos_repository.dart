import 'package:task14/data/mock_data.dart';
import 'package:task14/domain /entity/photo_entity.dart';

class PhotosRepository {
  Future<List<PhotoEntity>> getPhotos() async {
    return Future.value(mockData);
  }
}
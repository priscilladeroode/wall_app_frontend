import '../models/post_response_model.dart';

abstract class PostsDatasource {
  Future<List<PostResponseModel>> loadAll();
  Future<PostResponseModel> loadById(String id);
  Future<List<PostResponseModel>> loadByUid();
}

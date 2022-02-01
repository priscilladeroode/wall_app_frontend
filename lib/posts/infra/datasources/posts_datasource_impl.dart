import 'package:dio/dio.dart';
import '../../../auth/presentation/stores/auth_store.dart';

import '../../data/datasources/posts_datasource.dart';
import '../../data/models/post_response_model.dart';
import '../../domain/failures/posts_failures.dart';

class PostsDatasourceImpl implements PostsDatasource {
  final Dio dio;
  final AuthStore _authStore;

  PostsDatasourceImpl(this.dio, this._authStore);

  final endpoint = 'http://10.0.2.2:5050/api';

  @override
  Future<List<PostResponseModel>> loadAll() async {
    final result = await dio.get("$endpoint/posts");
    if (result.statusCode == 200) {
      return PostResponseModel.fromJsonList(result.data);
    }
    throw PostsDatasourceError();
  }

  @override
  Future<PostResponseModel> loadById(String id) async {
    final result = await dio.get('$endpoint/posts/$id');
    if (result.statusCode == 200) {
      return PostResponseModel.fromJson(result.data);
    }
    throw PostsDatasourceError();
  }

  @override
  Future<List<PostResponseModel>> loadByUid() async {
    final result = await dio.get('$endpoint/postsByUser',
        options: Options(headers: {
          "x-access-token": _authStore.accessToken,
        }));
    if (result.statusCode == 200) {
      return PostResponseModel.fromJsonList(result.data);
    }
    throw PostsDatasourceError();
  }
}

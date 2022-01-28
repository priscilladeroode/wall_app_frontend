import 'package:dio/dio.dart';

import '../../data/datasources/posts_datasource.dart';
import '../../data/models/post_response_model.dart';
import '../../domain/failures/posts_failures.dart';

class PostsDatasourceImpl implements PostsDatasource {
  final Dio dio;

  PostsDatasourceImpl(this.dio);

  final endpoint = 'http://localhost:5050/api/posts';

  @override
  Future<List<PostResponseModel>> loadAll() async {
    final result = await dio.get(endpoint);
    if (result.statusCode == 200) {
      return PostResponseModel.fromJsonList(result.data);
    }
    throw PostsDatasourceError();
  }
}

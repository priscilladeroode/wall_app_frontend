import 'package:wall_app_frontend/commons/either.dart';
import 'package:wall_app_frontend/posts/domain/entities/post_response_entity.dart';
import 'package:wall_app_frontend/posts/domain/failures/posts_failures.dart';
import 'package:wall_app_frontend/posts/domain/repositories/posts_respository.dart';

abstract class GetPostById {
  Future<Either<PostsFailures, PostResponseEntity>> call(String id);
}

class GetPostByIdImpl implements GetPostById {
  final PostsRepository repository;

  GetPostByIdImpl(this.repository);

  @override
  Future<Either<PostsFailures, PostResponseEntity>> call(String id) async {
    return await repository.loadById(id);
  }
}

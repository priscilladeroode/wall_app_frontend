import '../../../commons/either.dart';
import '../entities/post_response_entity.dart';
import '../failures/posts_failures.dart';
import '../repositories/posts_respository.dart';

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

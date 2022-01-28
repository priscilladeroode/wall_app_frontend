import '../../../commons/either.dart';
import '../entities/post_response_entity.dart';
import '../failures/posts_failures.dart';

abstract class PostsRepository {
  Future<Either<PostsFailures, List<PostResponseEntity>>> loadAll();
}
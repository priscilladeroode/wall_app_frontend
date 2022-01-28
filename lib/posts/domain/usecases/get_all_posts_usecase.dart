import '../../../commons/either.dart';
import '../entities/post_response_entity.dart';
import '../failures/posts_failures.dart';
import '../repositories/posts_respository.dart';

abstract class GetAllPostsUseCase {
  Future<Either<PostsFailures, List<PostResponseEntity>>> loadAll();
}

class GetAllPostsUseCaseImpl implements GetAllPostsUseCase {
  final PostsRepository repository;

  GetAllPostsUseCaseImpl(this.repository);

  @override
  Future<Either<PostsFailures, List<PostResponseEntity>>> loadAll() async {
    return await repository.loadAll();
  }
}

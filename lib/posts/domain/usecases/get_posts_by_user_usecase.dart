import '../../../commons/either.dart';
import '../entities/post_response_entity.dart';
import '../failures/posts_failures.dart';
import '../repositories/posts_respository.dart';

abstract class GetPostsByUserUseCase {
  Future<Either<PostsFailures, List<PostResponseEntity>>> call();
}

class GetPostsByUserUseCaseImpl implements GetPostsByUserUseCase {
  final PostsRepository repository;

  GetPostsByUserUseCaseImpl(this.repository);

  @override
  Future<Either<PostsFailures, List<PostResponseEntity>>> call() async {
    return await repository.loadByUser();
  }
}

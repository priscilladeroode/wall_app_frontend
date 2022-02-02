import '../../../commons/either.dart';
import '../entities/post_request_entity.dart';
import '../failures/posts_failures.dart';
import '../repositories/posts_respository.dart';

abstract class UpdatePostUseCase {
  Future<Either<PostsFailures, bool>> call(PostRequestEntity post);
}

class UpdatePostUseCaseImpl implements UpdatePostUseCase {
  final PostsRepository repository;

  UpdatePostUseCaseImpl(this.repository);
  @override
  Future<Either<PostsFailures, bool>> call(PostRequestEntity post) async {
    return await repository.updatePost(post);
  }
}

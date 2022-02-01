import '../../../commons/either.dart';
import '../entities/post_request_entity.dart';
import '../failures/posts_failures.dart';
import '../repositories/posts_respository.dart';

abstract class CreatePostUseCase {
  Future<Either<PostsFailures, bool>> call(PostRequestEntity post);
}

class CreatePostUseCaseImpl implements CreatePostUseCase {
  final PostsRepository repository;

  CreatePostUseCaseImpl(this.repository);
  @override
  Future<Either<PostsFailures, bool>> call(PostRequestEntity post) async {
    return await repository.createPost(post);
  }
}

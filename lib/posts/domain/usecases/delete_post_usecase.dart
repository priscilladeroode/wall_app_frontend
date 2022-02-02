import '../../../commons/either.dart';
import '../failures/posts_failures.dart';
import '../repositories/posts_respository.dart';

abstract class DeletePostUseCase {
  Future<Either<PostsFailures, bool>> call(String id);
}

class DeletePostUseCaseImpl implements DeletePostUseCase {
  final PostsRepository repository;

  DeletePostUseCaseImpl(this.repository);
  @override
  Future<Either<PostsFailures, bool>> call(String id) async {
    return await repository.deletePost(id);
  }
}

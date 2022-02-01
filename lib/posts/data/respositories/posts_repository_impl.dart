import '../../../commons/either.dart';
import '../../domain/entities/post_response_entity.dart';
import '../../domain/failures/posts_failures.dart';
import '../../domain/repositories/posts_respository.dart';
import '../datasources/posts_datasource.dart';
import '../mappers/post_mapper.dart';

class PostsRepositoryImpl implements PostsRepository {
  final PostsDatasource datasource;
  final PostMapper mapper;

  PostsRepositoryImpl({
    required this.datasource,
    required this.mapper,
  });

  @override
  Future<Either<PostsFailures, List<PostResponseEntity>>> loadAll() async {
    try {
      final result = await datasource.loadAll();
      return right(mapper.fromModelList(result));
    } on PostsFailures catch (e) {
      return left(e);
    } catch (e) {
      return left(PostsRepositoryFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<PostsFailures, PostResponseEntity>> loadById(String id) async {
    try {
      final result = await datasource.loadById(id);
      return right(mapper.fromModel(result));
    } on PostsFailures catch (e) {
      return left(e);
    } catch (e) {
      return left(PostsRepositoryFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<PostsFailures, List<PostResponseEntity>>> loadByUser() async {
    try {
      final result = await datasource.loadByUid();
      return right(mapper.fromModelList(result));
    } on PostsFailures catch (e) {
      return left(e);
    } catch (e) {
      return left(PostsRepositoryFailure(message: e.toString()));
    }
  }
}

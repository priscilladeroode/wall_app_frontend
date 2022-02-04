import 'package:dio/dio.dart';

import '../../../commons/either.dart';
import '../../domain/entities/post_request_entity.dart';
import '../../domain/entities/post_response_entity.dart';
import '../../domain/failures/posts_failures.dart';
import '../../domain/repositories/posts_respository.dart';
import '../datasources/posts_datasource.dart';
import '../mappers/post_mapper.dart';
import '../mappers/post_request_mapper.dart';

class PostsRepositoryImpl implements PostsRepository {
  final PostsDatasource datasource;
  final PostMapper mapper;
  final PostRequestMapper mapperFromDomain;

  PostsRepositoryImpl({
    required this.datasource,
    required this.mapper,
    required this.mapperFromDomain,
  });

  @override
  Future<Either<PostsFailures, List<PostResponseEntity>>> loadAll() async {
    try {
      final result = await datasource.loadAll();
      return right(mapper.fromModelList(result));
    } on PostsFailures catch (e) {
      return left(e);
    } catch (e) {
      return left(PostsRepositoryFailure());
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
      return left(PostsRepositoryFailure());
    }
  }

  @override
  Future<Either<PostsFailures, List<PostResponseEntity>>> loadByUser() async {
    try {
      final result = await datasource.loadByUid();
      return right(mapper.fromModelList(result));
    } on DioError catch (e) {
      switch (e.response?.data['errorCode']) {
        case 'access_denied':
          return left(AccessDenied());
        default:
          return left(PostsRepositoryFailure());
      }
    } on PostsFailures catch (e) {
      return left(e);
    } catch (_) {
      return left(PostsRepositoryFailure());
    }
  }

  @override
  Future<Either<PostsFailures, bool>> createPost(PostRequestEntity post) async {
    try {
      final _model = mapperFromDomain.handle(post);
      final _result = await datasource.createPost(_model);
      return right(_result);
    } on DioError catch (e) {
      switch (e.response?.data['errorCode']) {
        case 'access_denied':
          return left(AccessDenied());
        case 'length_error_title':
          return left(InvalidTitleLength());
        case 'length_error_content':
          return left(InvalidContentLength());
        default:
          return left(PostsRepositoryFailure());
      }
    } on PostsFailures catch (e) {
      return left(e);
    } catch (e) {
      return left(PostsRepositoryFailure());
    }
  }

  @override
  Future<Either<PostsFailures, bool>> deletePost(String id) async {
    try {
      final _result = await datasource.deletePost(id);
      return right(_result);
    } on DioError catch (e) {
      switch (e.response?.data['errorCode']) {
        case 'access_denied':
          return left(AccessDenied());
        case 'unauthorized':
          return left(Unauthorized());
        default:
          return left(PostsRepositoryFailure());
      }
    } on PostsFailures catch (e) {
      return left(e);
    } catch (e) {
      return left(PostsRepositoryFailure());
    }
  }

  @override
  Future<Either<PostsFailures, bool>> updatePost(PostRequestEntity post) async {
    try {
      final _model = mapperFromDomain.handle(post);
      final _result = await datasource.updatePost(_model);
      return right(_result);
    } on DioError catch (e) {
      switch (e.response?.data['errorCode']) {
        case 'length_error_title':
          return left(InvalidTitleLength());
        case 'length_error_content':
          return left(InvalidContentLength());
        case 'unauthorized':
          return left(Unauthorized());
        case 'access_denied':
          return left(AccessDenied());
        default:
          return left(PostsRepositoryFailure());
      }
    } on PostsFailures catch (e) {
      return left(e);
    } catch (e) {
      return left(PostsRepositoryFailure());
    }
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wall_app_frontend/commons/either.dart';
import 'package:wall_app_frontend/posts/domain/failures/posts_failures.dart';
import 'package:wall_app_frontend/posts/domain/usecases/delete_post_usecase.dart';
import 'package:wall_app_frontend/posts/domain/usecases/get_post_by_id.dart';
import 'package:wall_app_frontend/posts/presentation/post_details_page/post_details_page_controller.dart';
import 'package:wall_app_frontend/posts/presentation/post_details_page/stores/post_details_page_store.dart';

import '../../mocks/posts_mocks.dart';

class PostDetailsPageStoreMock extends Mock implements PostDetailsPageStore {}

class GetPostByIdUseCaseMock extends Mock implements GetPostById {}

class DeletePostUseCaseMock extends Mock implements DeletePostUseCase {}

void main() {
  late PostDetailsPageStore _store;
  late GetPostById _usecase;
  late PostDetailsPageController _controller;
  late DeletePostUseCase _deletePostUseCase;

  setUpAll(() {
    _store = PostDetailsPageStoreMock();
    _usecase = GetPostByIdUseCaseMock();
    _deletePostUseCase = DeletePostUseCaseMock();
    _controller = PostDetailsPageController(
        usecase: _usecase, store: _store, deletePostUseCase: _deletePostUseCase);
  });
  test('''
    Given a valid call to method getPost,
    When usecase returns a post,
    Then this post should be set in the store.
  ''', () async {
    when(() => _usecase(any())).thenAnswer((_) async => right(postEntity));

    await _controller.getPost('');

    verify(() => _store.setPost = postEntity).called(1);
    verify(() => _store.setLoading = any()).called(2);
    verifyNever(() => _store.error = any());
  });

  test('''
    Given a valid call to method getAll,
    When usecase returns a failure,
    Then an error should be set in store.
  ''', () async {
    final error = PostsRepositoryFailure();
    when(() => _usecase(any())).thenAnswer((_) async => left(error));

    await _controller.getPost('');

    verify(() => _store.setError = any()).called(1);
    verify(() => _store.setLoading = any()).called(2);
  });
}

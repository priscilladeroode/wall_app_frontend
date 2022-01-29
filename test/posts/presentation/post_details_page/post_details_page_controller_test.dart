import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wall_app_frontend/commons/either.dart';
import 'package:wall_app_frontend/posts/domain/usecases/get_post_by_id.dart';
import 'package:wall_app_frontend/posts/presentation/post_details_page/post_details_page_controller.dart';
import 'package:wall_app_frontend/posts/presentation/post_details_page/stores/post_details_page_store.dart';

import '../../data/respositories/mocks/posts_repository_mocks.dart';

class PostDetailsPageStoreMock extends Mock implements PostDetailsPageStore {}

class GetPostByIdUseCaseMock extends Mock implements GetPostById {}

void main() {
  late PostDetailsPageStore _store;
  late GetPostById _usecase;
  late PostDetailsPageController _controller;

  setUpAll(() {
    _store = PostDetailsPageStoreMock();
    _usecase = GetPostByIdUseCaseMock();
    _controller = PostDetailsPageController(usecase: _usecase, store: _store);
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
}

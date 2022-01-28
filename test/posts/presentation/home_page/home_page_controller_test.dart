import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wall_app_frontend/commons/either.dart';
import 'package:wall_app_frontend/posts/domain/failures/posts_failures.dart';
import 'package:wall_app_frontend/posts/domain/usecases/get_all_posts_usecase.dart';
import 'package:wall_app_frontend/posts/presentation/home_page/home_page_controller.dart';
import 'package:wall_app_frontend/posts/presentation/home_page/stores/home_page_store.dart';

import '../../data/respositories/mocks/posts_repository_mocks.dart';

class HomePageStoreMock extends Mock implements HomePageStore {}

class GetAllPostsUseCaseMock extends Mock implements GetAllPostsUseCase {}

void main() {
  late HomePageStore _store;
  late GetAllPostsUseCase _usecase;
  late HomePageController _controller;

  setUpAll(() {
    _store = HomePageStoreMock();
    _usecase = GetAllPostsUseCaseMock();
    _controller = HomePageController(usecase: _usecase, store: _store);
  });
  test('''
    Given a valid call to method getAll,
    When usecase returns a list of posts,
    Then this posts should be set in the store.
  ''', () async {
    when(() => _usecase.loadAll()).thenAnswer((_) async => right([postEntity]));

    await _controller.getAll();

    verify(() => _store.setPosts = any()).called(1);
    verify(() => _store.setLoading = any()).called(2);
    verifyNever(() => _store.error = any());
  });

  test('''
    Given a valid call to method getAll,
    When usecase returns a failure,
    Then an error should be set in store.
  ''', () async {
    when(() => _usecase.loadAll()).thenAnswer((_) async => left(PostsRepositoryFailure()));

    await _controller.getAll();

    verify(() => _store.error = any()).called(1);
    verify(() => _store.setLoading = any()).called(2);
    verifyNever(() => _store.setPosts = any());
  });
}

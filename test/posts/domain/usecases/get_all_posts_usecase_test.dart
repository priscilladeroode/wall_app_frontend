import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wall_app_frontend/commons/either.dart';
import 'package:wall_app_frontend/posts/domain/entities/post_response_entity.dart';
import 'package:wall_app_frontend/posts/domain/repositories/posts_respository.dart';
import 'package:wall_app_frontend/posts/domain/usecases/get_all_posts_usecase.dart';

import '../../data/respositories/mocks/posts_repository_mocks.dart';

class PostsRepositoryMock extends Mock implements PostsRepository {}

void main() {
  late PostsRepository repository;
  late GetAllPostsUseCase usecase;

  setUpAll(() {
    repository = PostsRepositoryMock();
    usecase = GetAllPostsUseCaseImpl(repository);
  });
  test('''
    Given a valid call for loadAll,
    When repository returns a list of PostResponseEntity,
    Then should return a list of PostResponseEntity.
  ''', () async {
    when(() => repository.loadAll()).thenAnswer((_) async => right([postEntity]));

    final result = await usecase.loadAll();

    expect(result.fold(id, id), isA<List<PostResponseEntity>>());
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wall_app_frontend/commons/either.dart';
import 'package:wall_app_frontend/posts/domain/entities/post_response_entity.dart';
import 'package:wall_app_frontend/posts/domain/repositories/posts_respository.dart';
import 'package:wall_app_frontend/posts/domain/usecases/get_post_by_id.dart';

import '../../data/respositories/mocks/posts_repository_mocks.dart';

class PostsRepositoryMock extends Mock implements PostsRepository {}

void main() {
  late PostsRepository repository;
  late GetPostById usecase;

  setUpAll(() {
    repository = PostsRepositoryMock();
    usecase = GetPostByIdImpl(repository);
  });
  test('''
    Given a valid id,
    When repository returns a PostResponseEntity,
    Then should return a PostResponseEntity.
  ''', () async {
    when(() => repository.loadById(any())).thenAnswer((_) async => right(postEntity));

    final result = await usecase('');

    expect(result.fold(id, id), isA<PostResponseEntity>());
  });
}

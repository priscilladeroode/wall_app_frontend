import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wall_app_frontend/commons/either.dart';
import 'package:wall_app_frontend/posts/data/datasources/posts_datasource.dart';
import 'package:wall_app_frontend/posts/data/mappers/post_mapper.dart';
import 'package:wall_app_frontend/posts/data/respositories/posts_repository_impl.dart';
import 'package:wall_app_frontend/posts/domain/entities/post_response_entity.dart';
import 'package:wall_app_frontend/posts/domain/failures/posts_failures.dart';
import 'package:wall_app_frontend/posts/domain/repositories/posts_respository.dart';

import 'mocks/posts_repository_mocks.dart';

class PostsDatasourceMock extends Mock implements PostsDatasource {}

class PostMapperMock extends Mock implements PostMapper {}

void main() {
  late PostsDatasource datasource;
  late PostsRepository repository;
  late PostMapper mapper;

  setUpAll(() {
    datasource = PostsDatasourceMock();
    mapper = PostMapperMock();
    repository = PostsRepositoryImpl(datasource: datasource, mapper: mapper);
  });
  test('''
    Given a valid call for the method loadAll,
    When datasource return a list of posts,
    Then a list of PostResponseEntity should be returned.
  ''', () async {
    when(() => datasource.loadAll()).thenAnswer((_) async => [postModel]);
    when(() => mapper.fromModelList(any())).thenReturn([postEntity]);

    final result = await repository.loadAll();

    expect(result.fold(id, id), isA<List<PostResponseEntity>>());
  });

  test('''
    Given a valid call for the method loadAll,
    When datasource throws,
    Then a failure should be returned.
  ''', () async {
    when(() => datasource.loadAll()).thenThrow(() async => Exception());

    final result = await repository.loadAll();

    expect(result.fold(id, id), isA<PostsRepositoryFailure>());
  });
}

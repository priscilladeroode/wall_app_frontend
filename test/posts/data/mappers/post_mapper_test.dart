import 'package:flutter_test/flutter_test.dart';
import 'package:wall_app_frontend/posts/data/mappers/post_mapper.dart';
import 'package:wall_app_frontend/posts/domain/entities/post_entity.dart';

import '../respositories/mocks/posts_repository_mocks.dart';

void main() {
  final mapper = PostMapper();
  test('''
    Given a valid PostResponseModel,
    When PostMapper is called,
    Then should return a PostResponseEntity.
  ''', () async {
    final result = mapper.fromModel(postModel);
    expect(result, isA<PostResponseEntity>());
  });
}

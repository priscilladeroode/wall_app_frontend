import 'package:faker/faker.dart';
import 'package:wall_app_frontend/posts/data/models/post_request_model.dart';
import 'package:wall_app_frontend/posts/data/models/post_response_model.dart';
import 'package:wall_app_frontend/posts/domain/entities/post_response_entity.dart';

final _id = faker.lorem.word();
final _title = faker.lorem.sentence();
final _content = faker.lorem.sentences(3).join(' ');
final _createdBy = faker.person.name();
final _createdAt = DateTime.now();

final postModel = PostResponseModel(
  id: _id,
  title: _title,
  content: _content,
  createdBy: _createdBy,
  createdAt: _createdAt,
);

final postEntity = PostResponseEntity(
  id: _id,
  title: _title,
  content: _content,
  createdBy: _createdBy,
  createdAt: _createdAt,
);

final postRequestModel = PostRequestModel(
  content: _content,
  title: _title,
);

final postListJsonMock = '''
          [
            {
             "id": "$_id",
              "title": "$_title",
              "content": "$_content",
              "createdBy": "$_createdBy",
              "createdAt": "$_createdAt"
            }
          ]
        ''';

final postJsonMock = '''
            {
             "id": "$_id",
              "title": "$_title",
              "content": "$_content",
              "createdBy": "$_createdBy",
              "createdAt": "$_createdAt"
            }
        ''';

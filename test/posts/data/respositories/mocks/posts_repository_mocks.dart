import 'package:faker/faker.dart';
import 'package:wall_app_frontend/posts/data/models/post_response_model.dart';
import 'package:wall_app_frontend/posts/domain/entities/post_response_entity.dart';

final fakeId = faker.lorem.word();
final fakeTitle = faker.lorem.sentence();
final fakeContent = faker.lorem.sentences(3).join(' ');
final fakeCreatedBy = faker.person.name();
final fakeCreatedAt = DateTime.now();

final postModel = PostResponseModel(
  id: fakeId,
  title: fakeTitle,
  content: fakeContent,
  createdBy: fakeCreatedBy,
  createdAt: fakeCreatedAt,
);

final postEntity = PostResponseEntity(
  id: fakeId,
  title: fakeTitle,
  content: fakeContent,
  createdBy: fakeCreatedBy,
  createdAt: fakeCreatedAt,
);

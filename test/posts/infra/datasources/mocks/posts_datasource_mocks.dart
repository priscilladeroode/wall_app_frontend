import 'package:faker/faker.dart';

final _id = faker.lorem.word();
final _title = faker.lorem.sentence();
final _content = faker.lorem.sentences(2);
final _createdBy = faker.person.name();
final _createdAt = faker.date.dateTime();

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

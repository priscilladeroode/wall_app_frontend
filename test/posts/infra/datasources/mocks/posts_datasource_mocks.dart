import 'package:faker/faker.dart';

class PostsDatasourceMocks {
  static final _id = faker.lorem.word();
  static final _title = faker.lorem.sentence();
  static final _content = faker.lorem.sentences(2);
  static final _createdBy = faker.person.name();
  static final _createdAt = faker.date.dateTime();

  static final postListMock = '''
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
}

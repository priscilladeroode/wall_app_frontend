import 'package:faker/faker.dart';
import 'package:wall_app_frontend/auth/data/models/signup_request_model.dart';

final name = faker.person.name();
final email = faker.internet.email();
final accessToken = faker.jwt.valid();
final password = faker.internet.password();

final signUpResponseMock = '''{
      "name": "$name",
      "email":"$email",
      "accessToken": "$accessToken"
    }''';

final signUpRequestMock = SignUpRequestModel(
  name: name,
  email: email,
  password: password,
  passwordConfirmation: password,
);

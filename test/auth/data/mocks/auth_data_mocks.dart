import 'package:faker/faker.dart';
import 'package:wall_app_frontend/auth/data/models/auth_response_model.dart';
import 'package:wall_app_frontend/auth/data/models/signup_request_model.dart';
import 'package:wall_app_frontend/auth/domain/entities/auth_response_entity.dart';
import 'package:wall_app_frontend/auth/domain/entities/signup_request_entity.dart';

final name = faker.person.name();
final email = faker.internet.email();
final password = faker.internet.password();
final jwt = faker.jwt.valid();

final signUpRequestModel = SignUpRequestModel(
  name: name,
  email: email,
  password: password,
  passwordConfirmation: password,
);

final signUpRequestEntity = SignUpRequestEntity(
  name: name,
  email: email,
  password: password,
  passwordConfirmation: password,
);

final signUpResponseModel = AuthResponseModel(
  name: name,
  email: email,
  accessToken: jwt,
);

final signUpResponseEntity = AuthResponseEntity(
  name: name,
  email: email,
  accessToken: jwt,
);

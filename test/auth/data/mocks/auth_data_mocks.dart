import 'package:faker/faker.dart';
import 'package:wall_app_frontend/auth/data/models/signup_request_model.dart';
import 'package:wall_app_frontend/auth/domain/entities/signup_request_entity.dart';

final name = faker.person.name();
final email = faker.internet.email();
final password = faker.internet.password();

final signUpModel = SignUpRequestModel(
  name: name,
  email: email,
  password: password,
  passwordConfirmation: password,
);

final signUpEntity = SignUpRequestEntity(
  name: name,
  email: email,
  password: password,
  passwordConfirmation: password,
);

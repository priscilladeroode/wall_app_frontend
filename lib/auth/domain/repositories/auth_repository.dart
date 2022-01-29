import 'package:wall_app_frontend/auth/domain/entities/signup_request_entity.dart';
import 'package:wall_app_frontend/auth/domain/entities/signup_response_entity.dart';
import 'package:wall_app_frontend/auth/domain/failures/auth_failures.dart';
import 'package:wall_app_frontend/commons/either.dart';

abstract class AuthRepository {
  Future<Either<AuthFailures, SignUpResponseEntity>> signUp(SignUpRequestEntity signUpCredentials);
}

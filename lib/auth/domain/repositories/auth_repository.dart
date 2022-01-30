import '../../../commons/either.dart';
import '../entities/auth_response_entity.dart';
import '../entities/signup_request_entity.dart';
import '../failures/auth_failures.dart';

abstract class AuthRepository {
  Future<Either<AuthFailures, AuthResponseEntity>> signUp(SignUpRequestEntity signUpCredentials);
}

import '../../../commons/either.dart';
import '../entities/signup_request_entity.dart';
import '../entities/signup_response_entity.dart';
import '../failures/auth_failures.dart';
import '../repositories/auth_repository.dart';

abstract class SignUpUseCase {
  Future<Either<AuthFailures, SignUpResponseEntity>> call(SignUpRequestEntity credentials);
}

class SignUpUseCaseImpl implements SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCaseImpl(this.repository);

  @override
  Future<Either<AuthFailures, SignUpResponseEntity>> call(SignUpRequestEntity credentials) async {
    return await repository.signUp(credentials);
  }
}

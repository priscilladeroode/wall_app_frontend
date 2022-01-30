import '../../../commons/either.dart';
import '../entities/auth_response_entity.dart';
import '../entities/signin_request_entity.dart';
import '../failures/auth_failures.dart';
import '../repositories/auth_repository.dart';

abstract class SignInUseCase {
  Future<Either<AuthFailures, AuthResponseEntity>> call(SignInRequestEntity credentials);
}

class SignInUseCaseImpl implements SignInUseCase {
  final AuthRepository repository;

  SignInUseCaseImpl(this.repository);

  @override
  Future<Either<AuthFailures, AuthResponseEntity>> call(SignInRequestEntity credentials) async {
    return await repository.signIn(credentials);
  }
}

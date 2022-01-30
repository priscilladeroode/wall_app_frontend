import 'package:dio/dio.dart';

import '../../../commons/either.dart';
import '../../domain/entities/signup_request_entity.dart';
import '../../domain/entities/signup_response_entity.dart';
import '../../domain/failures/auth_failures.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_datasource.dart';
import '../mappers/signup_from_domain_mapper.dart';
import '../mappers/signup_to_domain_mapper.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SignUpFromDomainMapper mapperFromDomain;
  final SignUpToDomainMapper mapperToDomain;
  final AuthDatasource datasource;

  AuthRepositoryImpl({
    required this.mapperFromDomain,
    required this.mapperToDomain,
    required this.datasource,
  });
  @override
  Future<Either<AuthFailures, SignUpResponseEntity>> signUp(
      SignUpRequestEntity signUpCredentials) async {
    try {
      final _model = mapperFromDomain.handle(signUpCredentials);
      final _result = await datasource.signUp(_model);
      return right(mapperToDomain.fromModel(_result));
    } on DioError catch (e) {
      switch (e.response?.data['errorCode']) {
        case 'invalid_name':
          return left(InvalidName());
        case 'invalid_email':
          return left(InvalidEmail());
        case 'missing_name':
          return left(MissingName());
        case 'missing_email':
          return left(MissingEmail());
        case 'missing_password':
          return left(MissingPassword());
        case 'missing_passwordConfirmation':
          return left(MissingPasswordConfirmation());
        case 'lenght_error_password':
          return left(InvalidPasswordLength());
        case 'password_dont_match':
          return left(PasswordDontMatch());
        default:
          return left(
              AuthRepositoryFailure(message: 'Ops... an error has occured, try again later.'));
      }
    } on AuthFailures catch (e) {
      return left(e);
    } catch (e) {
      return left(AuthRepositoryFailure(message: e.toString()));
    }
  }
}

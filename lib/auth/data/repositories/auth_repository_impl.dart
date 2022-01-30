import 'package:dio/dio.dart';

import '../../../commons/either.dart';
import '../../domain/entities/auth_response_entity.dart';
import '../../domain/entities/signin_request_entity.dart';
import '../../domain/entities/signup_request_entity.dart';
import '../../domain/failures/auth_failures.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_datasource.dart';
import '../mappers/auth_to_domain_mapper.dart';
import '../mappers/signin_from_domain_mapper.dart';
import '../mappers/signup_from_domain_mapper.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SignUpFromDomainMapper mapperFromDomain;
  final SignInFromDomainMapper singInMapperFromDomain;
  final AuthToDomainMapper mapperToDomain;
  final AuthDatasource datasource;

  AuthRepositoryImpl({
    required this.mapperFromDomain,
    required this.mapperToDomain,
    required this.singInMapperFromDomain,
    required this.datasource,
  });
  @override
  Future<Either<AuthFailures, AuthResponseEntity>> signUp(
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
        case 'length_error_password':
          return left(InvalidPasswordLength());
        case 'password_dont_match':
          return left(PasswordDontMatch());
        case 'email_in_use':
          return left(EmailInUse());
        default:
          return left(AuthRepositoryFailure());
      }
    } on AuthFailures catch (e) {
      return left(e);
    } catch (e) {
      return left(AuthRepositoryFailure());
    }
  }

  @override
  Future<Either<AuthFailures, AuthResponseEntity>> signIn(
      SignInRequestEntity signInCredentials) async {
    try {
      final _model = singInMapperFromDomain.handle(signInCredentials);
      final _result = await datasource.signIn(_model);
      return right(mapperToDomain.fromModel(_result));
    } on DioError catch (e) {
      switch (e.response?.data['errorCode']) {
        case 'invalid_email':
          return left(InvalidEmail());
        case 'missing_email':
          return left(MissingEmail());
        case 'missing_password':
          return left(MissingPassword());
        case 'length_error_password':
          return left(InvalidPasswordLength());
        case 'unauthorized':
          return left(InvalidUsernameOrPassword());
        default:
          return left(AuthRepositoryFailure());
      }
    } on AuthFailures catch (e) {
      return left(e);
    } catch (e) {
      return left(AuthRepositoryFailure());
    }
  }
}

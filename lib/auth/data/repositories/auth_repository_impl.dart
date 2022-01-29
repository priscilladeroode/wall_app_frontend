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
    } on AuthFailures catch (e) {
      return left(e);
    } catch (e) {
      return left(AuthRepositoryFailure(message: e.toString()));
    }
  }
}

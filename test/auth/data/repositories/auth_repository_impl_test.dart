import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wall_app_frontend/auth/data/datasources/auth_datasource.dart';
import 'package:wall_app_frontend/auth/data/mappers/signup_from_domain_mapper.dart';
import 'package:wall_app_frontend/auth/data/mappers/signup_to_domain_mapper.dart';
import 'package:wall_app_frontend/auth/data/repositories/auth_repository_impl.dart';
import 'package:wall_app_frontend/auth/domain/entities/signup_response_entity.dart';
import 'package:wall_app_frontend/auth/domain/repositories/auth_repository.dart';
import 'package:wall_app_frontend/commons/either.dart';

import '../mocks/auth_data_mocks.dart';

class AuthDatasourceMock extends Mock implements AuthDatasource {}

class SignUpToDomainMapperMock extends Mock implements SignUpToDomainMapper {}

class SignUpFromDomainMapperMock extends Mock implements SignUpFromDomainMapper {}

void main() {
  late AuthDatasource datasource;
  late AuthRepository repository;
  late SignUpFromDomainMapper mapperFromDomain;
  late SignUpToDomainMapperMock mapperToDomain;

  setUpAll(() {
    datasource = AuthDatasourceMock();
    mapperFromDomain = SignUpFromDomainMapperMock();
    mapperToDomain = SignUpToDomainMapperMock();
    repository = AuthRepositoryImpl(
      datasource: datasource,
      mapperFromDomain: mapperFromDomain,
      mapperToDomain: mapperToDomain,
    );
  });
  group('signUp', () {
    test('''
    Given a valid call for the method signUp with valid credentials,
    When datasource return a SignUpResponseModel,
    Then a SignUpResponseEntity should be returned.
  ''', () async {
      when(() => mapperFromDomain.handle(signUpRequestEntity)).thenReturn(signUpRequestModel);
      when(() => datasource.signUp(signUpRequestModel))
          .thenAnswer((_) async => signUpResponseModel);
      when(() => mapperToDomain.fromModel(signUpResponseModel)).thenReturn(signUpResponseEntity);

      final result = await repository.signUp(signUpRequestEntity);

      expect(result.fold(id, id), isA<SignUpResponseEntity>());
    });
  });
}

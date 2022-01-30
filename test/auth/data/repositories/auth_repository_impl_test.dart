import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wall_app_frontend/auth/data/datasources/auth_datasource.dart';
import 'package:wall_app_frontend/auth/data/mappers/signup_from_domain_mapper.dart';
import 'package:wall_app_frontend/auth/data/mappers/signup_to_domain_mapper.dart';
import 'package:wall_app_frontend/auth/data/repositories/auth_repository_impl.dart';
import 'package:wall_app_frontend/auth/domain/entities/signup_response_entity.dart';
import 'package:wall_app_frontend/auth/domain/failures/auth_failures.dart';
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

    test('''
     Given a valid call for the method signUp with valid credentials,
    When datasource throws,
    Then a failure should be returned.
  ''', () async {
      when(() => mapperFromDomain.handle(signUpRequestEntity)).thenReturn(signUpRequestModel);
      when(() => datasource.signUp(signUpRequestModel)).thenThrow(() async => Exception());

      final result = await repository.signUp(signUpRequestEntity);

      expect(result.fold(id, id), isA<AuthRepositoryFailure>());
    });

    test('''
    Given a valid call for the method signUp with valid credentials,
    When datasource throws failure,
    Then a failure should be returned.
  ''', () async {
      when(() => mapperFromDomain.handle(signUpRequestEntity)).thenReturn(signUpRequestModel);
      when(() => datasource.signUp(signUpRequestModel))
          .thenThrow(() async => AuthDatasourceError());

      final result = await repository.signUp(signUpRequestEntity);

      expect(result.fold(id, id), isA<AuthFailures>());
    });

    test('''
    Given a valid call for the method signUp with valid credentials,
    When datasource throws a DioError with code invalid_name,
    Then a InvalidName should be returned.
  ''', () async {
      const response = '''
        {
          "errorCode":"invalid_name"
        }
      ''';
      when(() => mapperFromDomain.handle(signUpRequestEntity)).thenReturn(signUpRequestModel);
      when(() => datasource.signUp(signUpRequestModel)).thenThrow(DioError(
        requestOptions: RequestOptions(path: ''),
        response: Response(requestOptions: RequestOptions(path: ''), data: jsonDecode(response)),
      ));

      final result = await repository.signUp(signUpRequestEntity);

      expect(result.fold(id, id), isA<InvalidName>());
    });

    test('''
    Given a valid call for the method signUp with valid credentials,
    When datasource throws a DioError with code invalid_email,
    Then a InvalidEmail should be returned.
  ''', () async {
      const response = '''
        {
          "errorCode":"invalid_email"
        }
      ''';
      when(() => mapperFromDomain.handle(signUpRequestEntity)).thenReturn(signUpRequestModel);
      when(() => datasource.signUp(signUpRequestModel)).thenThrow(DioError(
        requestOptions: RequestOptions(path: ''),
        response: Response(requestOptions: RequestOptions(path: ''), data: jsonDecode(response)),
      ));

      final result = await repository.signUp(signUpRequestEntity);

      expect(result.fold(id, id), isA<InvalidEmail>());
    });

    test('''
    Given a valid call for the method signUp with valid credentials,
    When datasource throws a DioError with code missing_name,
    Then a MissingName should be returned.
  ''', () async {
      const response = '''
        {
          "errorCode":"missing_name"
        }
      ''';
      when(() => mapperFromDomain.handle(signUpRequestEntity)).thenReturn(signUpRequestModel);
      when(() => datasource.signUp(signUpRequestModel)).thenThrow(DioError(
        requestOptions: RequestOptions(path: ''),
        response: Response(requestOptions: RequestOptions(path: ''), data: jsonDecode(response)),
      ));

      final result = await repository.signUp(signUpRequestEntity);

      expect(result.fold(id, id), isA<MissingName>());
    });

    test('''
    Given a valid call for the method signUp with valid credentials,
    When datasource throws a DioError with code missing_email,
    Then a MissingEmail should be returned.
  ''', () async {
      const response = '''
        {
          "errorCode":"missing_email"
        }
      ''';
      when(() => mapperFromDomain.handle(signUpRequestEntity)).thenReturn(signUpRequestModel);
      when(() => datasource.signUp(signUpRequestModel)).thenThrow(DioError(
        requestOptions: RequestOptions(path: ''),
        response: Response(requestOptions: RequestOptions(path: ''), data: jsonDecode(response)),
      ));

      final result = await repository.signUp(signUpRequestEntity);

      expect(result.fold(id, id), isA<MissingEmail>());
    });

    test('''
    Given a valid call for the method signUp with valid credentials,
    When datasource throws a DioError with code missing_password,
    Then a MissingPassword should be returned.
  ''', () async {
      const response = '''
        {
          "errorCode":"missing_password"
        }
      ''';
      when(() => mapperFromDomain.handle(signUpRequestEntity)).thenReturn(signUpRequestModel);
      when(() => datasource.signUp(signUpRequestModel)).thenThrow(DioError(
        requestOptions: RequestOptions(path: ''),
        response: Response(requestOptions: RequestOptions(path: ''), data: jsonDecode(response)),
      ));

      final result = await repository.signUp(signUpRequestEntity);

      expect(result.fold(id, id), isA<MissingPassword>());
    });

    test('''
    Given a valid call for the method signUp with valid credentials,
    When datasource throws a DioError with code missing_passwordConfirmation,
    Then a MissingPasswordConfirmation should be returned.
  ''', () async {
      const response = '''
        {
          "errorCode":"missing_passwordConfirmation"
        }
      ''';
      when(() => mapperFromDomain.handle(signUpRequestEntity)).thenReturn(signUpRequestModel);
      when(() => datasource.signUp(signUpRequestModel)).thenThrow(DioError(
        requestOptions: RequestOptions(path: ''),
        response: Response(requestOptions: RequestOptions(path: ''), data: jsonDecode(response)),
      ));

      final result = await repository.signUp(signUpRequestEntity);

      expect(result.fold(id, id), isA<MissingPasswordConfirmation>());
    });

    test('''
    Given a valid call for the method signUp with valid credentials,
    When datasource throws a DioError with code length_error_password,
    Then a InvalidPasswordLength should be returned.
  ''', () async {
      const response = '''
        {
          "errorCode":"length_error_password"
        }
      ''';
      when(() => mapperFromDomain.handle(signUpRequestEntity)).thenReturn(signUpRequestModel);
      when(() => datasource.signUp(signUpRequestModel)).thenThrow(DioError(
        requestOptions: RequestOptions(path: ''),
        response: Response(requestOptions: RequestOptions(path: ''), data: jsonDecode(response)),
      ));

      final result = await repository.signUp(signUpRequestEntity);

      expect(result.fold(id, id), isA<InvalidPasswordLength>());
    });

    test('''
    Given a valid call for the method signUp with valid credentials,
    When datasource throws a DioError with code password_dont_match,
    Then a PasswordDontMatch should be returned.
  ''', () async {
      const response = '''
        {
          "errorCode":"password_dont_match"
        }
      ''';
      when(() => mapperFromDomain.handle(signUpRequestEntity)).thenReturn(signUpRequestModel);
      when(() => datasource.signUp(signUpRequestModel)).thenThrow(DioError(
        requestOptions: RequestOptions(path: ''),
        response: Response(requestOptions: RequestOptions(path: ''), data: jsonDecode(response)),
      ));

      final result = await repository.signUp(signUpRequestEntity);

      expect(result.fold(id, id), isA<PasswordDontMatch>());
    });
  });
}

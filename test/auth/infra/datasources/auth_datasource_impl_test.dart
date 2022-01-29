import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wall_app_frontend/auth/data/datasources/auth_datasource.dart';
import 'package:wall_app_frontend/auth/data/models/signup_response_model.dart';
import 'package:wall_app_frontend/auth/infra/datasources/auth_datasource_impl.dart';

import 'mocks/auth_datasource_mocks.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late Dio _dio;
  late AuthDatasource _datasource;

  setUpAll(() {
    _dio = DioMock();
    _datasource = AuthDatasourceImpl(_dio);
  });
  group('signUp', () {
    test('''
    Given a valid call to method signUp with valid values,
    When dio returns a status code 200 or 201 with content,
    Then should return a SignUpResponseModel
  ''', () async {
      when(() => _dio.post(any(), data: any(named: "data"))).thenAnswer(
        (_) async => Response(
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
          data: json.decode(signUpResponseMock),
        ),
      );

      final result = await _datasource.signUp(signUpRequestMock);
      expect(result, isA<SignUpResponseModel>());
    });
  });
}

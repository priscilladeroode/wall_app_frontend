import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wall_app_frontend/posts/data/datasources/posts_datasource.dart';
import 'package:wall_app_frontend/posts/data/models/post_response_model.dart';
import 'package:wall_app_frontend/posts/domain/failures/posts_failures.dart';
import 'package:wall_app_frontend/posts/infra/datasources/posts_datasource_impl.dart';

import 'mocks/posts_datasource_mocks.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late Dio _dio;
  late PostsDatasource _datasource;

  setUpAll(() {
    _dio = DioMock();
    _datasource = PostsDatasourceImpl(_dio);
  });

  group('loadAll', () {
    test('''
    Given a valid call to method loadAll,
    When dio returns a status code 200 with content,
    Then should return a list of posts
  ''', () async {
      when(() => _dio.get(any())).thenAnswer(
        (_) async => Response(
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
          data: json.decode(postListJsonMock),
        ),
      );

      final result = await _datasource.loadAll();
      expect(result, isA<List<PostResponseModel>>());
    });

    test('''
    Given a valid call to method loadAll,
    When dio returns a status code 200 with an empty list,
    Then should return an empty list of posts
  ''', () async {
      when(() => _dio.get(any())).thenAnswer(
        (_) async => Response(
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
          data: json.decode('[]'),
        ),
      );

      final result = await _datasource.loadAll();
      expect(result, isA<List<PostResponseModel>>());
    });

    test('''
    Given a valid call to method loadAll,
    When dio returns a status code different then 200,
    Then should throw an PostsDatasourceError
  ''', () async {
      when(() => _dio.get(any())).thenAnswer(
        (_) async => Response(
          statusCode: 400,
          requestOptions: RequestOptions(path: ''),
          data: json.decode('[]'),
        ),
      );

      final result = _datasource.loadAll();
      expect(result, throwsA(isA<PostsDatasourceError>()));
    });

    test('''
    Given a valid call to method loadAll,
    When dio throws,
    Then should throw.
  ''', () async {
      when(() => _dio.get(any())).thenThrow(Exception());

      final result = _datasource.loadAll();
      expect(result, throwsA(isA<Exception>()));
    });
  });

  group('loadById', () {
    test('''
    Given a valid call to method loadById,
    When dio returns a status code 200 with content,
    Then should return a posts
  ''', () async {
      when(() => _dio.get(any())).thenAnswer(
        (_) async => Response(
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
          data: json.decode(postJsonMock),
        ),
      );

      final result = await _datasource.loadById('');
      expect(result, isA<PostResponseModel>());
    });

    test('''
    Given a valid call to method loadById,
    When dio returns a status code different then 200,
    Then should throw an PostsDatasourceError
  ''', () async {
      when(() => _dio.get(any())).thenAnswer(
        (_) async => Response(
          statusCode: 400,
          requestOptions: RequestOptions(path: ''),
          data: json.decode('{}'),
        ),
      );

      final result = _datasource.loadById('');
      expect(result, throwsA(isA<PostsDatasourceError>()));
    });

    test('''
    Given a valid call to method loadById,
    When dio throws,
    Then should throw.
  ''', () async {
      when(() => _dio.get(any())).thenThrow(Exception());

      final result = _datasource.loadById('');
      expect(result, throwsA(isA<Exception>()));
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wall_app_frontend/commons/local_storage/data/mapper/user_from_domain_mapper.dart';
import 'package:wall_app_frontend/commons/local_storage/data/models/user_model.dart';
import 'package:wall_app_frontend/commons/local_storage/data/repositories/local_storage_repository_impl.dart';
import 'package:wall_app_frontend/commons/local_storage/data/storages/local_storage.dart';
import 'package:wall_app_frontend/commons/local_storage/domain/entities/user_entity.dart';
import 'package:wall_app_frontend/commons/local_storage/domain/repositories/local_storage_repository.dart';

class LocalStorageMock extends Mock implements LocalStorage {}

class UserFromDomainMapperMock extends Mock implements UserFromDomainMapper {}

void main() {
  late LocalStorage _storage;
  late UserFromDomainMapper _mapperFromDomain;
  late LocalStorageRepository _repository;

  setUpAll(() {
    _storage = LocalStorageMock();
    _mapperFromDomain = UserFromDomainMapperMock();
    _repository = LocalStorageRepositoryImpl(_storage, _mapperFromDomain);
  });
  test('''
    Given a valid userInfo,
    When storage save the info,
    Then should return true.
  ''', () async {
    final userEntity = UserEntity(name: '', email: '', accessToken: '');
    final userModel = UserModel(name: '', email: '', accessToken: '');
    when(() => _mapperFromDomain.handle(userEntity)).thenReturn(userModel);
    when(() => _storage.saveUserInfo(userModel)).thenAnswer((_) async => true);

    final _result = await _repository.saveUserInfo(userEntity);

    expect(_result, true);
  });

  test('''
    Given a valid userInfo,
    When storage cant save the info,
    Then should return false.
  ''', () async {
    final userEntity = UserEntity(name: '', email: '', accessToken: '');
    final userModel = UserModel(name: '', email: '', accessToken: '');
    when(() => _mapperFromDomain.handle(userEntity)).thenReturn(userModel);
    when(() => _storage.saveUserInfo(userModel)).thenAnswer((_) async => false);

    final _result = await _repository.saveUserInfo(userEntity);

    expect(_result, false);
  });
}

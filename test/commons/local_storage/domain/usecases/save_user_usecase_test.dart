import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wall_app_frontend/commons/local_storage/domain/entities/user_entity.dart';
import 'package:wall_app_frontend/commons/local_storage/domain/repositories/local_storage_repository.dart';
import 'package:wall_app_frontend/commons/local_storage/domain/usecases/save_user_usecase.dart';

class LocalStorageRepositoryMock extends Mock implements LocalStorageRepository {}

void main() {
  late SaveUserUseCase _usecase;
  late LocalStorageRepository _repository;

  setUpAll(() {
    _repository = LocalStorageRepositoryMock();
    _usecase = SaveUserUseCaseImpl(_repository);
  });
  test('''
    Given a valid user info,
    When repository returns true,
    Then usecase should return true.
  ''', () async {
    final userInfo = UserEntity(name: '', email: '', accessToken: '');
    when(() => _repository.saveUserInfo(userInfo)).thenAnswer((_) async => true);

    final _result = await _usecase(userInfo);

    expect(_result, true);
  });

  test('''
    Given a valid user info,
    When repository returns false,
    Then usecase should return false.
  ''', () async {
    final userInfo = UserEntity(name: '', email: '', accessToken: '');
    when(() => _repository.saveUserInfo(userInfo)).thenAnswer((_) async => false);

    final _result = await _usecase(userInfo);

    expect(_result, false);
  });
}

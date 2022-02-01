import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wall_app_frontend/commons/local_storage/domain/entities/user_entity.dart';
import 'package:wall_app_frontend/commons/local_storage/domain/repositories/local_storage_repository.dart';
import 'package:wall_app_frontend/commons/local_storage/domain/usecases/get_user_usecase.dart';
import 'package:wall_app_frontend/commons/local_storage/domain/usecases/save_user_usecase.dart';

class LocalStorageRepositoryMock extends Mock implements LocalStorageRepository {}

void main() {
  late GetUserUseCase _usecase;
  late LocalStorageRepository _repository;

  setUpAll(() {
    _repository = LocalStorageRepositoryMock();
    _usecase = GetUserUseCaseImpl(_repository);
  });
  test('''
    Given a valid call,
    When repository returns a user,
    Then usecase should return the user.
  ''', () async {
    final userInfo = UserEntity(name: '', email: '', accessToken: '');
    when(() => _repository.getUserInfo()).thenAnswer((_) async => userInfo);

    final _result = await _usecase();

    expect(_result, userInfo);
  });

  test('''
    Given a valid call,
    When repository returns null,
    Then usecase should return null.
  ''', () async {
    when(() => _repository.getUserInfo()).thenAnswer((_) async => null);

    final _result = await _usecase();

    expect(_result, null);
  });
}

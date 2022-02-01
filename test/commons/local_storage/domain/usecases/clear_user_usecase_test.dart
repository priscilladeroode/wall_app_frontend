import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wall_app_frontend/commons/local_storage/domain/repositories/local_storage_repository.dart';
import 'package:wall_app_frontend/commons/local_storage/domain/usecases/clear_user_usecase.dart';

class LocalStorageRepositoryMock extends Mock implements LocalStorageRepository {}

void main() {
  late ClearUserUseCase _usecase;
  late LocalStorageRepository _repository;

  setUpAll(() {
    _repository = LocalStorageRepositoryMock();
    _usecase = ClearUserUseCaseImpl(_repository);
  });
  test('''
    Given a valid call,
    When repository returns null,
    Then usecase should return null.
  ''', () async {
    when(() => _repository.clearLocalStorage()).thenAnswer((_) async => {});

    await _usecase();

    verify(() => _repository.clearLocalStorage()).called(1);
  });
}

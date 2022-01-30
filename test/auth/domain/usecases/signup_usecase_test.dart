import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wall_app_frontend/auth/domain/entities/signup_response_entity.dart';
import 'package:wall_app_frontend/auth/domain/repositories/auth_repository.dart';
import 'package:wall_app_frontend/auth/domain/usecases/signup_usecase.dart';
import 'package:wall_app_frontend/commons/either.dart';

import '../../data/mocks/auth_data_mocks.dart';

class AuthRepositoryMock extends Mock implements AuthRepository {}

void main() {
  late AuthRepository repository;
  late SignUpUseCase usecase;

  setUpAll(() {
    repository = AuthRepositoryMock();
    usecase = SignUpUseCaseImpl(repository);
  });
  test('''
    Given a valid call for signUp,
    When repository returns a SignUpResponseEntity,
    Then should return a SignUpResponseEntity.
  ''', () async {
    when(() => repository.signUp(signUpRequestEntity))
        .thenAnswer((_) async => right(signUpResponseEntity));

    final result = await usecase(signUpRequestEntity);

    expect(result.fold(id, id), isA<SignUpResponseEntity>());
  });
}
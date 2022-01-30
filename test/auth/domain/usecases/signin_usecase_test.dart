import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wall_app_frontend/auth/domain/entities/auth_response_entity.dart';
import 'package:wall_app_frontend/auth/domain/failures/auth_failures.dart';
import 'package:wall_app_frontend/auth/domain/repositories/auth_repository.dart';
import 'package:wall_app_frontend/auth/domain/usecases/signin_usecase.dart';
import 'package:wall_app_frontend/commons/either.dart';

import '../../data/mocks/auth_data_mocks.dart';

class AuthRepositoryMock extends Mock implements AuthRepository {}

void main() {
  late AuthRepository repository;
  late SignInUseCase usecase;

  setUpAll(() {
    repository = AuthRepositoryMock();
    usecase = SignInUseCaseImpl(repository);
  });
  test('''
    Given a valid call for signIn,
    When repository returns a AuthResponseEntity,
    Then should return a AuthResponseEntity.
  ''', () async {
    when(() => repository.signIn(signInRequestEntity))
        .thenAnswer((_) async => right(authResponseEntity));

    final result = await usecase(signInRequestEntity);

    expect(result.fold(id, id), isA<AuthResponseEntity>());
  });

  test('''
    Given a valid call for signIn,
    When repository returns a failure,
    Then should return a failure.
  ''', () async {
    when(() => repository.signIn(signInRequestEntity))
        .thenAnswer((_) async => left(AuthRepositoryFailure()));

    final result = await usecase(signInRequestEntity);

    expect(result.fold(id, id), isA<AuthFailures>());
  });
}

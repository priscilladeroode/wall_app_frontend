import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wall_app_frontend/auth/domain/entities/signin_request_entity.dart';
import 'package:wall_app_frontend/auth/domain/failures/auth_failures.dart';
import 'package:wall_app_frontend/auth/domain/usecases/signin_usecase.dart';
import 'package:wall_app_frontend/auth/presentation/signin_page/components/sign_in_form/signin_form_controller.dart';
import 'package:wall_app_frontend/auth/presentation/signin_page/components/sign_in_form/stores/signin_form_store.dart';
import 'package:wall_app_frontend/auth/presentation/stores/auth_store.dart';
import 'package:wall_app_frontend/commons/either.dart';

class SignInUseCaseMock extends Mock implements SignInUseCase {}

class SignInFormStoreMock extends Mock implements SignInFormStore {}

class SignInRequestEntityFake extends Fake implements SignInRequestEntity {}

class AuthStoreMock extends Mock implements AuthStore {}

void main() {
  late SignInFormStore _store;
  late SignInUseCase _usecase;
  late SignInFormController _controller;
  late AuthStore _authStore;

  setUpAll(() {
    _store = SignInFormStoreMock();
    _usecase = SignInUseCaseMock();
    _authStore = AuthStoreMock();
    _controller = SignInFormController(_usecase, _store, _authStore);
    registerFallbackValue(SignInRequestEntityFake());
  });
  test('''
    Given a valid call for signIn method,
    When usecase returns a failure,
    Then a error message should be set in the store.
  ''', () async {
    final emailController = TextEditingController(text: '');
    final passwordController = TextEditingController(text: '');
    when(() => _store.emailController).thenReturn(emailController);
    when(() => _store.passwordController).thenReturn(passwordController);
    when(() => _usecase(any())).thenAnswer((_) async => left(InvalidEmail()));

    await _controller.signIn();

    verify(() => _store.setLoading = any()).called(2);
    verify(() => _store.setError = any()).called(2);
  });

  test(
    '''
    Given a invalid email,
    When validateEmail is called,
    Then should return a InvalidEmail message.
  ''',
    () {
      final _result = _controller.validateEmail('');

      expect(_result, InvalidEmail().message);
    },
  );

  test(
    '''
    Given a valid email,
    When validateEmail is called,
    Then should return null.
  ''',
    () {
      final _result = _controller.validateEmail(faker.internet.email());

      expect(_result, null);
    },
  );

  test(
    '''
    Given a invalid password,
    When validatePassword is called,
    Then should return a InvalidPasswordLength message.
  ''',
    () {
      final _result = _controller.validatePassword('');

      expect(_result, InvalidPasswordLength().message);
    },
  );

  test(
    '''
    Given a valid password,
    When validatePassword is called,
    Then should return null.
  ''',
    () {
      final password = faker.internet.password();
      final passwordController = TextEditingController(text: password);
      when(() => _store.passwordController).thenReturn(passwordController);
      final _result = _controller.validatePassword(password);

      expect(_result, null);
    },
  );
}

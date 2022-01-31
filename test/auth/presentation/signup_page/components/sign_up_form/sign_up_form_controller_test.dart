import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wall_app_frontend/auth/domain/entities/signup_request_entity.dart';
import 'package:wall_app_frontend/auth/domain/failures/auth_failures.dart';
import 'package:wall_app_frontend/auth/domain/usecases/signup_usecase.dart';
import 'package:wall_app_frontend/auth/presentation/signup_page/components/sign_up_form/sign_up_form_controller.dart';
import 'package:wall_app_frontend/auth/presentation/signup_page/components/sign_up_form/stores/signup_form_store.dart';
import 'package:wall_app_frontend/auth/presentation/stores/auth_store.dart';
import 'package:wall_app_frontend/commons/either.dart';
import 'package:wall_app_frontend/commons/local_storage/domain/entities/user_entity.dart';
import 'package:wall_app_frontend/commons/local_storage/domain/usecases/save_user_usecase.dart';

import '../../../../data/mocks/auth_data_mocks.dart';

class SignUpUseCaseMock extends Mock implements SignUpUseCase {}

class SignUpFormStoreMock extends Mock implements SignUpFormStore {}

class SignUpRequestEntityFake extends Fake implements SignUpRequestEntity {}

class AuthStoreMock extends Mock implements AuthStore {}

class SaveUserUseCaseMock extends Mock implements SaveUserUseCase {}

class ModularNavigateMock extends Mock implements IModularNavigator {}

class UserEntityFake extends Fake implements UserEntity {}

void main() {
  late SignUpFormStore _store;
  late SignUpUseCase _usecase;
  late SignUpFormController _controller;
  late AuthStore _authStore;
  late SaveUserUseCase _saveUser;
  final navigate = ModularNavigateMock();
  Modular.navigatorDelegate = navigate;

  setUpAll(() {
    _store = SignUpFormStoreMock();
    _usecase = SignUpUseCaseMock();
    _authStore = AuthStoreMock();
    _saveUser = SaveUserUseCaseMock();
    _controller = SignUpFormController(_usecase, _store, _authStore, _saveUser);
    registerFallbackValue(SignUpRequestEntityFake());
    registerFallbackValue(UserEntityFake());
  });
  test('''
    Given a valid call for register method,
    When usecase returns a failure,
    Then a error message should be set in the store.
  ''', () async {
    final emailController = TextEditingController(text: '');
    final fullNameController = TextEditingController(text: '');
    final passwordController = TextEditingController(text: '');
    final passwordConfirmationController = TextEditingController(text: '');
    when(() => _store.emailController).thenReturn(emailController);
    when(() => _store.fullNameController).thenReturn(fullNameController);
    when(() => _store.passwordController).thenReturn(passwordController);
    when(() => _store.passwordConfirmationController).thenReturn(passwordConfirmationController);
    when(() => _usecase(any())).thenAnswer((_) async => left(EmailInUse()));

    await _controller.register();

    verify(() => _store.setLoading = any()).called(2);
    verify(() => _store.setError = any()).called(2);
  });

  test('''
    Given a valid call for register method,
    When usecase returns a AuthResponseEntity,
    Then the values must be set in store and local storage
  ''', () async {
    final emailController = TextEditingController(text: '');
    final fullNameController = TextEditingController(text: '');
    final passwordController = TextEditingController(text: '');
    final passwordConfirmationController = TextEditingController(text: '');
    when(() => _store.emailController).thenReturn(emailController);
    when(() => _store.fullNameController).thenReturn(fullNameController);
    when(() => _store.passwordController).thenReturn(passwordController);
    when(() => _store.passwordConfirmationController).thenReturn(passwordConfirmationController);
    when(() => _usecase(any())).thenAnswer((_) async => right(authResponseEntity));
    when(() => _saveUser(any())).thenAnswer((_) async => true);

    await _controller.register();

    verify(() => _store.setLoading = any()).called(2);
    verify(() => _authStore.setName = any()).called(1);
    verify(() => _authStore.setEmail = any()).called(1);
    verify(() => _authStore.setAccessToken = any()).called(1);
  });

  test(
    '''
    Given a invalid value,
    When validateName is called,
    Then should return a InvalidName message.
  ''',
    () {
      final _result = _controller.validateName('');

      expect(_result, InvalidName().message);
    },
  );

  test(
    '''
    Given a valid value,
    When validateName is called,
    Then should return null.
  ''',
    () {
      final _result = _controller.validateName(faker.person.name());

      expect(_result, null);
    },
  );

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
      final passwordConfirmationController = TextEditingController(text: password);
      when(() => _store.passwordController).thenReturn(passwordController);
      when(() => _store.passwordConfirmationController).thenReturn(passwordConfirmationController);
      final _result = _controller.validatePassword(password);

      expect(_result, null);
    },
  );

  test(
    '''
    Given a invalid password and passwordCombination,
    When validatePassword is called,
    Then should return PasswordDontMatch message.
  ''',
    () {
      final password = faker.internet.password();
      final passwordController = TextEditingController(text: password);
      final passwordConfirmationController = TextEditingController(text: faker.internet.password());
      when(() => _store.passwordController).thenReturn(passwordController);
      when(() => _store.passwordConfirmationController).thenReturn(passwordConfirmationController);
      final _result = _controller.validatePassword(password);

      expect(_result, PasswordDontMatch().message);
    },
  );
}

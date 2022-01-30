import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wall_app_frontend/auth/domain/entities/signup_request_entity.dart';
import 'package:wall_app_frontend/auth/domain/failures/auth_failures.dart';
import 'package:wall_app_frontend/auth/domain/usecases/signup_usecase.dart';
import 'package:wall_app_frontend/auth/presentation/signup_page/components/sign_up_form/sign_up_form_controller.dart';
import 'package:wall_app_frontend/auth/presentation/signup_page/components/sign_up_form/stores/signup_form_store.dart';
import 'package:wall_app_frontend/commons/either.dart';

class SignUpUseCaseMock extends Mock implements SignUpUseCase {}

class SignUpFormStoreMock extends Mock implements SignUpFormStore {}

class SignUpRequestEntityFake extends Fake implements SignUpRequestEntity {}

void main() {
  late SignUpFormStore _store;
  late SignUpUseCase _usecase;
  late SignUpFormController _controller;

  setUpAll(() {
    _store = SignUpFormStoreMock();
    _usecase = SignUpUseCaseMock();
    _controller = SignUpFormController(_usecase, _store);
    registerFallbackValue(SignUpRequestEntityFake());
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

    final _result = await _controller.register();

    verify(() => _store.setLoading = any()).called(2);
    verify(() => _store.setError = any()).called(2);
  });
}

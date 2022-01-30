// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignInFormStore on SignInFormStoreBase, Store {
  final _$loadingAtom = Atom(name: 'SignInFormStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$emailControllerAtom =
      Atom(name: 'SignInFormStoreBase.emailController');

  @override
  TextEditingController get emailController {
    _$emailControllerAtom.reportRead();
    return super.emailController;
  }

  @override
  set emailController(TextEditingController value) {
    _$emailControllerAtom.reportWrite(value, super.emailController, () {
      super.emailController = value;
    });
  }

  final _$passwordControllerAtom =
      Atom(name: 'SignInFormStoreBase.passwordController');

  @override
  TextEditingController get passwordController {
    _$passwordControllerAtom.reportRead();
    return super.passwordController;
  }

  @override
  set passwordController(TextEditingController value) {
    _$passwordControllerAtom.reportWrite(value, super.passwordController, () {
      super.passwordController = value;
    });
  }

  final _$passwordObscureAtom =
      Atom(name: 'SignInFormStoreBase.passwordObscure');

  @override
  bool get passwordObscure {
    _$passwordObscureAtom.reportRead();
    return super.passwordObscure;
  }

  @override
  set passwordObscure(bool value) {
    _$passwordObscureAtom.reportWrite(value, super.passwordObscure, () {
      super.passwordObscure = value;
    });
  }

  final _$errorAtom = Atom(name: 'SignInFormStoreBase.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$SignInFormStoreBaseActionController =
      ActionController(name: 'SignInFormStoreBase');

  @override
  dynamic setPasswordVisibility() {
    final _$actionInfo = _$SignInFormStoreBaseActionController.startAction(
        name: 'SignInFormStoreBase.setPasswordVisibility');
    try {
      return super.setPasswordVisibility();
    } finally {
      _$SignInFormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
emailController: ${emailController},
passwordController: ${passwordController},
passwordObscure: ${passwordObscure},
error: ${error}
    ''';
  }
}

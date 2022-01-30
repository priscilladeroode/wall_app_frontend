// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpFormStore on SignUpFormStoreBase, Store {
  final _$loadingAtom = Atom(name: 'SignUpFormStoreBase.loading');

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

  final _$fullNameControllerAtom =
      Atom(name: 'SignUpFormStoreBase.fullNameController');

  @override
  TextEditingController get fullNameController {
    _$fullNameControllerAtom.reportRead();
    return super.fullNameController;
  }

  @override
  set fullNameController(TextEditingController value) {
    _$fullNameControllerAtom.reportWrite(value, super.fullNameController, () {
      super.fullNameController = value;
    });
  }

  final _$emailControllerAtom =
      Atom(name: 'SignUpFormStoreBase.emailController');

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
      Atom(name: 'SignUpFormStoreBase.passwordController');

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

  final _$passwordConfirmationControllerAtom =
      Atom(name: 'SignUpFormStoreBase.passwordConfirmationController');

  @override
  TextEditingController get passwordConfirmationController {
    _$passwordConfirmationControllerAtom.reportRead();
    return super.passwordConfirmationController;
  }

  @override
  set passwordConfirmationController(TextEditingController value) {
    _$passwordConfirmationControllerAtom
        .reportWrite(value, super.passwordConfirmationController, () {
      super.passwordConfirmationController = value;
    });
  }

  final _$passwordObscureAtom =
      Atom(name: 'SignUpFormStoreBase.passwordObscure');

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

  final _$passwordConfirmationObscureAtom =
      Atom(name: 'SignUpFormStoreBase.passwordConfirmationObscure');

  @override
  bool get passwordConfirmationObscure {
    _$passwordConfirmationObscureAtom.reportRead();
    return super.passwordConfirmationObscure;
  }

  @override
  set passwordConfirmationObscure(bool value) {
    _$passwordConfirmationObscureAtom
        .reportWrite(value, super.passwordConfirmationObscure, () {
      super.passwordConfirmationObscure = value;
    });
  }

  final _$errorAtom = Atom(name: 'SignUpFormStoreBase.error');

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

  final _$SignUpFormStoreBaseActionController =
      ActionController(name: 'SignUpFormStoreBase');

  @override
  dynamic setPasswordVisibility() {
    final _$actionInfo = _$SignUpFormStoreBaseActionController.startAction(
        name: 'SignUpFormStoreBase.setPasswordVisibility');
    try {
      return super.setPasswordVisibility();
    } finally {
      _$SignUpFormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPasswordConfirmationVisibility() {
    final _$actionInfo = _$SignUpFormStoreBaseActionController.startAction(
        name: 'SignUpFormStoreBase.setPasswordConfirmationVisibility');
    try {
      return super.setPasswordConfirmationVisibility();
    } finally {
      _$SignUpFormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
fullNameController: ${fullNameController},
emailController: ${emailController},
passwordController: ${passwordController},
passwordConfirmationController: ${passwordConfirmationController},
passwordObscure: ${passwordObscure},
passwordConfirmationObscure: ${passwordConfirmationObscure},
error: ${error}
    ''';
  }
}

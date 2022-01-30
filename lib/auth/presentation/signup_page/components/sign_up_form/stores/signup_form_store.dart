import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'signup_form_store.g.dart';

class SignUpFormStore = SignUpFormStoreBase with _$SignUpFormStore;

abstract class SignUpFormStoreBase with Store {
  @observable
  bool loading = false;

  @observable
  TextEditingController fullNameController = TextEditingController();

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  TextEditingController passwordController = TextEditingController();

  @observable
  TextEditingController passwordConfirmationController = TextEditingController();

  @observable
  bool passwordObscure = true;

  @observable
  bool passwordConfirmationObscure = true;

  @observable
  String error = '';

  @action
  setPasswordVisibility() => passwordObscure = !passwordObscure;

  @action
  setPasswordConfirmationVisibility() => passwordConfirmationObscure = !passwordConfirmationObscure;

  set setError(String value) => error = value;

  set setLoading(bool value) => loading = value;
}

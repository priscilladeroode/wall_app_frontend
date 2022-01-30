import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

part 'signin_form_store.g.dart';

class SignInFormStore = SignInFormStoreBase with _$SignInFormStore;

abstract class SignInFormStoreBase with Store {
  @observable
  bool loading = false;

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  TextEditingController passwordController = TextEditingController();

  @observable
  bool passwordObscure = true;

  @observable
  String error = '';

  @action
  setPasswordVisibility() => passwordObscure = !passwordObscure;

  set setError(String value) => error = value;

  set setLoading(bool value) => loading = value;
}

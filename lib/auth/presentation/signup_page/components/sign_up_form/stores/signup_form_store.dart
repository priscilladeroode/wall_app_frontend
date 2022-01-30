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
  bool passwordVisibility = false;

  @observable
  bool passwordConfirmationVisibility = false;

  @observable
  String error = '';

  @action
  setPasswordVisibility() => passwordVisibility = !passwordVisibility;

  @action
  setPasswordConfirmationVisibility() =>
      passwordConfirmationVisibility = !passwordConfirmationVisibility;

  set setError(String value) => error = value;

  set setLoading(bool value) => loading = value;
}

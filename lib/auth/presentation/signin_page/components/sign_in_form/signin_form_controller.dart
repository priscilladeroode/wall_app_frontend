import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:validators/validators.dart' as validator;

import '../../../../domain/entities/signin_request_entity.dart';
import '../../../../domain/failures/auth_failures.dart';
import '../../../../domain/usecases/signin_usecase.dart';
import '../../../stores/auth_store.dart';
import 'stores/signin_form_store.dart';

class SignInFormController {
  final SignInUseCase usecase;
  final SignInFormStore store;
  final AuthStore authStore;

  SignInFormController(this.usecase, this.store, this.authStore);

  Future<void> signIn() async {
    store.setLoading = true;
    store.setError = '';

    final _result = await usecase(
      SignInRequestEntity(
        email: store.emailController.text,
        password: store.passwordController.text.toLowerCase(),
      ),
    );
    _result.fold(
      (l) => store.setError = l.message ?? "Ops... an error occured. Try again later.",
      (r) async {
        authStore.setName = r.name;
        authStore.setEmail = r.email;
        authStore.setAccessToken = r.accessToken;
        final SharedPreferences _prefs = await SharedPreferences.getInstance();
        _prefs.setString('name', r.name);
        _prefs.setString('email', r.email);
        _prefs.setString('accessToken', r.accessToken);

        Modular.to.navigate("/home/myHome");
      },
    );
    store.setLoading = false;
  }

  String? validateEmail(value) {
    if (!validator.isEmail(value!)) {
      return InvalidEmail().message;
    }
  }

  String? validatePassword(value) {
    if (value!.length < 6 || value.length > 10) {
      return InvalidPasswordLength().message;
    }
  }
}

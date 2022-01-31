import 'package:validators/validators.dart' as validator;
import 'package:wall_app_frontend/auth/presentation/stores/auth_store.dart';

import '../../../../domain/entities/signup_request_entity.dart';
import '../../../../domain/failures/auth_failures.dart';
import '../../../../domain/usecases/signup_usecase.dart';
import 'stores/signup_form_store.dart';

class SignUpFormController {
  final SignUpUseCase usecase;
  final SignUpFormStore store;
  final AuthStore authStore;

  SignUpFormController(this.usecase, this.store, this.authStore);

  Future<void> register() async {
    store.setLoading = true;
    store.setError = '';
    final _result = await usecase(
      SignUpRequestEntity(
        email: store.emailController.text,
        name: store.fullNameController.text,
        password: store.passwordController.text.toLowerCase(),
        passwordConfirmation: store.passwordConfirmationController.text,
      ),
    );
    _result.fold(
      (l) => store.setError = l.message ?? "Ops... an error occured. Try again later.",
      (r) {
        authStore.setName = r.name;
        authStore.setEmail = r.email;
        authStore.setAccessToken = r.accessToken;
      },
    );
    store.setLoading = false;
  }

  String? validateName(value) {
    if (!validator.matches(value!,
        '(^[A-Za-z]{3,16})([ ]{1})([A-Za-z]{1,16})?([ ]{1})?([A-Za-z]{1,16})?([ ]{1})?([A-Za-z]{1,16})')) {
      return InvalidName().message;
    }
  }

  String? validateEmail(value) {
    if (!validator.isEmail(value!)) {
      return InvalidEmail().message;
    }
  }

  String? validatePassword(value) {
    if (value!.length < 6 || value.length > 10) {
      return InvalidPasswordLength().message;
    } else if (store.passwordConfirmationController.text != store.passwordController.text) {
      return PasswordDontMatch().message;
    }
  }
}
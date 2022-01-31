import 'package:flutter_modular/flutter_modular.dart';
import 'package:validators/validators.dart' as validator;
import '../../../../../commons/local_storage/domain/entities/user_entity.dart';
import '../../../../../commons/local_storage/domain/usecases/save_user_usecase.dart';

import '../../../../domain/entities/signup_request_entity.dart';
import '../../../../domain/failures/auth_failures.dart';
import '../../../../domain/usecases/signup_usecase.dart';
import '../../../stores/auth_store.dart';
import 'stores/signup_form_store.dart';

class SignUpFormController {
  final SignUpUseCase usecase;
  final SignUpFormStore store;
  final AuthStore authStore;
  final SaveUserUseCase saveUser;

  SignUpFormController(this.usecase, this.store, this.authStore, this.saveUser);

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
      (r) async {
        authStore.setName = r.name;
        authStore.setEmail = r.email;
        authStore.setAccessToken = r.accessToken;
        await saveUser(UserEntity(name: r.name, email: r.email, accessToken: r.accessToken));

        Modular.to.navigate("/home/myHome");
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

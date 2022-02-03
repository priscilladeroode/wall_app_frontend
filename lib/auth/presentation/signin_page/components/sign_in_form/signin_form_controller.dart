import 'package:flutter_modular/flutter_modular.dart';
import 'package:validators/validators.dart' as validator;
import '../../../../../commons/local_storage/domain/entities/user_entity.dart';
import '../../../../../commons/local_storage/domain/usecases/save_user_usecase.dart';

import '../../../../domain/entities/signin_request_entity.dart';
import '../../../../domain/failures/auth_failures.dart';
import '../../../../domain/usecases/signin_usecase.dart';
import '../../../stores/auth_store.dart';
import 'stores/signin_form_store.dart';

class SignInFormController {
  final SignInUseCase usecase;
  final SignInFormStore store;
  final AuthStore authStore;
  final SaveUserUseCase saveUser;

  SignInFormController(this.usecase, this.store, this.authStore, this.saveUser);

  Future<void> signIn() async {
    store.setLoading = true;
    store.setError = '';

    final _result = await usecase(
      SignInRequestEntity(
        email: store.emailController.text.trim().toLowerCase(),
        password: store.passwordController.text.trim(),
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

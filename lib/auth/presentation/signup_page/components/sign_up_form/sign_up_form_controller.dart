import '../../../../domain/entities/signup_request_entity.dart';
import '../../../../domain/usecases/signup_usecase.dart';
import 'stores/signup_form_store.dart';

class SignUpFormController {
  final SignUpUseCase usecase;
  final SignUpFormStore store;

  SignUpFormController(this.usecase, this.store);

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
      (r) => null,
    );
    store.setLoading = false;
  }
}

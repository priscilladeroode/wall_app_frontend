import 'auth/presentation/stores/auth_store.dart';
import 'commons/local_storage/domain/entities/user_entity.dart';
import 'commons/local_storage/domain/usecases/get_user_usecase.dart';
import 'commons/stores/app_store.dart';

class AppController {
  final AuthStore authStore;
  final GetUserUseCase usecase;
  final AppStore store;

  AppController(this.authStore, this.usecase, this.store);

  void verifyIsLogged() async {
    final UserEntity? user = await usecase();
    if (user != null) {
      authStore.setName = user.name;
      authStore.setEmail = user.email;
      authStore.setAccessToken = user.accessToken;
    }
  }
}

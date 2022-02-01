import 'package:flutter_modular/flutter_modular.dart';

import '../../auth/presentation/stores/auth_store.dart';
import '../../commons/local_storage/domain/entities/user_entity.dart';
import '../../commons/local_storage/domain/usecases/get_user_usecase.dart';

class SplashController {
  final AuthStore authStore;
  final GetUserUseCase usecase;

  SplashController(this.authStore, this.usecase);

  void isLogged() async {
    final UserEntity? user = await usecase();
    if (user != null) {
      authStore.setName = user.name;
      authStore.setEmail = user.email;
      authStore.setAccessToken = user.accessToken;
      Modular.to.pushReplacementNamed('/home/myHome');
    } else {
      Modular.to.pushReplacementNamed('/home/');
    }
  }
}

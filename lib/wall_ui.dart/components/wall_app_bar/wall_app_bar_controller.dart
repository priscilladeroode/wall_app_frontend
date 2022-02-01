import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wall_app_frontend/commons/local_storage/domain/usecases/clear_user_usecase.dart';

import '../../../auth/presentation/stores/auth_store.dart';

class WallAppBarController {
  final AuthStore authStore;
  final ClearUserUseCase usecase;

  WallAppBarController(this.authStore, this.usecase);

  void signOut() async {
    await usecase();
    Modular.to.navigate('/home/');
    authStore.setName = null;
    authStore.setEmail = null;
    authStore.setAccessToken = null;
  }
}

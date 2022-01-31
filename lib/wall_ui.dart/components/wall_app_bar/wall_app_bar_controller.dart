import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../auth/presentation/stores/auth_store.dart';

class WallAppBarController {
  final AuthStore authStore;

  WallAppBarController(this.authStore);

  void signOut() {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    _prefs.then((value) {
      value.clear();
      Modular.to.navigate('/home/');
      authStore.setName = null;
      authStore.setEmail = null;
      authStore.setAccessToken = null;
    });
  }
}

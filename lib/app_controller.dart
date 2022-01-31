import 'package:shared_preferences/shared_preferences.dart';

import 'auth/presentation/stores/auth_store.dart';

class AppController {
  final AuthStore authStore;

  AppController(this.authStore);

  void verifyIsLogged() {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    _prefs.then((value) {
      final accessToken = value.getString('accessToken');
      final name = value.getString('name');
      final email = value.getString('email');

      if (accessToken != null && name != null && email != null) {
        authStore.setName = name;
        authStore.setEmail = email;
        authStore.setAccessToken = accessToken;
      }
    });
  }
}

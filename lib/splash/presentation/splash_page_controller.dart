import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../auth/presentation/stores/auth_store.dart';

class SplashController {
  final AuthStore authStore;

  SplashController(this.authStore);

  void isLogged() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final name = _prefs.getString('name');
    final email = _prefs.getString('email');
    final accessToken = _prefs.getString('accessToken');

    if (name != null && email != null && accessToken != null) {
      authStore.setName = name;
      authStore.setAccessToken = accessToken;
      authStore.email = email;
      Modular.to.pushReplacementNamed('/home/myHome');
    } else {
      Modular.to.pushReplacementNamed('/home/');
    }
  }
}

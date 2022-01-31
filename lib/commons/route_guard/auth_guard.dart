import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/home');

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final accessToken = _prefs.getString('accessToken');
    return accessToken != null;
  }
}

import 'package:flutter_modular/flutter_modular.dart';
import '../local_storage/infra/storages/shared_preferences_storage.dart';

class NoAuthGuard extends RouteGuard {
  NoAuthGuard() : super(redirectTo: '/home/myHome');

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    final user = await Modular.get<SharedPreferencesStorage>().getUserInfo();
    return user?.accessToken == null;
  }
}

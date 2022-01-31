import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'auth/auth_module.dart';
import 'auth/presentation/stores/auth_store.dart';
import 'posts/posts_module.dart';
import 'splash/splash_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => Dio()),
        Bind.singleton((i) => AuthStore()),
        Bind.lazySingleton((i) => AppController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: SplashModule()),
        ModuleRoute("/home", module: PostsModule()),
        ModuleRoute("/auth", module: AuthModule()),
      ];
}

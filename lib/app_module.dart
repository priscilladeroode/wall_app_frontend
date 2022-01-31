import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'auth/auth_module.dart';
import 'auth/presentation/stores/auth_store.dart';
import 'posts/posts_module.dart';
import 'splash/splash_module.dart';
import 'wall_ui.dart/components/wall_app_bar/wall_app_bar_controller.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => Dio()),
        Bind.singleton((i) => AuthStore()),
        Bind.lazySingleton((i) => AppController(i())),
        Bind.lazySingleton((i) => WallAppBarController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: SplashModule()),
        ModuleRoute("/home", module: PostsModule()),
        ModuleRoute("/auth", module: AuthModule()),
      ];
}

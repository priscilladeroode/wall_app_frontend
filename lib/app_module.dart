import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'auth/auth_module.dart';
import 'posts/posts_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [Bind.factory((i) => Dio())];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: PostsModule()),
        ModuleRoute("/auth", module: AuthModule()),
      ];
}

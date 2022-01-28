import 'package:flutter_modular/flutter_modular.dart';
import 'posts/posts_module.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: PostsModule()),
      ];
}

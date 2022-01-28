import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/home_page/home_page.dart';

class PostsModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) => const HomePage()),
      ];
}

import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/splash_page.dart';
import 'presentation/splash_page_controller.dart';

class SplashModule extends Module {
  @override
  List<Bind> get binds => [Bind.factory((i) => SplashController(i(), i()))];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) => const SplashPage()),
      ];
}

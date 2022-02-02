import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'auth/auth_module.dart';
import 'auth/presentation/stores/auth_store.dart';
import 'commons/local_storage/data/mapper/user_from_domain_mapper.dart';
import 'commons/local_storage/data/mapper/user_to_domain_mapper.dart';
import 'commons/local_storage/data/repositories/local_storage_repository_impl.dart';
import 'commons/local_storage/data/storages/local_storage.dart';
import 'commons/local_storage/domain/usecases/clear_user_usecase.dart';
import 'commons/local_storage/domain/usecases/get_user_usecase.dart';
import 'commons/local_storage/domain/usecases/save_user_usecase.dart';
import 'commons/local_storage/infra/storages/shared_preferences_storage.dart';
import 'commons/stores/app_store.dart';
import 'posts/posts_module.dart';
import 'splash/splash_module.dart';
import 'wall_ui/components/wall_app_bar/wall_app_bar_controller.dart';
import 'wall_ui/components/wall_theme_mode_switch/wall_theme_mode_switch_controller.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => Dio()),
        Bind.singleton((i) => AuthStore()),
        Bind.singleton((i) => AppStore()),
        Bind.lazySingleton((i) => AppController(i(), i(), i())),
        Bind.lazySingleton((i) => WallThemeModeSwitcherController(i())),
        Bind.lazySingleton((i) => WallAppBarController(i(), i())),
        Bind.factory((i) => ClearUserUseCaseImpl(i())),
        Bind.factory((i) => SaveUserUseCaseImpl(i())),
        Bind.factory((i) => GetUserUseCaseImpl(i())),
        Bind.factory((i) => LocalStorageRepositoryImpl(i(), i(), i())),
        Bind.factory((i) => UserFromDomainMapper()),
        Bind.factory((i) => UserToDomainMapper()),
        Bind.factory<LocalStorage>((i) => SharedPreferencesStorage()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: SplashModule()),
        ModuleRoute("/home", module: PostsModule()),
        ModuleRoute("/auth", module: AuthModule()),
      ];
}

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_controller.dart';
import 'auth/auth_module.dart';
import 'auth/presentation/stores/auth_store.dart';
import 'commons/local_storage/data/mapper/user_from_domain_mapper.dart';
import 'commons/local_storage/data/repositories/local_storage_repository_impl.dart';
import 'commons/local_storage/data/storages/local_storage.dart';
import 'commons/local_storage/domain/usecases/save_user_usecase.dart';
import 'commons/local_storage/infra/storages/shared_preferences_storage.dart';
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
        Bind.factory((i) => SaveUserUseCaseImpl(i())),
        Bind.factory((i) => LocalStorageRepositoryImpl(i(), i())),
        Bind.factory((i) => UserFromDomainMapper()),
        Bind.lazySingleton<LocalStorage>((i) => SharedPreferencesStorage()),
        AsyncBind<SharedPreferences>((i) => SharedPreferences.getInstance()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: SplashModule()),
        ModuleRoute("/home", module: PostsModule()),
        ModuleRoute("/auth", module: AuthModule()),
      ];
}

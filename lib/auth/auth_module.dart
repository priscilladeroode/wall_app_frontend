import 'package:flutter_modular/flutter_modular.dart';

import 'data/mappers/auth_to_domain_mapper.dart';
import 'data/mappers/signup_from_domain_mapper.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/usecases/signup_usecase.dart';
import 'infra/datasources/auth_datasource_impl.dart';
import 'presentation/signup_page/components/sign_up_form/sign_up_form_controller.dart';
import 'presentation/signup_page/components/sign_up_form/stores/signup_form_store.dart';
import 'presentation/signup_page/signup_page.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => SignUpFormStore()),
        Bind.factory((i) => SignUpFormController(i(), i())),
        Bind.factory((i) => SignUpUseCaseImpl(i())),
        Bind.factory((i) => AuthToDomainMapper()),
        Bind.factory((i) => SignUpFromDomainMapper()),
        Bind.factory(
            (i) => AuthRepositoryImpl(mapperFromDomain: i(), mapperToDomain: i(), datasource: i())),
        Bind.factory((i) => AuthDatasourceImpl(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/signup', child: (_, __) => const SignUpPage()),
      ];
}

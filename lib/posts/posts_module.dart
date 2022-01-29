import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wall_app_frontend/posts/presentation/post_details_page/post_details_page.dart';

import 'data/mappers/post_mapper.dart';
import 'data/respositories/posts_repository_impl.dart';
import 'domain/usecases/get_all_posts_usecase.dart';
import 'infra/datasources/posts_datasource_impl.dart';
import 'presentation/home_page/home_page.dart';
import 'presentation/home_page/home_page_controller.dart';
import 'presentation/home_page/stores/home_page_store.dart';

class PostsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<HomePageStore>((i) => HomePageStore()),
        Bind.factory<HomePageController>((i) => HomePageController(usecase: i(), store: i())),
        Bind.factory<GetAllPostsUseCase>((i) => GetAllPostsUseCaseImpl(i())),
        Bind.factory((i) => PostsRepositoryImpl(datasource: i(), mapper: i())),
        Bind.factory((i) => PostMapper()),
        Bind.factory((i) => PostsDatasourceImpl(i())),
        Bind.factory((i) => Dio())
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) => const HomePage()),
        ChildRoute('/post/:id', child: (_, args) => PostDetailsPage(postId: args.params['id'])),
      ];
}

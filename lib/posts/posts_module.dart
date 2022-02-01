import 'package:flutter_modular/flutter_modular.dart';

import '../commons/route_guard/auth_guard.dart';
import '../commons/route_guard/not_auth_guard.dart';
import 'data/mappers/post_mapper.dart';
import 'data/mappers/post_request_mapper.dart';
import 'data/respositories/posts_repository_impl.dart';
import 'domain/usecases/create_post_usecase.dart';
import 'domain/usecases/get_all_posts_usecase.dart';
import 'domain/usecases/get_post_by_id.dart';
import 'domain/usecases/get_posts_by_user_usecase.dart';
import 'infra/datasources/posts_datasource_impl.dart';
import 'presentation/create_post_page.dart/create_post_page.dart';
import 'presentation/create_post_page.dart/create_post_page_controller.dart';
import 'presentation/create_post_page.dart/stores/create_post_page_store.dart';
import 'presentation/home_page/home_page.dart';
import 'presentation/home_page/home_page_controller.dart';
import 'presentation/home_page/stores/home_page_store.dart';
import 'presentation/logged_home_page/logged_home_page.dart';
import 'presentation/logged_home_page/logged_home_page_controller.dart';
import 'presentation/logged_home_page/stores/logged_home_page_store.dart';
import 'presentation/post_details_page/post_details_page.dart';
import 'presentation/post_details_page/post_details_page_controller.dart';
import 'presentation/post_details_page/stores/post_details_page_store.dart';

class PostsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => CreatePostPageStore()),
        Bind.factory((i) => CreatePostPageController(i(), i())),
        Bind.factory((i) => CreatePostUseCaseImpl(i())),
        Bind.factory((i) => GetPostsByUserUseCaseImpl(i())),
        Bind.factory((i) => LoggedHomePageStore()),
        Bind.factory((i) => LoggedHomePageController(
            getAllPostsUsecase: i(), store: i(), authStore: i(), getPostsByUserUsecase: i())),
        Bind.factory<PostDetailsPageStore>((i) => PostDetailsPageStore()),
        Bind.factory<PostDetailsPageController>(
            (i) => PostDetailsPageController(store: i(), usecase: i())),
        Bind.factory<GetPostById>((i) => GetPostByIdImpl(i())),
        Bind.factory<HomePageStore>((i) => HomePageStore()),
        Bind.factory<HomePageController>((i) => HomePageController(usecase: i(), store: i())),
        Bind.factory<GetAllPostsUseCase>((i) => GetAllPostsUseCaseImpl(i())),
        Bind.factory(
            (i) => PostsRepositoryImpl(datasource: i(), mapper: i(), mapperFromDomain: i())),
        Bind.factory((i) => PostMapper()),
        Bind.factory((i) => PostRequestMapper()),
        Bind.factory((i) => PostsDatasourceImpl(i(), i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (_, __) => const HomePage(), guards: [NoAuthGuard()]),
        ChildRoute('/myHome', child: (_, __) => const LoggedHomePage(), guards: [AuthGuard()]),
        ChildRoute('/newPost', child: (_, __) => const CreatePostPage(), guards: [AuthGuard()]),
        ChildRoute('/post/:owner/:id/',
            child: (_, args) =>
                PostDetailsPage(postId: args.params['id'], owner: args.params['owner'])),
        RedirectRoute('/redirect', to: '/home'),
      ];
}

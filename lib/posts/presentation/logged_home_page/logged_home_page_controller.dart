import 'package:flutter_modular/flutter_modular.dart';

import '../../../auth/presentation/stores/auth_store.dart';
import '../../domain/failures/posts_failures.dart';
import '../../domain/usecases/get_all_posts_usecase.dart';
import '../../domain/usecases/get_posts_by_user_usecase.dart';
import 'stores/logged_home_page_store.dart';

class LoggedHomePageController {
  final GetAllPostsUseCase getAllPostsUsecase;
  final GetPostsByUserUseCase getPostsByUserUsecase;
  final LoggedHomePageStore store;
  final AuthStore authStore;

  LoggedHomePageController({
    required this.getAllPostsUsecase,
    required this.store,
    required this.authStore,
    required this.getPostsByUserUsecase,
  });

  Future<void> getAll() async {
    store.setLoading = true;
    final _result = await getAllPostsUsecase.loadAll();
    _result.fold((l) => {store.setError = l.message}, (r) => {store.setAllPosts = r});
    store.setLoading = false;
  }

  Future<void> getPostsByUser() async {
    store.setMyPostsLoading = true;
    final _result = await getPostsByUserUsecase();
    _result.fold((l) {
      store.setMyPostsError = l.message;
      if (l is AccessDenied) {
        Modular.to.navigate('/home/');
      }
    }, (r) => {store.setMyPosts = r});
    store.setMyPostsLoading = false;
  }
}

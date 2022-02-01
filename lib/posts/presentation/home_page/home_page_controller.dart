import '../../domain/usecases/get_all_posts_usecase.dart';
import 'stores/home_page_store.dart';

class HomePageController {
  final GetAllPostsUseCase usecase;
  final HomePageStore store;

  HomePageController({
    required this.usecase,
    required this.store,
  });

  Future<void> getAll() async {
    store.setLoading = true;
    final _result = await usecase.loadAll();
    _result.fold((l) => {store.error = l.message}, (r) => {store.setPosts = r});
    store.setLoading = false;
  }
}

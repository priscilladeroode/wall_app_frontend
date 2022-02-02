import 'package:mobx/mobx.dart';
import '../../../domain/entities/post_response_entity.dart';

part 'home_page_store.g.dart';

class HomePageStore = HomePageStoreBase with _$HomePageStore;

abstract class HomePageStoreBase with Store {
  @observable
  ObservableList<PostResponseEntity> posts = ObservableList.of([]);

  @observable
  bool loading = false;

  @observable
  String error = '';

  set setError(String message) => error = message;

  set setPosts(List<PostResponseEntity> newPosts) {
    posts.clear();
    posts.addAll(newPosts);
  }

  set setLoading(bool value) => loading = value;
}

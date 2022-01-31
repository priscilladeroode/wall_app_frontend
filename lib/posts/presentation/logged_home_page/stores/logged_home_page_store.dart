import 'package:mobx/mobx.dart';
import '../../../domain/entities/post_response_entity.dart';

part 'logged_home_page_store.g.dart';

class LoggedHomePageStore = LoggedHomePageStoreBase with _$LoggedHomePageStore;

abstract class LoggedHomePageStoreBase with Store {
  @observable
  ObservableList<PostResponseEntity> allPosts = ObservableList.of([]);

  @observable
  bool loading = false;

  @observable
  String error = '';

  set setError(String message) => error = message;

  set setAllPosts(List<PostResponseEntity> newPosts) => allPosts.addAll(newPosts);

  set setLoading(bool value) => loading = value;
}

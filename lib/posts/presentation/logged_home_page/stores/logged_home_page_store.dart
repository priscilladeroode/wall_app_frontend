import 'package:mobx/mobx.dart';
import '../../../domain/entities/post_response_entity.dart';

part 'logged_home_page_store.g.dart';

class LoggedHomePageStore = LoggedHomePageStoreBase with _$LoggedHomePageStore;

abstract class LoggedHomePageStoreBase with Store {
  @observable
  ObservableList<PostResponseEntity> allPosts = ObservableList.of([]);

  @observable
  ObservableList<PostResponseEntity> myPosts = ObservableList.of([]);

  @observable
  bool loading = false;

  @observable
  bool myPostsLoading = false;

  @observable
  String error = '';

  @observable
  String myPostsError = '';

  set setError(String message) => error = message;

  set setMyPostsError(String message) => myPostsError = message;

  set setAllPosts(List<PostResponseEntity> newPosts) {
    allPosts.clear();
    allPosts.addAll(newPosts);
  }

  set setMyPosts(List<PostResponseEntity> newPosts) {
    myPosts.clear();
    myPosts.addAll(newPosts);
  }

  set setLoading(bool value) => loading = value;

  set setMyPostsLoading(bool value) => myPostsLoading = value;
}

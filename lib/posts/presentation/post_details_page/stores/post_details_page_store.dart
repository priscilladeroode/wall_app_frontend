import 'package:mobx/mobx.dart';
import '../../../domain/entities/post_response_entity.dart';

part 'post_details_page_store.g.dart';

class PostDetailsPageStore = PostDetailsPageStoreBase with _$PostDetailsPageStore;

abstract class PostDetailsPageStoreBase with Store {
  @observable
  PostResponseEntity? post;

  @observable
  bool loading = false;

  @observable
  String error = '';

  set setPost(PostResponseEntity entity) => post = entity;

  set setLoading(bool value) => loading = value;

  set setError(String message) => error = message;
}

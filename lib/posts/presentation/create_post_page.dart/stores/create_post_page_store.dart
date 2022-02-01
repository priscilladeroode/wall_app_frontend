import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'create_post_page_store.g.dart';

class CreatePostPageStore = CreatePostPageStoreBase with _$CreatePostPageStore;

abstract class CreatePostPageStoreBase with Store {
  @observable
  TextEditingController title = TextEditingController();

  @observable
  TextEditingController content = TextEditingController();

  @observable
  bool loading = false;

  @observable
  String error = '';

  set setError(String message) => error = message;

  set setLoading(bool value) => loading = value;
}

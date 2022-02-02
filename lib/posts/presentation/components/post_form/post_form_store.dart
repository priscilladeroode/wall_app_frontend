import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'post_form_store.g.dart';

class PostFormStore = PostFormStoreBase with _$PostFormStore;

abstract class PostFormStoreBase with Store {
  @observable
  String id = '';

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

  set setId(String value) => id = value;
}

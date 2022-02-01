import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  @observable
  String? name;

  @observable
  String? email;

  @observable
  String? accessToken;

  @computed
  String get firstName => name != null ? name!.split(" ").first : " ";

  set setName(String? value) => name = value;

  set setEmail(String? value) => email = value;

  set setAccessToken(String? value) => accessToken = value;
}

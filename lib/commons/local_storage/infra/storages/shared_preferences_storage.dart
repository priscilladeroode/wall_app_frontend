import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/user_model.dart';
import '../../data/storages/local_storage.dart';

class SharedPreferencesStorage implements LocalStorage {
  SharedPreferences? storage;
  SharedPreferencesStorage() {
    init();
  }

  void init() async {
    storage ??= await Modular.getAsync<SharedPreferences>();
  }

  @override
  Future<bool> saveUserInfo(UserModel userModel) async {
    final name = await storage?.setString('name', userModel.name);
    final email = await storage?.setString('email', userModel.email);
    final accessToken = await storage?.setString('accessToken', userModel.accessToken);

    if (name == true && email == true && accessToken == true) {
      return true;
    } else {
      return false;
    }
  }
}

import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/user_model.dart';
import '../../data/storages/local_storage.dart';

class SharedPreferencesStorage implements LocalStorage {
  final SharedPreferences _storage;

  SharedPreferencesStorage(this._storage);

  @override
  Future<bool> saveUserInfo(UserModel userModel) async {
    final name = await _storage.setString('name', userModel.name);
    final email = await _storage.setString('email', userModel.email);
    final accessToken = await _storage.setString('accessToken', userModel.accessToken);

    if (name && email && accessToken) {
      return true;
    } else {
      return false;
    }
  }
}

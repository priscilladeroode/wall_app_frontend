import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/user_model.dart';
import '../../data/storages/local_storage.dart';

class SharedPreferencesStorage implements LocalStorage {
  @override
  Future<bool> saveUserInfo(UserModel userModel) async {
    final storage = await SharedPreferences.getInstance();
    final name = await storage.setString('name', userModel.name);
    final email = await storage.setString('email', userModel.email);
    final accessToken = await storage.setString('accessToken', userModel.accessToken);

    if (name == true && email == true && accessToken == true) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<UserModel?> getUserInfo() async {
    final storage = await SharedPreferences.getInstance();
    final name = storage.getString('name');
    final email = storage.getString('email');
    final accessToken = storage.getString('accessToken');
    if (name != null && email != null && accessToken != null) {
      return UserModel(name: name, email: email, accessToken: accessToken);
    } else {
      return null;
    }
  }
}

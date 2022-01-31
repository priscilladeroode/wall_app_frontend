import '../models/user_model.dart';

abstract class LocalStorage {
  Future<bool> saveUserInfo(UserModel userModel);
}

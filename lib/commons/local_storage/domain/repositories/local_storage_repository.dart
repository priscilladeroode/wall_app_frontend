import '../entities/user_entity.dart';

abstract class LocalStorageRepository {
  Future<bool> saveUserInfo(UserEntity userInfo);
  Future<UserEntity?> getUserInfo();
  Future<void> clearLocalStorage();
}

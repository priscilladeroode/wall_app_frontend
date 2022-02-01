import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/local_storage_repository.dart';
import '../mapper/user_from_domain_mapper.dart';
import '../mapper/user_to_domain_mapper.dart';
import '../storages/local_storage.dart';

class LocalStorageRepositoryImpl implements LocalStorageRepository {
  final LocalStorage storage;
  final UserFromDomainMapper mapperFromDomain;
  final UserToDomainMapper mapperToDomain;

  LocalStorageRepositoryImpl(this.storage, this.mapperFromDomain, this.mapperToDomain);

  @override
  Future<bool> saveUserInfo(UserEntity userInfo) async {
    final _model = mapperFromDomain.handle(userInfo);
    return await storage.saveUserInfo(_model);
  }

  @override
  Future<UserEntity?> getUserInfo() async {
    final _result = await storage.getUserInfo();
    if (_result != null) {
      return mapperToDomain.fromModel(_result);
    }
    return null;
  }

  @override
  Future<void> clearLocalStorage() async {
    await storage.clearLocalStorage();
  }
}

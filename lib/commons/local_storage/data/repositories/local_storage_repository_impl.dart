import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/local_storage_repository.dart';
import '../mapper/user_from_domain_mapper.dart';
import '../storages/local_storage.dart';

class LocalStorageRepositoryImpl implements LocalStorageRepository {
  final LocalStorage storage;
  final UserFromDomainMapper mapperFromDomain;

  LocalStorageRepositoryImpl(this.storage, this.mapperFromDomain);

  @override
  Future<bool> saveUserInfo(UserEntity userInfo) async {
    final _model = mapperFromDomain.handle(userInfo);
    return await storage.saveUserInfo(_model);
  }
}

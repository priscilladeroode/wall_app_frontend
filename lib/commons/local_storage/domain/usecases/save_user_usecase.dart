import '../entities/user_entity.dart';
import '../repositories/local_storage_repository.dart';

abstract class SaveUserUseCase {
  Future<bool> call(UserEntity userInfo);
}

class SaveUserUseCaseImpl implements SaveUserUseCase {
  final LocalStorageRepository repository;

  SaveUserUseCaseImpl(this.repository);

  @override
  Future<bool> call(UserEntity userInfo) async {
    return await repository.saveUserInfo(userInfo);
  }
}

import '../entities/user_entity.dart';
import '../repositories/local_storage_repository.dart';

abstract class GetUserUseCase {
  Future<UserEntity?> call();
}

class GetUserUseCaseImpl implements GetUserUseCase {
  final LocalStorageRepository repository;

  GetUserUseCaseImpl(this.repository);

  @override
  Future<UserEntity?> call() async {
    return await repository.getUserInfo();
  }
}

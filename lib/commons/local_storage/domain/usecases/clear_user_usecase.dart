import '../repositories/local_storage_repository.dart';

abstract class ClearUserUseCase {
  Future<void> call();
}

class ClearUserUseCaseImpl implements ClearUserUseCase {
  final LocalStorageRepository repository;

  ClearUserUseCaseImpl(this.repository);

  @override
  Future<void> call() async {
    return await repository.clearLocalStorage();
  }
}

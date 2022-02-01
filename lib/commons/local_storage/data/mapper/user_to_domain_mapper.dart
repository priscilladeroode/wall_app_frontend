import '../../../mapper.dart';
import '../../domain/entities/user_entity.dart';
import '../models/user_model.dart';

class UserToDomainMapper extends Mapper<UserEntity, UserModel> {
  @override
  UserEntity handle(UserModel f) {
    return UserEntity(
      email: f.email,
      name: f.name,
      accessToken: f.accessToken,
    );
  }
}

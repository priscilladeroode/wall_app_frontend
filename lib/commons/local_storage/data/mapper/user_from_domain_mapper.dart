import '../../../mapper.dart';
import '../../domain/entities/user_entity.dart';
import '../models/user_model.dart';

class UserFromDomainMapper extends Mapper<UserModel, UserEntity> {
  @override
  UserModel handle(UserEntity f) {
    return UserModel(
      email: f.email,
      name: f.name,
      accessToken: f.accessToken,
    );
  }
}

import '../../../commons/mapper.dart';
import '../../domain/entities/auth_response_entity.dart';
import '../models/auth_response_model.dart';

class AuthToDomainMapper extends Mapper<AuthResponseEntity, AuthResponseModel> {
  @override
  AuthResponseEntity handle(AuthResponseModel f) {
    return AuthResponseEntity(
      name: f.name,
      email: f.email,
      accessToken: f.accessToken,
    );
  }
}

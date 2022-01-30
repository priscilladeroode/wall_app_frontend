import '../../../commons/mapper.dart';
import '../../domain/entities/signup_response_entity.dart';
import '../models/auth_response_model.dart';

class SignUpToDomainMapper extends Mapper<SignUpResponseEntity, AuthResponseModel> {
  @override
  SignUpResponseEntity handle(AuthResponseModel f) {
    return SignUpResponseEntity(
      name: f.name,
      email: f.email,
      accessToken: f.accessToken,
    );
  }
}

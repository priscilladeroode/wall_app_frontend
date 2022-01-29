import '../../../commons/mapper.dart';
import '../../domain/entities/signup_response_entity.dart';
import '../models/signup_response_model.dart';

class SignUpToDomainMapper extends Mapper<SignUpResponseEntity, SignUpResponseModel> {
  @override
  SignUpResponseEntity handle(SignUpResponseModel f) {
    return SignUpResponseEntity(
      name: f.name,
      email: f.email,
      accessToken: f.accessToken,
    );
  }
}

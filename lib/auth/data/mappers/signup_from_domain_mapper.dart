import '../../../commons/mapper.dart';
import '../../domain/entities/signup_request_entity.dart';
import '../models/signup_request_model.dart';

class SignUpFromDomainMapper extends Mapper<SignUpRequestModel, SignUpRequestEntity> {
  @override
  SignUpRequestModel handle(SignUpRequestEntity f) {
    return SignUpRequestModel(
        name: f.name,
        email: f.email,
        password: f.password,
        passwordConfirmation: f.passwordConfirmation);
  }
}

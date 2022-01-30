import '../../../commons/mapper.dart';
import '../../domain/entities/signin_request_entity.dart';
import '../models/signin_request_model.dart';

class SignInFromDomainMapper extends Mapper<SignInRequestModel, SignInRequestEntity> {
  @override
  SignInRequestModel handle(SignInRequestEntity f) {
    return SignInRequestModel(
      email: f.email,
      password: f.password,
    );
  }
}

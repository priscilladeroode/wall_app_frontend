import '../models/auth_response_model.dart';
import '../models/signup_request_model.dart';

abstract class AuthDatasource {
  Future<AuthResponseModel> signUp(SignUpRequestModel signUpCredentials);
}

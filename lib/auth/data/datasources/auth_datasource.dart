import '../models/signup_request_model.dart';
import '../models/signup_response_model.dart';

abstract class AuthDatasource {
  Future<SignUpResponseModel> signUp(SignUpRequestModel signUpCredentials);
}

import 'package:dio/dio.dart';

import '../../data/datasources/auth_datasource.dart';
import '../../data/models/signup_request_model.dart';
import '../../data/models/signup_response_model.dart';
import '../../domain/failures/auth_failures.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final Dio dio;

  AuthDatasourceImpl(this.dio);

  final endpoint = 'http://localhost:5050/api';
  @override
  Future<SignUpResponseModel> signUp(SignUpRequestModel signUpCredentials) async {
    final _result =
        await dio.post('$endpoint/signup', data: signUpCredentials.toJson(signUpCredentials));
    if (_result.statusCode == 200 || _result.statusCode == 201) {
      return SignUpResponseModel.fromJson(_result.data);
    }
    throw AuthDatasourceError();
  }
}

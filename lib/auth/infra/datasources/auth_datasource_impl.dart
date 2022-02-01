import 'package:dio/dio.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

import '../../data/datasources/auth_datasource.dart';
import '../../data/models/auth_response_model.dart';
import '../../data/models/signin_request_model.dart';
import '../../data/models/signup_request_model.dart';
import '../../domain/failures/auth_failures.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final Dio dio;

  AuthDatasourceImpl(this.dio);

  final endpoint = FlavorConfig.instance.variables["baseUrl"];
  @override
  Future<AuthResponseModel> signUp(SignUpRequestModel signUpCredentials) async {
    final _result =
        await dio.post('$endpoint/signup', data: signUpCredentials.toJson(signUpCredentials));
    if (_result.statusCode == 200 || _result.statusCode == 201) {
      return AuthResponseModel.fromJson(_result.data);
    }
    throw AuthDatasourceError();
  }

  @override
  Future<AuthResponseModel> signIn(SignInRequestModel signInCredentials) async {
    final _result =
        await dio.post('$endpoint/signin', data: signInCredentials.toJson(signInCredentials));
    if (_result.statusCode == 200 || _result.statusCode == 201) {
      return AuthResponseModel.fromJson(_result.data);
    }
    throw AuthDatasourceError();
  }
}

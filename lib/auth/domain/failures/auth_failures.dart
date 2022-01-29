abstract class AuthFailures implements Exception {
  String? get message;
}

class AuthDatasourceError extends AuthFailures {
  @override
  final String? message;

  AuthDatasourceError({this.message});
}

class AuthRepositoryFailure extends AuthFailures {
  @override
  final String? message;

  AuthRepositoryFailure({this.message});
}

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

class InvalidName extends AuthFailures {
  @override
  String? get message => "Your full name must be provided.";
}

class InvalidPassword extends AuthFailures {
  @override
  String? get message => "Invalid password.";
}

class InvalidPasswordConfirmation extends AuthFailures {
  @override
  String? get message => "Invalid password confirmation";
}

class InvalidEmail extends AuthFailures {
  @override
  String? get message => "Invalid email";
}

class MissingName extends AuthFailures {
  @override
  String? get message => "Name can't be empty";
}

class MissingEmail extends AuthFailures {
  @override
  String? get message => "E-mail can't be empty";
}

class MissingPassword extends AuthFailures {
  @override
  String? get message => "Password can't be empty";
}

class MissingPasswordConfirmation extends AuthFailures {
  @override
  String? get message => "Password confirmation can't be empty";
}

class PasswordDontMatch extends AuthFailures {
  @override
  String? get message => "Password and confirmation must match";
}

class InvalidPasswordLength extends AuthFailures {
  @override
  String? get message => "Password must have between 6 and 10 characters";
}

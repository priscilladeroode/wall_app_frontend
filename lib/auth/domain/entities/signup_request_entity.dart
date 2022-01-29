class SignUpRequestEntity {
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;

  SignUpRequestEntity({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });
}

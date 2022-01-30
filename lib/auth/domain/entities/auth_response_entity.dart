class AuthResponseEntity {
  final String name;
  final String email;
  final String accessToken;

  AuthResponseEntity({
    required this.name,
    required this.email,
    required this.accessToken,
  });
}

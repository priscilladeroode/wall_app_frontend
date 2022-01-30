class AuthResponseModel {
  final String name;
  final String email;
  final String accessToken;

  AuthResponseModel({
    required this.name,
    required this.email,
    required this.accessToken,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) => AuthResponseModel(
        name: json['name'] ?? "",
        email: json['email'] ?? "",
        accessToken: json['accessToken'] ?? "",
      );
}

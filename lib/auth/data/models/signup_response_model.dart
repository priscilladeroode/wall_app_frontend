class SignUpResponseModel {
  final String name;
  final String email;
  final String accessToken;

  SignUpResponseModel({
    required this.name,
    required this.email,
    required this.accessToken,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) => SignUpResponseModel(
        name: json['name'] ?? "",
        email: json['email'] ?? "",
        accessToken: json['accessToken'] ?? "",
      );
}

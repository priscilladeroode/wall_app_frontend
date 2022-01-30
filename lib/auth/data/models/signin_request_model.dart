class SignInRequestModel {
  final String email;
  final String password;

  SignInRequestModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson(SignInRequestModel instance) => <String, dynamic>{
        'email': instance.email,
        'password': instance.password,
      };
}

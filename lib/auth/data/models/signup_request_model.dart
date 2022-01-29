class SignUpRequestModel {
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;

  SignUpRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toJson(SignUpRequestModel instance) => <String, dynamic>{
        'name': instance.name,
        'email': instance.email,
        'password': instance.password,
        'passwordConfirmation': instance.passwordConfirmation,
      };
}

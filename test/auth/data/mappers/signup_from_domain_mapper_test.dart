import 'package:flutter_test/flutter_test.dart';
import 'package:wall_app_frontend/auth/data/mappers/signup_from_domain_mapper.dart';
import 'package:wall_app_frontend/auth/data/models/signup_request_model.dart';

import '../mocks/auth_data_mocks.dart';

void main() {
  final mapper = SignUpFromDomainMapper();
  test('''
    Given a valid SignUpRequestEntity,
    When PostMapper is called,
    Then should return a SignUpRequestModel.
  ''', () async {
    final result = mapper.handle(signUpRequestEntity);
    expect(result, isA<SignUpRequestModel>());
  });
}

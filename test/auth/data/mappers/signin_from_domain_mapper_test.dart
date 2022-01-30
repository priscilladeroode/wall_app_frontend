import 'package:flutter_test/flutter_test.dart';
import 'package:wall_app_frontend/auth/data/mappers/signin_from_domain_mapper.dart';
import 'package:wall_app_frontend/auth/data/models/signin_request_model.dart';

import '../mocks/auth_data_mocks.dart';

void main() {
  final mapper = SignInFromDomainMapper();
  test('''
    Given a valid SignInRequestEntity,
    When SignInFromDomainMapper is called,
    Then should return a SignInRequestModel.
  ''', () async {
    final result = mapper.handle(signInRequestEntity);
    expect(result, isA<SignInRequestModel>());
  });
}

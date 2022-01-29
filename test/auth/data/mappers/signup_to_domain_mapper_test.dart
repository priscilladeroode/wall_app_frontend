import 'package:flutter_test/flutter_test.dart';
import 'package:wall_app_frontend/auth/data/mappers/signup_to_domain_mapper.dart';
import 'package:wall_app_frontend/auth/domain/entities/signup_response_entity.dart';

import '../mocks/auth_data_mocks.dart';

void main() {
  final mapper = SignUpToDomainMapper();
  test('''
    Given a valid SignUpResponseModel,
    When PostMapper is called,
    Then should return a SignUpResponseEntity.
  ''', () async {
    final result = mapper.fromModel(signUpResponseModel);
    expect(result, isA<SignUpResponseEntity>());
  });
}

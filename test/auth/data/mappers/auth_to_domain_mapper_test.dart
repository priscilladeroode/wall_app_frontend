import 'package:flutter_test/flutter_test.dart';
import 'package:wall_app_frontend/auth/data/mappers/auth_to_domain_mapper.dart';
import 'package:wall_app_frontend/auth/domain/entities/auth_response_entity.dart';

import '../mocks/auth_data_mocks.dart';

void main() {
  final mapper = AuthToDomainMapper();
  test('''
    Given a valid SignUpResponseModel,
    When PostMapper is called,
    Then should return a SignUpResponseEntity.
  ''', () async {
    final result = mapper.fromModel(authResponseModel);
    expect(result, isA<AuthResponseEntity>());
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:wall_app_frontend/commons/local_storage/data/mapper/user_from_domain_mapper.dart';
import 'package:wall_app_frontend/commons/local_storage/data/models/user_model.dart';
import 'package:wall_app_frontend/commons/local_storage/domain/entities/user_entity.dart';

void main() {
  final mapper = UserFromDomainMapper();
  test('''
    Given a valid UserEntity,
    When UserFromDomainMapper is called,
    Then should return a UserModel.
  ''', () async {
    final userEntity = UserEntity(name: '', email: '', accessToken: '');
    final result = mapper.fromModel(userEntity);
    expect(result, isA<UserModel>());
  });
}

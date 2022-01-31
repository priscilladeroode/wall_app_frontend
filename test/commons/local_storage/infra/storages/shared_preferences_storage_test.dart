import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wall_app_frontend/commons/local_storage/data/models/user_model.dart';
import 'package:wall_app_frontend/commons/local_storage/data/storages/local_storage.dart';
import 'package:wall_app_frontend/commons/local_storage/infra/storages/shared_preferences_storage.dart';

class SharedPreferencesMock extends Mock implements SharedPreferences {}

void main() {
  late SharedPreferences _storage;
  late LocalStorage _localStorage;

  setUpAll(() {
    _storage = SharedPreferencesMock();
    _localStorage = SharedPreferencesStorage(_storage);
  });
  test('''
    Given a valid UserModel,
    When storage save the user,
    Then should return true.
  ''', () async {
    when(() => _storage.setString(any(), any())).thenAnswer((_) async => true);
    final userModel = UserModel(
      name: "",
      email: "",
      accessToken: "",
    );

    final _result = await _localStorage.saveUserInfo(userModel);

    expect(_result, true);
    verify(() => _storage.setString(any(), any())).called(3);
  });

  test('''
    Given a valid UserModel,
    When storage dont save the user,
    Then should return false.
  ''', () async {
    when(() => _storage.setString(any(), any())).thenAnswer((_) async => false);
    final userModel = UserModel(
      name: "",
      email: "",
      accessToken: "",
    );

    final _result = await _localStorage.saveUserInfo(userModel);

    expect(_result, false);
    verify(() => _storage.setString(any(), any())).called(3);
  });
}

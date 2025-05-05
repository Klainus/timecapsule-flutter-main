import 'dart:async';

import 'package:authentication_api/authentication_api.dart' as api;
import 'package:authentication_repository/authentication_repository.dart';

class AuthenticationRepository {
  AuthenticationRepository(this._api);

  final AuthenticationApi _api;

  Stream<AuthenticationStatus> get status {
    return _api.status
        .where((status) => status != api.AuthenticationStatus.initial)
        .map(AuthenticationStatus.from);
  }

  AuthenticationStatus get currentStatus {
    return AuthenticationStatus.from(_api.currentStatus);
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      await _api.login(
        email: email,
        password: password,
      );
    } on LoginInvalidCredentialsExeption catch (error, stackTrace) {
      Error.throwWithStackTrace(
        InvalidCredentials(error),
        stackTrace,
      );
    } on EmailUnverifiedException catch (error, stackTrace) {
      Error.throwWithStackTrace(
        EmailUnverified(error),
        stackTrace,
      );
    }
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    try {
      await _api.register(
        email: email,
        password: password,
      );
    } on RegisterValidationException catch (error, stackTrace) {
      Error.throwWithStackTrace(
        RegistrationFailure(error),
        stackTrace,
      );
    }
  }

  Future<void> logOut() async {
    await _api.unauthenticate();
  }

  Future<void> resetPassword({
    required String email,
  }) async {
    await _api.resetPassword(
      email: email,
    );
  }

  Future<void> deleteAccount(String password) async {
    await _api.deleteUser(password);
  }
}

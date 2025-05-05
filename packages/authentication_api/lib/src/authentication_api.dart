import 'dart:async';

import 'package:app_api/app_api.dart';
import 'package:app_client/app_client.dart';

class LoginInvalidCredentialsExeption implements Exception {}

class RegisterValidationException implements Exception {}

class EmailUnverifiedException implements Exception {}

class AuthenticationApi {
  AuthenticationApi({
    required AppClient appClient,
    required UsersApi usersApi,
  })  : _client = appClient,
        _usersApi = usersApi;

  final AppClient _client;
  final UsersApi _usersApi;

  Stream<AuthenticationStatus> get status => _client.authenticationStatus;
  AuthenticationStatus get currentStatus => _client.currentStatus;

  void authenticate() {
    _client.authenticate();
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    Response<dynamic> response;

    try {
      response = await _usersApi.usersLoginCreate(
        login: Login(
          email: email,
          password: password,
        ),
      );
    } on DioException catch (error, stackTrace) {
      switch (error.response) {
        case Response(
            statusCode: 401,
            data: {
              'detail': 'No active account found with the given credentials',
            },
          ):
          throw LoginInvalidCredentialsExeption();
        case Response(
            statusCode: 403,
            data: {
              'detail': 'Email is not verified',
            },
          ):
          throw EmailUnverifiedException();
        default:
          Error.throwWithStackTrace(
            HttpException(error),
            stackTrace,
          );
      }
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        HttpException(error),
        stackTrace,
      );
    }

    final statusCode = response.statusCode;
    if (statusCode != 200) throw HttpRequestFailure(statusCode, response.data);

    _client.authenticate();
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    Response<Registration> response;

    try {
      response = await _usersApi.usersRegisterCreate(
        registration: Registration(
          email: email,
          password: password,
        ),
      );
    } on DioException catch (error, stackTrace) {
      switch (error.response) {
        case Response(statusCode: 400):
          throw RegisterValidationException();
        default:
          Error.throwWithStackTrace(
            HttpException(error),
            stackTrace,
          );
      }
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        HttpException(error),
        stackTrace,
      );
    }

    final statusCode = response.statusCode;
    if (statusCode != 201) throw HttpRequestFailure(statusCode, response.data);
  }

  Future<void> resetPassword({
    required String email,
  }) async {
    Response<ResetPassword> response;

    try {
      response = await _usersApi.usersResetPasswordCreate(
        resetPassword: ResetPassword(email: email),
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        HttpException(error),
        stackTrace,
      );
    }

    final statusCode = response.statusCode;
    if (statusCode != 204) throw HttpRequestFailure(statusCode, response.data);
  }

  Future<void> deleteUser(String password) async {
    Response<dynamic> response;

    try {
      response = await _usersApi.usersMeDestroy();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        HttpException(error),
        stackTrace,
      );
    }

    final statusCode = response.statusCode;
    if (statusCode != 204) throw HttpRequestFailure(statusCode, response.data);

    _client.unauthenticate();
  }

  Future<void> unauthenticate() async {
    await _usersApi.usersLogoutCreate();
    _client.unauthenticate();
  }
}

// ignore_for_file: prefer_const_constructors
// ignore_for_file: inference_failure_on_collection_literal
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:authentication_api/authentication_api.dart' as auth_api;
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationApi extends Mock implements AuthenticationApi {}

void main() {
  late AuthenticationApi api;

  const email = 'email';
  const password = 'password';

  setUp(() {
    api = MockAuthenticationApi();
  });

  AuthenticationRepository createSubject() {
    return AuthenticationRepository(api);
  }

  group('status', () {
    test(
        'emits $AuthenticationStatus.from api.currentStatus '
        'when api emits status that is not '
        '${auth_api.AuthenticationStatus.initial}', () async {
      const status = auth_api.AuthenticationStatus.authenticated;
      when(() => api.status).thenAnswer(
        (_) => Stream.value(status),
      );
      final repository = createSubject();
      await expectLater(
        repository.status,
        emits(
          AuthenticationStatus.from(status),
        ),
      );
    });

    test(
        'never emits anything when client emits '
        '${auth_api.AuthenticationStatus.initial}', () async {
      when(() => api.status).thenAnswer(
        (_) => Stream.value(
          auth_api.AuthenticationStatus.initial,
        ),
      );
      final repository = createSubject();
      await expectLater(
        repository.status,
        neverEmits(anything),
      );
    });
  });

  group('currentStatus', () {
    test('returns $AuthenticationStatus.from client.currentStatus', () {
      const status = auth_api.AuthenticationStatus.initial;
      when(() => api.currentStatus).thenReturn(status);
      final repository = createSubject();
      expect(
        repository.currentStatus,
        AuthenticationStatus.from(status),
      );
    });
  });

  group('login', () {
    final login = () => api.login(
          email: email,
          password: password,
        );

    test('calls api.login', () async {
      when(login).thenAnswer((_) async {});
      final repository = createSubject();
      await repository.login(
        email: email,
        password: password,
      );
      verify(login).called(1);
    });

    test('throws $InvalidCredentials on $LoginInvalidCredentialsExeption',
        () async {
      when(login).thenThrow(LoginInvalidCredentialsExeption());
      final repository = createSubject();
      await expectLater(
        repository.login(
          email: email,
          password: password,
        ),
        throwsA(
          isA<InvalidCredentials>(),
        ),
      );
      verify(login).called(1);
    });

    test('throws $EmailUnverified on $EmailUnverifiedException', () async {
      when(login).thenThrow(EmailUnverifiedException());
      final repository = createSubject();
      await expectLater(
        repository.login(
          email: email,
          password: password,
        ),
        throwsA(
          isA<EmailUnverified>(),
        ),
      );
      verify(login).called(1);
    });
  });

  group('register', () {
    final register = () => api.register(
          email: email,
          password: password,
        );

    test('calls api.register', () async {
      when(register).thenAnswer((_) async {});
      final repository = createSubject();
      await repository.register(
        email: email,
        password: password,
      );
      verify(register).called(1);
    });

    test('throws $RegistrationFailure on $RegisterValidationException',
        () async {
      when(register).thenThrow(RegisterValidationException());
      final repository = createSubject();
      await expectLater(
        repository.register(
          email: email,
          password: password,
        ),
        throwsA(
          isA<RegistrationFailure>(),
        ),
      );
      verify(register).called(1);
    });
  });

  group('logOut', () {
    final unauthenticate = () => api.unauthenticate();

    test('calls api.unauthenticate', () async {
      when(unauthenticate).thenAnswer((_) async {});
      final repository = createSubject();
      await repository.logOut();
      verify(unauthenticate).called(1);
    });
  });

  group('resetPassword', () {
    final resetPassword = () => api.resetPassword(email: email);

    test('calls resetPassword AuthenticationApi', () async {
      when(resetPassword).thenAnswer((_) async {});
      final repository = createSubject();
      await repository.resetPassword(email: email);
      verify(resetPassword).called(1);
    });
  });

  group('deleteAccount', () {
    final deleteUser = () => api.deleteUser(password);

    test('calls api.deleteUser', () async {
      when(deleteUser).thenAnswer((_) async {});
      final repository = createSubject();
      await repository.deleteAccount(password);
      verify(deleteUser).called(1);
    });
  });
}

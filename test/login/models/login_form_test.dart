// ignore_for_file: prefer_const_constructors

import 'package:app_l10n/app_l10n.dart';
import 'package:as_boilerplate_flutter/login/login.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAppLocalizations extends Mock implements AppLocalizations {}

class MockEmail extends Mock implements Email {}

class MockPassword extends Mock implements Password {}

void main() {
  group('LoginForm', () {
    late Email email;
    late Password password;
    late AppLocalizations l10n;

    setUp(() {
      email = MockEmail();
      password = MockPassword();
      l10n = MockAppLocalizations();
    });

    LoginForm createSubject({
      LoginFormStatus status = LoginFormStatus.initial,
      LoginFailure? failure,
    }) {
      return LoginForm(
        status: status,
        email: email,
        password: password,
        failure: failure,
      );
    }

    group('constructor', () {
      test('works correctly', () {
        expect(
          createSubject,
          returnsNormally,
        );
      });
    });

    group('isLoading', () {
      test('returns true if status is [loading]', () {
        final form = createSubject(status: LoginFormStatus.loading);
        expect(form.isLoading, true);
      });

      test('returns true if status is [success]', () {
        final form = createSubject(status: LoginFormStatus.success);
        expect(form.isLoading, true);
      });
    });

    group('isInvalid', () {
      test('returns true if email is invalid', () {
        when(() => email.isInvalid).thenReturn(true);
        expect(createSubject().isInvalid, true);
      });

      test('returns true if password is invalid', () {
        when(() => email.isInvalid).thenReturn(false);
        when(() => password.isInvalid).thenReturn(true);
        expect(createSubject().isInvalid, true);
      });
    });

    group('emailErrorText', () {
      test('returns validationErrorText if status is [invalid]', () {
        const validationErrorText = 'validationErrorText';
        when(() => email.validationErrorText(l10n))
            .thenReturn(validationErrorText);
        final form = createSubject(status: LoginFormStatus.invalid);
        expect(
          form.emailErrorText(l10n),
          validationErrorText,
        );
      });

      test('returns serverErrorText if status is [failure]', () {
        const serverErrorText = 'serverErrorText';
        when(() => l10n.invalidCredentials).thenReturn(serverErrorText);
        final form = createSubject(
          status: LoginFormStatus.failure,
          failure: InvalidCredentials(''),
        );
        expect(
          form.emailErrorText(l10n),
          l10n.invalidCredentials,
        );
      });

      test('returns null if status is not [invalid]', () {
        final form = createSubject();
        expect(
          form.emailErrorText(l10n),
          null,
        );
      });
    });

    group('passwordErrorText', () {
      test('returns validationErrorText if status is [invalid]', () {
        const validationErrorText = 'validationErrorText';
        when(() => password.validationErrorText(l10n))
            .thenReturn(validationErrorText);
        final form = createSubject(status: LoginFormStatus.invalid);
        expect(
          form.passwordErrorText(l10n),
          validationErrorText,
        );
      });

      test('returns serverErrorText if status is [failure]', () {
        const serverErrorText = 'serverErrorText';
        when(() => l10n.invalidCredentials).thenReturn(serverErrorText);
        final form = createSubject(
          status: LoginFormStatus.failure,
          failure: InvalidCredentials(''),
        );
        expect(
          form.passwordErrorText(l10n),
          l10n.invalidCredentials,
        );
      });

      test('returns null if status is not [invalid]', () {
        final form = createSubject();
        expect(
          form.passwordErrorText(l10n),
          null,
        );
      });
    });
  });
}

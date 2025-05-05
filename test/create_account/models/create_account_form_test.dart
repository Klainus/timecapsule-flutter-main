// ignore_for_file: prefer_const_constructors

import 'package:app_l10n/app_l10n.dart';
import 'package:as_boilerplate_flutter/create_account/create_account.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAppLocalizations extends Mock implements AppLocalizations {}

class MockEmail extends Mock implements Email {}

class MockPassword extends Mock implements Password {}

void main() {
  group('CreateAccountForm', () {
    late Email email;
    late Password password;
    late AppLocalizations l10n;

    setUp(() {
      email = MockEmail();
      password = MockPassword();
      l10n = MockAppLocalizations();
    });

    CreateAccountForm createSubject({
      CreateAccountStatus status = CreateAccountStatus.initial,
      RegistrationFailure? failure,
    }) {
      return CreateAccountForm(
        status: status,
        email: email,
        password: password,
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
        final form = createSubject(status: CreateAccountStatus.loading);
        expect(form.isLoading, true);
      });
    });

    group('isInvalid', () {
      test('returns true if email is not valid', () {
        when(() => email.isInvalid).thenReturn(true);
        expect(createSubject().isInvalid, true);
      });
    });

    group('emailErrorText', () {
      test('returns validationErrorText if status is [invalid]', () {
        const validationErrorText = 'validationErrorText';
        when(() => email.validationErrorText(l10n))
            .thenReturn(validationErrorText);
        final form = createSubject(status: CreateAccountStatus.invalid);
        expect(
          form.emailErrorText(l10n),
          validationErrorText,
        );
      });

      test('returns generalServerError if status is [failure]', () {
        const generalServerError = 'generalServerError';
        when(() => l10n.generalServerError).thenReturn(generalServerError);
        final form = createSubject(
          status: CreateAccountStatus.failure,
          failure: RegistrationFailure(''),
        );
        expect(
          form.emailErrorText(l10n),
          l10n.generalServerError,
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
  });
}

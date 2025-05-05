// ignore_for_file: prefer_const_constructors

import 'package:app_l10n/app_l10n.dart';
import 'package:as_boilerplate_flutter/login/login.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAppLocalizations extends Mock implements AppLocalizations {}

class MockEmailValidator extends Mock implements EmailValidator {}

class MockEmailErrorTranslator extends Mock implements EmailErrorTranslator {}

void main() {
  const email = 'email';
  const errorText = 'errorText';

  group('Email', () {
    late AppLocalizations l10n;
    late MockEmailValidator validator;
    late MockEmailErrorTranslator translator;

    setUp(() {
      l10n = MockAppLocalizations();
      validator = MockEmailValidator();
      translator = MockEmailErrorTranslator();
    });

    Email createSubject() {
      return Email(
        validator: validator,
        translator: translator,
        value: email,
      );
    }

    group('empty', () {
      test('returns empty Email', () {
        expect(Email.empty.value, '');
      });
    });

    group('validationErrorText', () {
      test('returns null when error is null', () {
        when(() => validator.maybeError(any())).thenReturn(null);
        expect(
          createSubject().validationErrorText(l10n),
          null,
        );
      });

      test('returns errorText when error is not null', () {
        when(
          () => validator.maybeError(any()),
        ).thenReturn(EmailValidationError.values.first);

        when(
          () => translator.errorText(EmailValidationError.values.first, l10n),
        ).thenReturn(errorText);

        expect(
          createSubject().validationErrorText(l10n),
          errorText,
        );
      });
    });
  });
}

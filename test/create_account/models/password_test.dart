// ignore_for_file: prefer_const_constructors

import 'package:app_l10n/app_l10n.dart';
import 'package:as_boilerplate_flutter/create_account/create_account.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAppLocalizations extends Mock implements AppLocalizations {}

class MockPasswordValidator extends Mock implements PasswordValidator {}

class MockPasswordErrorTranslator extends Mock
    implements PasswordErrorTranslator {}

void main() {
  const password = 'password';
  const errorText = 'errorText';

  group('Password', () {
    late AppLocalizations l10n;
    late MockPasswordValidator validator;
    late MockPasswordErrorTranslator translator;

    setUp(() {
      l10n = MockAppLocalizations();
      validator = MockPasswordValidator();
      translator = MockPasswordErrorTranslator();
    });

    Password createSubject() {
      return Password(
        validator: validator,
        translator: translator,
        value: password,
      );
    }

    group('empty', () {
      test('returns empty Password', () {
        expect(Password.empty.value, '');
      });
    });

    group('validationErrorText', () {
      test('returns null if error is null', () {
        when(() => validator.maybeError(any())).thenReturn(null);
        expect(
          createSubject().validationErrorText(l10n),
          null,
        );
      });

      test('returns errorText if error', () {
        when(
          () => validator.maybeError(any()),
        ).thenReturn(PasswordValidationError.values.first);

        when(
          () =>
              translator.errorText(PasswordValidationError.values.first, l10n),
        ).thenReturn(errorText);

        expect(
          createSubject().validationErrorText(l10n),
          errorText,
        );
      });
    });
  });
}

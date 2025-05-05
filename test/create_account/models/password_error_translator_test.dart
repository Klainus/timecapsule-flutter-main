// ignore_for_file: prefer_const_constructors

import 'package:app_l10n/app_l10n.dart';
import 'package:as_boilerplate_flutter/create_account/create_account.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAppLocalizations extends Mock implements AppLocalizations {}

void main() {
  const passwordEmpty = 'passwordEmpty';

  group('errorText', () {
    late AppLocalizations l10n;

    setUp(() {
      l10n = MockAppLocalizations();
      when(() => l10n.passwordEmpty).thenReturn(passwordEmpty);
    });

    test('returns l10n.passwordEmpty when PasswordValidationError.empty', () {
      expect(
        PasswordErrorTranslator().errorText(
          PasswordValidationError.empty,
          l10n,
        ),
        l10n.passwordEmpty,
      );
    });
  });
}

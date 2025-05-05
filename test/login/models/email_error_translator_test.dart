// ignore_for_file: prefer_const_constructors

import 'package:app_l10n/app_l10n.dart';
import 'package:as_boilerplate_flutter/login/login.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAppLocalizations extends Mock implements AppLocalizations {}

void main() {
  const emailEmpty = 'emailEmpty';

  group('errorText', () {
    late AppLocalizations l10n;

    setUp(() {
      l10n = MockAppLocalizations();
      when(() => l10n.emailEmpty).thenReturn(emailEmpty);
    });

    test('returns l10n.emailEmpty when EmailValidationError.empty', () {
      expect(
        EmailErrorTranslator().errorText(
          EmailValidationError.empty,
          l10n,
        ),
        l10n.emailEmpty,
      );
    });
  });
}

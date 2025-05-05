// ignore_for_file: prefer_const_declarations, prefer_const_constructors

import 'package:app_l10n/app_l10n.dart';
import 'package:as_boilerplate_flutter/login/login.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAppLocalizations extends Mock implements AppLocalizations {}

void main() {
  group('LoginFailureExtension', () {
    const serverErrorText = 'serverErrorText';

    late AppLocalizations l10n;

    setUp(() {
      l10n = MockAppLocalizations();
    });

    group('serverErrorText', () {
      test('returns l10n.invalidCredentials for InvalidCredentials', () {
        when(() => l10n.invalidCredentials).thenReturn(serverErrorText);
        final failure = InvalidCredentials('');
        expect(failure.serverErrorText(l10n), serverErrorText);
      });

      test('returns l10n.generalServerError for null', () {
        when(() => l10n.generalServerError).thenReturn(serverErrorText);
        final LoginFailure? failure = null;
        expect(failure.serverErrorText(l10n), serverErrorText);
      });
    });
  });
}

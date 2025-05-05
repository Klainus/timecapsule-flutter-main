// ignore_for_file: prefer_const_constructors

import 'package:as_boilerplate_flutter/create_account/create_account.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const validPassword = 'password';
  const emptyPassword = '';

  group('maybeError', () {
    test('returns empty if value is empty', () {
      expect(
        PasswordValidator().maybeError(emptyPassword),
        PasswordValidationError.empty,
      );
    });

    test('returns null if value has no error', () {
      expect(PasswordValidator().maybeError(validPassword), null);
    });
  });
}

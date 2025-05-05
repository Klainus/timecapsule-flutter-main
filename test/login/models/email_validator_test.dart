// ignore_for_file: prefer_const_constructors

import 'package:as_boilerplate_flutter/login/login.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const validEmail = 'email';
  const emptyEmail = '';

  group('maybeError', () {
    test('returns empty if value is empty', () {
      expect(
        EmailValidator().maybeError(emptyEmail),
        EmailValidationError.empty,
      );
    });

    test('returns null if value has no error', () {
      expect(EmailValidator().maybeError(validEmail), null);
    });
  });
}

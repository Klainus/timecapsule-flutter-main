// ignore_for_file: prefer_const_constructors

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  VerificationCodeFailure createSubject({
    String access = 'access',
  }) {
    return VerificationCodeFailure('error');
  }

  group('VerificationCodeFailure', () {
    group('constructor', () {
      test('works correctly', () {
        expect(
          createSubject,
          returnsNormally,
        );
      });
    });

    test('supports value equality', () {
      expect(
        createSubject(),
        equals(createSubject()),
      );
    });
  });
}

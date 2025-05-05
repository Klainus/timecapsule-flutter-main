// ignore_for_file: prefer_const_constructors

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('InvalidCredentials', () {
    test('supports value equality', () {
      expect(
        InvalidCredentials('error'),
        InvalidCredentials('error'),
      );
    });
  });
}

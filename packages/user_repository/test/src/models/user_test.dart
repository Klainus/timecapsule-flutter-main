// ignore_for_file: use_named_constants
// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_declarations
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:app_api/app_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  group('User', () {
    final user = User(
      id: 'id',
      email: 'email',
      firstName: 'firstName',
      lastName: 'lastName',
      isStaff: false,
    );

    group('from', () {
      test('UserMe', () {
        final userMe = UserMe(
          id: 'id',
          email: 'email',
          firstName: 'firstName',
          lastName: 'lastName',
          isStaff: false,
        );

        expect(User.from(userMe), user);
      });
    });

    test('isEmpty returns true when empty', () {
      final u = User.empty;
      expect(u.isEmpty, true);
    });

    test('isNotEmpty returns false when empty', () {
      final u = User.empty;
      expect(u.isNotEmpty, false);
    });

    group('empty', () {
      test('returns User', () {
        expect(
          User.empty,
          isA<User>(),
        );
      });
    });
  });
}

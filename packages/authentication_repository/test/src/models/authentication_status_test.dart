import 'package:authentication_api/authentication_api.dart' as api;
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(AuthenticationStatus, () {
    group('from', () {
      test(
          'returns ${AuthenticationStatus.unauthenticated} '
          'when api status is ${api.AuthenticationStatus.initial}', () {
        expect(
          AuthenticationStatus.from(api.AuthenticationStatus.initial),
          AuthenticationStatus.unauthenticated,
        );
      });

      test(
          'returns ${AuthenticationStatus.unauthenticated} '
          'when api status is ${api.AuthenticationStatus.unauthenticated}', () {
        expect(
          AuthenticationStatus.from(
            api.AuthenticationStatus.unauthenticated,
          ),
          AuthenticationStatus.unauthenticated,
        );
      });

      test(
          'returns ${AuthenticationStatus.authenticated} '
          'when api status is ${api.AuthenticationStatus.authenticated}', () {
        expect(
          AuthenticationStatus.from(
            api.AuthenticationStatus.authenticated,
          ),
          AuthenticationStatus.authenticated,
        );
      });
    });

    group('isAuthenticated', () {
      test(
          'returns true when status '
          'is ${AuthenticationStatus.authenticated}', () {
        const status = AuthenticationStatus.authenticated;
        expect(status.isAuthenticated, true);
      });

      test(
          'returns false when status '
          'is ${AuthenticationStatus.unauthenticated}', () {
        const status = AuthenticationStatus.unauthenticated;
        expect(status.isAuthenticated, false);
      });
    });

    group('isUnauthenticated', () {
      test(
          'returns true when status '
          'is ${AuthenticationStatus.unauthenticated}', () {
        const status = AuthenticationStatus.unauthenticated;
        expect(status.isUnauthenticated, true);
      });

      test(
          'returns false when status '
          'is ${AuthenticationStatus.authenticated}', () {
        const status = AuthenticationStatus.authenticated;
        expect(status.isUnauthenticated, false);
      });
    });
  });
}

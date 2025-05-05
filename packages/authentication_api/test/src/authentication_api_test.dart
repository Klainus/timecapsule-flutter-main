// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: cascade_invocations

import 'package:authentication_api/authentication_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockFirebaseAuth extends Mock implements FirebaseAuth {}

void main() {
  group(
    AuthenticationApi,
    () {
      late FirebaseAuth firebaseAuth;

      setUp(() {
        firebaseAuth = _MockFirebaseAuth();
      });

      AuthenticationApi createSubject() {
        return AuthenticationApi(
          firebaseAuth: firebaseAuth,
        );
      }
    },
  );
}

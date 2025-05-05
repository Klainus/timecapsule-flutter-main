// ignore_for_file: prefer_const_constructors
// ignore_for_file: inference_failure_on_collection_literal
// ignore_for_file: prefer_function_declarations_over_variables

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationApi extends Mock implements AuthenticationApi {}

void main() {
  late AuthenticationApi api;

  const email = 'email';
  const password = 'password';

  setUp(() {
    api = MockAuthenticationApi();
  });

  AuthenticationRepository createSubject() {
    return AuthenticationRepository(api);
  }
}

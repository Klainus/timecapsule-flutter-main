// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: cascade_invocations

import 'dart:async';

import 'package:authentication_api/authentication_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_repository/user_repository.dart';

class _MockAuthenticationApi extends Mock implements AuthenticationApi {}

class _MockUserService extends Mock implements UserService {}

class _MockUserStorageWrapper extends Mock implements UserStorageWrapper {}

Future<void> tick() => Future<void>.delayed(Duration.zero);

void main() {
  final userMe = UserMe(
    id: 'id',
    email: 'email',
    firstName: 'firstName',
    lastName: 'lastName',
    isStaff: false,
  );

  final user = User.from(userMe);

  final persistedUserState = PersistedUserState(
    isAnalyticsCollectionEnabled: true,
  );

  group(UserRepository, () {
    late AuthenticationApi authenticationApi;
    late UserService userService;
    late UserStorageWrapper storage;

    setUp(() {
      authenticationApi = _MockAuthenticationApi();
      userService = _MockUserService();
      storage = _MockUserStorageWrapper();
      when(() => authenticationApi.status).thenAnswer(
        (_) => Stream.empty(),
      );
    });

    UserRepository createSubject() {
      return UserRepository(
        authenticationApi: authenticationApi,
        userService: userService,
        userStorageWrapper: storage,
      );
    }
  });
}

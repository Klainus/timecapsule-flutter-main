// ignore_for_file: prefer_const_constructors

import 'package:as_boilerplate_flutter/authentication/authentication.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_repository/user_repository.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  const currentStatus = AuthenticationStatus.unauthenticated;
  const currentUser = User.empty;

  final initialState = AuthenticationState(
    status: currentStatus,
    user: currentUser,
  );

  group(AuthenticationBloc, () {
    late AuthenticationRepository authenticationRepository;
    late UserRepository userRepository;

    setUp(() {
      authenticationRepository = MockAuthenticationRepository();
      userRepository = MockUserRepository();
      when(() => authenticationRepository.status).thenAnswer(
        (_) => Stream.empty(),
      );
      when(() => authenticationRepository.currentStatus).thenAnswer(
        (_) => currentStatus,
      );
      when(() => userRepository.user).thenAnswer((_) => Stream.empty());
      when(() => userRepository.currentUser).thenReturn(currentUser);
    });

    AuthenticationBloc buildBloc() {
      return AuthenticationBloc(
        authenticationRepository: authenticationRepository,
        userRepository: userRepository,
      );
    }

    test('initial state is $AuthenticationState', () {
      expect(buildBloc().state, initialState);
    });

    group(AuthenticationStatusSubscriptionRequested, () {
      const updatedStatus = AuthenticationStatus.authenticated;

      blocTest<AuthenticationBloc, AuthenticationState>(
        'emits status when status stream emits new value',
        build: buildBloc,
        setUp: () {
          when(() => authenticationRepository.status).thenAnswer(
            (_) => Stream.value(updatedStatus),
          );
        },
        act: (bloc) {
          bloc.add(
            AuthenticationStatusSubscriptionRequested(),
          );
        },
        expect: () => [
          initialState.copyWith(status: updatedStatus),
        ],
      );
    });

    group(AuthenticationUserSubscriptionRequested, () {
      final updatedUser = currentUser.copyWith(
        email: 'updatedEmail',
      );

      blocTest<AuthenticationBloc, AuthenticationState>(
        'emits user when user stream emits new value',
        build: buildBloc,
        setUp: () {
          when(() => userRepository.user).thenAnswer(
            (_) => Stream.value(updatedUser),
          );
        },
        act: (bloc) {
          bloc.add(
            AuthenticationUserSubscriptionRequested(),
          );
        },
        expect: () => [
          initialState.copyWith(user: updatedUser),
        ],
      );
    });

    group(AuthenticationLogoutPressed, () {
      blocTest<AuthenticationBloc, AuthenticationState>(
        'calls logOut',
        setUp: () {
          when(authenticationRepository.logOut).thenAnswer((_) async {});
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            AuthenticationLogoutPressed(),
          );
        },
        verify: (_) {
          verify(authenticationRepository.logOut).called(1);
        },
      );
    });
  });
}

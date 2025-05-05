// ignore_for_file: prefer_function_declarations_over_variables
// ignore_for_file: cascade_invocations

import 'package:authentication_api/authentication_api.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_repository/user_repository.dart';

class _MockUsersApi extends Mock implements UsersApi {}

void main() {
  group(UserService, () {
    late UsersApi usersApi;

    setUp(() {
      usersApi = _MockUsersApi();
    });

    UserService buildCubit() {
      return UserService(usersApi: usersApi);
    }

    test('initial state is $User.empty', () {
      expect(buildCubit().state, User.empty);
    });

    group('fetch', () {
      final userMe = UserMe(
        id: 'id',
        email: 'email',
        isStaff: true,
      );

      final error = Exception('oops');

      final request = () => usersApi.usersMeRetrieve();

      blocTest<UserService, User>(
        'emits $User when request succeeds',
        setUp: () {
          when(request).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(),
              data: userMe,
            ),
          );
        },
        build: buildCubit,
        act: (cubit) => cubit.fetch(),
        expect: () => [
          User.from(userMe),
        ],
        verify: (_) {
          verify(request).called(1);
        },
      );

      blocTest<UserService, User>(
        'emits $User.empty and rethrows when request throws',
        setUp: () {
          when(request).thenThrow(error);
        },
        build: buildCubit,
        act: (cubit) => cubit.fetch(),
        expect: () => [User.empty],
        errors: () => [error],
        verify: (_) {
          verify(request).called(1);
        },
      );
    });

    group('patch', () {
      const updatedEmail = 'updatedEmail';

      final patchedUser = PatchedUserMe(
        email: updatedEmail,
      );

      final userMe = UserMe(
        id: 'id',
        isStaff: true,
        email: updatedEmail,
      );

      final request = () => usersApi.usersMePartialUpdate(
            patchedUserMe: patchedUser,
          );

      blocTest<UserService, User>(
        'emits updated $User',
        setUp: () {
          when(request).thenAnswer(
            (_) async => Response(
              requestOptions: RequestOptions(),
              data: userMe,
            ),
          );
        },
        build: buildCubit,
        act: (cubit) => cubit.patch(patchedUser),
        expect: () => [
          User.from(userMe),
        ],
        verify: (_) {
          verify(request).called(1);
        },
      );
    });

    group('clear', () {
      blocTest<UserService, User>(
        'emits $User.empty',
        build: buildCubit,
        act: (cubit) => cubit.clear(),
        expect: () => [User.empty],
      );
    });
  });
}

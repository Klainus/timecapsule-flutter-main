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

    group('constructor', () {
      final fetch = () => userService.fetch();
      final authenticate = () => authenticationApi.authenticate();
      final subscribe = () => storage.subscribe(user.id);

      final clear = () => userService.clear();
      final unsubscribe = () => storage.unsubscribe();

      test(
          'calls authenticate and subscribe when status changes to '
          '${AuthenticationStatus.initial} and fetch succeds', () async {
        when(() => authenticationApi.status).thenAnswer(
          (_) => Stream.value(AuthenticationStatus.initial),
        );
        when(fetch).thenAnswer((_) async {});
        when(() => userService.state).thenReturn(user);
        createSubject();
        await tick();
        verify(fetch).called(1);
        verify(authenticate).called(1);
        verify(subscribe).called(1);
      });

      test(
          'returns when status changes to '
          '${AuthenticationStatus.authenticated} and user.isNotEmpty',
          () async {
        when(() => authenticationApi.status).thenAnswer(
          (_) => Stream.value(AuthenticationStatus.authenticated),
        );
        when(() => userService.state).thenReturn(user);
        createSubject();
        await tick();
        verifyNever(fetch);
        verifyNever(subscribe);
      });

      test(
          'calls fetch and subscribe when status changes to '
          '${AuthenticationStatus.authenticated} and user.isEmpty', () async {
        when(() => authenticationApi.status).thenAnswer(
          (_) => Stream.value(AuthenticationStatus.authenticated),
        );
        when(fetch).thenAnswer((_) async {});
        final userCalls = [User.empty, user];
        when(() => userService.state).thenAnswer(
          (_) => userCalls.removeAt(0),
        );
        createSubject();
        await tick();
        verify(fetch).called(1);
        verify(subscribe).called(1);
      });

      test(
          'calls clear and unsubscribe when status changes to '
          '${AuthenticationStatus.unauthenticated}', () async {
        when(() => authenticationApi.status).thenAnswer(
          (_) => Stream.value(AuthenticationStatus.unauthenticated),
        );
        createSubject();
        await tick();
        verify(clear).called(1);
        verify(unsubscribe).called(1);
      });
    });

    group('user', () {
      test('returns userService.stream', () {
        final stream = Stream<User>.empty();
        when(() => userService.stream).thenAnswer((_) => stream);
        final repository = createSubject();
        expect(repository.user, stream);
      });
    });

    group('currentUser', () {
      test('returns userService.state', () {
        when(() => userService.state).thenReturn(user);
        final repository = createSubject();
        expect(repository.currentUser, user);
      });
    });

    group('persistedUserState', () {
      test('returns storage.stream', () {
        final stream = Stream<PersistedUserState>.empty();
        when(() => storage.stream).thenAnswer((_) => stream);
        final repository = createSubject();
        expect(repository.persistedUserState, stream);
      });
    });

    group('currentPersistedUserState', () {
      test('returns storage.persistedUserState', () {
        when(() => storage.persistedUserState).thenReturn(persistedUserState);
        final repository = createSubject();
        expect(repository.currentPersistedUserState, persistedUserState);
      });
    });

    group('changeEmail', () {
      const updatedEmail = 'updatedEmail';

      final patch = () => userService.patch(
            PatchedUserMe(email: updatedEmail),
          );

      test('calls patch', () async {
        when(patch).thenAnswer((_) async {});
        final repository = createSubject();
        await repository.changeEmail(updatedEmail);
        verify(patch).called(1);
      });
    });

    group('enableAnalyticsCollection', () {
      final enableAnalyticsCollection =
          () => storage.enableAnalyticsCollection();

      test('calls storage.enableAnalyticsCollection', () {
        final repository = createSubject();
        repository.enableAnalyticsCollection();
        verify(enableAnalyticsCollection).called(1);
      });
    });

    group('disableAnalyticsCollection', () {
      final disableAnalyticsCollection =
          () => storage.disableAnalyticsCollection();

      test('calls storage.disableAnalyticsCollection', () {
        final repository = createSubject();
        repository.disableAnalyticsCollection();
        verify(disableAnalyticsCollection).called(1);
      });
    });
  });
}

// ignore_for_file: prefer_const_constructors
// ignore_for_file: cascade_invocations

import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_repository/user_repository.dart';

import '../helpers/init_mock_hydrated_storage.dart';

class MockUserStorage extends Mock implements UserStorage {}

void main() {
  initMockHydratedStorage();

  const id = 'id';

  final persistedUserState = PersistedUserState(
    isAnalyticsCollectionEnabled: true,
  );

  group('UserStorageWrapper', () {
    late UserStorage storage;

    setUp(() {
      storage = MockUserStorage();
      when(() => storage.stream).thenAnswer((_) => Stream.empty());
      when(() => storage.close()).thenAnswer((_) async {});
    });

    group('persistedUserState', () {
      test('returns storage.state', () {
        when(() => storage.state).thenReturn(persistedUserState);
        final wrapper = UserStorageWrapper(
          createStorage: (_) => storage,
        );
        wrapper.subscribe(id);
        expect(wrapper.persistedUserState, persistedUserState);
      });
    });

    group('subscribe', () {
      test('returns normally', () {
        final wrapper = UserStorageWrapper();
        wrapper.subscribe(id);
      });

      test('calls storage.close', () {
        final wrapper = UserStorageWrapper(
          createStorage: (_) => storage,
        );
        wrapper.subscribe(id);
        wrapper.subscribe(id);
        verify(() => storage.close()).called(1);
      });

      test('subscribes stream to storage.stream', () async {
        when(() => storage.stream).thenAnswer(
          (_) => Stream.value(persistedUserState),
        );
        final wrapper = UserStorageWrapper(
          createStorage: (_) => storage,
        );
        wrapper.subscribe(id);

        await expectLater(
          wrapper.stream,
          emits(persistedUserState),
        );
      });
    });

    group('unsubscribe', () {
      test('calls storage.close', () {
        final wrapper = UserStorageWrapper(
          createStorage: (_) => storage,
        );
        wrapper.subscribe(id);
        wrapper.unsubscribe();
        verify(() => storage.close()).called(1);
      });
    });

    group('enableAnalyticsCollection', () {
      test('calls storage.enableAnalyticsCollection', () {
        final wrapper = UserStorageWrapper(
          createStorage: (_) => storage,
        );
        wrapper.subscribe(id);
        wrapper.enableAnalyticsCollection();
        verify(() => storage.enableAnalyticsCollection()).called(1);
      });
    });

    group('disableAnalyticsCollection', () {
      test('calls storage.disableAnalyticsCollection', () {
        final wrapper = UserStorageWrapper(
          createStorage: (_) => storage,
        );
        wrapper.subscribe(id);
        wrapper.disableAnalyticsCollection();
        verify(() => storage.disableAnalyticsCollection()).called(1);
      });
    });
  });
}

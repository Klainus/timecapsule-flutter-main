// ignore_for_file: prefer_const_constructors
// ignore_for_file: avoid_redundant_argument_values

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_repository/user_repository.dart';

import '../helpers/init_mock_hydrated_storage.dart';

void main() {
  initMockHydratedStorage();

  const id = 'id';

  group('UserStorage', () {
    UserStorage buildSubject() => UserStorage(id);

    group('constructor', () {
      test('overrides id', () {
        final storage = buildSubject();
        expect(storage.id, id);
      });
    });

    group('enableAnalyticsCollection', () {
      blocTest<UserStorage, PersistedUserState>(
        'emits state with isAnalyticsCollectionEnabled set to true',
        build: buildSubject,
        act: (storage) {
          storage.enableAnalyticsCollection();
        },
        expect: () => [
          PersistedUserState(
            isAnalyticsCollectionEnabled: true,
          ),
        ],
      );
    });

    group('disableAnalyticsCollection', () {
      blocTest<UserStorage, PersistedUserState>(
        'emits state with isAnalyticsCollectionEnabled set to false',
        build: buildSubject,
        act: (storage) {
          storage.disableAnalyticsCollection();
        },
        expect: () => [
          PersistedUserState(
            isAnalyticsCollectionEnabled: false,
          ),
        ],
      );
    });

    group('fromJson', () {
      test('returns PersistedUserState.fromJson', () {
        final persistedUserState = PersistedUserState();
        final json = persistedUserState.toJson();
        final storage = UserStorage(id);

        expect(
          storage.fromJson(json),
          PersistedUserState.fromJson(json),
        );
      });
    });

    group('toJson', () {
      test('returns state.toJson', () {
        final state = PersistedUserState();
        final storage = UserStorage(id);

        expect(
          storage.toJson(state),
          state.toJson(),
        );
      });
    });
  });
}

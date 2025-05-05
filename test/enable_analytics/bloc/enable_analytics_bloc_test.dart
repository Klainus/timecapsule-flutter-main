// ignore_for_file: prefer_const_constructors
// ignore_for_file: avoid_redundant_argument_values

import 'package:analytics_repository/analytics_repository.dart';
import 'package:as_boilerplate_flutter/enable_analytics/enable_analytics.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:user_repository/user_repository.dart';

class MockAnalyticsRepository extends Mock implements AnalyticsRepository {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  group('EnableAnalyticsBloc', () {
    late AnalyticsRepository analyticsRepository;
    late UserRepository userRepository;

    setUp(() {
      analyticsRepository = MockAnalyticsRepository();
      userRepository = MockUserRepository();
    });

    EnableAnalyticsBloc buildBloc() => EnableAnalyticsBloc(
          analyticsRepository,
          userRepository,
        );

    test('initial state is EnableLocationState', () {
      expect(
        buildBloc().state,
        EnableAnalyticsState(),
      );
    });

    group('EnableAnalyticsPressed', () {
      blocTest<EnableAnalyticsBloc, EnableAnalyticsState>(
        'calls userRepository.enableAnalyticsCollection '
        'and analyticsRepository.enableAnalyticsCollection '
        'and emits [loading, success]',
        setUp: () {
          when(
            () => analyticsRepository.enableAnalyticsCollection(),
          ).thenAnswer(
            (_) async {},
          );
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            EnableAnalyticsPressed(),
          );
        },
        expect: () => [
          EnableAnalyticsState(
            status: EnableAnalyticsStatus.loading,
          ),
          EnableAnalyticsState(
            status: EnableAnalyticsStatus.success,
          ),
        ],
        verify: (_) {
          verify(
            () => analyticsRepository.enableAnalyticsCollection(),
          ).called(1);
          verify(
            () => userRepository.enableAnalyticsCollection(),
          ).called(1);
        },
      );
    });

    group('EnableAnalyticsSkipped', () {
      blocTest<EnableAnalyticsBloc, EnableAnalyticsState>(
        'calls userRepository.disableAnalyticsCollection '
        'and analyticsRepository.disableAnalyticsCollection '
        'emits [loading, failure]',
        setUp: () {
          when(
            () => analyticsRepository.disableAnalyticsCollection(),
          ).thenAnswer(
            (_) async {},
          );
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(
            EnableAnalyticsSkipped(),
          );
        },
        expect: () => [
          EnableAnalyticsState(
            status: EnableAnalyticsStatus.loading,
          ),
          EnableAnalyticsState(
            status: EnableAnalyticsStatus.failure,
          ),
        ],
        verify: (_) {
          verify(
            () => analyticsRepository.disableAnalyticsCollection(),
          ).called(1);
          verify(
            () => userRepository.disableAnalyticsCollection(),
          ).called(1);
        },
      );
    });
  });
}

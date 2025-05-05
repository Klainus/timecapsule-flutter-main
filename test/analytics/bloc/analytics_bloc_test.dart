// ignore_for_file: prefer_const_constructors
// ignore_for_file: avoid_redundant_argument_values

import 'package:analytics_repository/analytics_repository.dart';
import 'package:as_boilerplate_flutter/analytics/bloc/analytics_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

class MockAnalyticsRepository extends Mock implements AnalyticsRepository {}

void main() {
  group('AnalyticsBloc', () {
    late AnalyticsRepository analyticsRepository;

    setUp(() {
      analyticsRepository = MockAnalyticsRepository();
    });

    AnalyticsBloc buildBloc() => AnalyticsBloc(analyticsRepository);

    group('AnalyticsEvent', () {
      const event = LoginEvent();

      blocTest<AnalyticsBloc, void>(
        'calls analyticsRepository.send',
        setUp: () {
          when(() => analyticsRepository.send(event)).thenAnswer(
            (_) async => {},
          );
        },
        build: buildBloc,
        act: (bloc) {
          bloc.add(event);
        },
        verify: (_) {
          verify(
            () => analyticsRepository.send(event),
          ).called(1);
        },
      );
    });
  });
}

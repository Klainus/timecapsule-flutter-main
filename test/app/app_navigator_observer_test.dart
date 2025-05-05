// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:analytics_repository/analytics_repository.dart';
import 'package:as_boilerplate_flutter/app/app_navigator_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logging/logging.dart';
import 'package:mocktail/mocktail.dart';

class MockLogger extends Mock implements Logger {}

class MockAnalyticsRepository extends Mock implements AnalyticsRepository {}

class MockRoute extends Mock implements Route<dynamic> {}

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

void main() {
  final screenView = ScreenView.from(TestPage);
  final analyticRouteSettings = AnalyticRouteSettings(TestPage);

  group('AppNavigatorObserver', () {
    late Logger logger;
    late AnalyticsRepository analyticsRepository;
    late Route<dynamic> route;

    setUp(() {
      logger = MockLogger();
      analyticsRepository = MockAnalyticsRepository();
      route = MockRoute();
      registerFallbackValue(screenView);
      when(() => route.settings).thenReturn(analyticRouteSettings);
      when(() => analyticsRepository.send(any())).thenAnswer(
        (_) async => {},
      );
    });

    AppNavigatorObserver createSubject() {
      return AppNavigatorObserver(
        logger,
        analyticsRepository,
      );
    }

    group('didPush', () {
      test('does not send ScreenView for initial route', () {
        when(() => route.isFirst).thenReturn(true);
        createSubject().didPush(route, null);
        verifyNever(() => analyticsRepository.send(any()));
        verifyNever(() => logger.fine(any()));
      });

      test(
          'sends ScreenView for non-initial route '
          'when route settings are AnalyticRouteSettings '
          'and logs screenView.eventName with level [FINE]', () {
        when(() => route.isFirst).thenReturn(false);
        createSubject().didPush(route, null);
        verify(() => analyticsRepository.send(screenView)).called(1);
        verify(() => logger.fine(screenView.eventName));
      });
    });

    group('didPop', () {
      test(
          'sends ScreenView for the previous route '
          'when route settings are AnalyticRouteSettings '
          'and logs screenView.eventName with level [FINE]', () {
        createSubject().didPop(MockRoute(), route);
        verify(() => analyticsRepository.send(screenView)).called(1);
        verify(() => logger.fine(screenView.eventName));
      });
    });

    group('didReplace', () {
      test(
          'sends ScreenView for the new route '
          'when route settings are AnalyticRouteSettings '
          'and logs screenView.eventName with level [FINE]', () {
        createSubject().didReplace(newRoute: route);
        verify(() => analyticsRepository.send(screenView)).called(1);
        verify(() => logger.fine(screenView.eventName));
      });
    });
  });
}

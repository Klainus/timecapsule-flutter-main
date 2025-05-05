// ignore_for_file: prefer_const_constructors
// ignore_for_file: cascade_invocations

import 'package:analytics_repository/analytics_repository.dart';
import 'package:as_boilerplate_flutter/app/app_bloc_observer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:logging/logging.dart';
import 'package:mocktail/mocktail.dart';

class MockLogger extends Mock implements Logger {}

class MockAnalyticsRepository extends Mock implements AnalyticsRepository {}

sealed class TestEvent {
  const TestEvent();
}

final class _TestEventNameChanged extends TestEvent {
  const _TestEventNameChanged(this.name);

  final String name;
}

final class TestEventStarted extends TestEvent {
  const TestEventStarted();
}

final class TestEventPressed extends TestEvent with Analytic {
  const TestEventPressed();
}

final class TestEventWithNameThatNeedsToBeShortenedTo40Characters
    extends TestEvent with Analytic {
  const TestEventWithNameThatNeedsToBeShortenedTo40Characters();

  @override
  CustomEvent get event => CustomEvent('shortened name');
}

class TestBloc extends Bloc<TestEvent, void> {
  TestBloc() : super(null);
}

void main() {
  group('AppBlocObserver', () {
    late Logger logger;
    late AnalyticsRepository analyticsRepository;
    late TestBloc bloc;

    setUp(() {
      logger = MockLogger();
      analyticsRepository = MockAnalyticsRepository();
      bloc = TestBloc();
      registerFallbackValue(DefaultEvent.from(TestEventStarted));
    });

    AppBlocObserver createSubject() {
      return AppBlocObserver(
        logger,
        analyticsRepository,
      );
    }

    group('onEvent', () {
      test(
          'logs with level [FINE] when eventName starts '
          'with an underscore', () {
        final observer = createSubject();
        final event = _TestEventNameChanged('name');
        observer.onEvent(bloc, event);
        verify(() => logger.fine(event.runtimeType.toString()));
      });

      test(
          'logs with level [INFO] when eventName does not start '
          'with an underscore', () {
        final observer = createSubject();
        final event = TestEventStarted();
        observer.onEvent(bloc, event);
        verify(() => logger.info(event.runtimeType.toString()));
      });

      test(
          'sends DefaultEvent to analyticsRepository '
          'when Bloc event is Analytic and Analytic.event is null', () {
        final event = TestEventPressed();
        final defaultEvent = DefaultEvent.from(event.runtimeType);
        when(() => analyticsRepository.send(defaultEvent)).thenAnswer(
          (_) async {},
        );
        final observer = createSubject();
        observer.onEvent(bloc, event);
        verify(() => analyticsRepository.send(defaultEvent));
      });

      test(
          'sends Analytic.event to analyticsRepository when Bloc event '
          'is Analytic and Analytic.event is not null', () {
        final event = TestEventWithNameThatNeedsToBeShortenedTo40Characters();
        final customEvent = event.event;
        when(() => analyticsRepository.send(customEvent)).thenAnswer(
          (_) async {},
        );
        final observer = createSubject();
        observer.onEvent(bloc, event);
        verify(() => analyticsRepository.send(customEvent));
      });

      test(
          'does not send event to analyticsRepository when Bloc event '
          'is not Analytic', () {
        final event = TestEventStarted();
        final observer = createSubject();
        observer.onEvent(bloc, event);
        verifyNever(() => analyticsRepository.send(any()));
      });
    });

    group('onError', () {
      test('logs error with level [SEVERE]', () {
        final observer = createSubject();
        final error = Exception('error');
        final stackTrace = StackTrace.current;
        observer.onError(bloc, error, stackTrace);
        verify(() => logger.severe('error TestBloc', error, stackTrace));
      });
    });

    group('onCreate', () {
      test('logs with level [INFO]', () {
        final observer = createSubject();
        observer.onCreate(bloc);
        verify(() => logger.info('opened TestBloc'));
      });
    });

    group('onClose', () {
      test('logs with level [INFO]', () {
        final observer = createSubject();
        observer.onClose(bloc);
        verify(() => logger.info('closed TestBloc'));
      });
    });
  });
}

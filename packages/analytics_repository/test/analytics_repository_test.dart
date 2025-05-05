import 'package:analytics_repository/analytics_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAnalytics extends Mock implements FirebaseAnalytics {}

class MockFirebaseApp extends Mock implements FirebaseApp {}

class MockAnalyticsEvent extends Mock implements AnalyticsEvent {}

void main() {
  group('AnalyticsRepository', () {
    late FirebaseAnalytics firebaseAnalytics;
    late FirebaseApp firebaseApp;
    late AnalyticsEvent analyticsEvent;

    setUp(() {
      firebaseAnalytics = MockFirebaseAnalytics();
      firebaseApp = MockFirebaseApp();
      analyticsEvent = MockAnalyticsEvent();
    });

    AnalyticsRepository createSubject({bool debug = false}) {
      return AnalyticsRepository(
        firebaseApp,
        firebaseAnalytics,
        debug: debug,
      );
    }

    group('constructor', () {
      test('works correctly', () {
        expect(
          createSubject,
          returnsNormally,
        );
      });
    });

    group('disableAnalyticsCollection', () {
      test('calls firebaseAnalytics.setAnalyticsCollectionEnabled(false)',
          () async {
        when(
          () => firebaseAnalytics.setAnalyticsCollectionEnabled(false),
        ).thenAnswer(
          (_) async {},
        );
        final repository = createSubject();

        expect(
          repository.disableAnalyticsCollection(),
          completes,
        );

        verify(
          () => firebaseAnalytics.setAnalyticsCollectionEnabled(false),
        ).called(1);
      });
    });

    group('enableAnalyticsCollection', () {
      test(
          'calls firebaseAnalytics.setAnalyticsCollectionEnabled(true) '
          'when debug is false', () async {
        when(
          () => firebaseAnalytics.setAnalyticsCollectionEnabled(true),
        ).thenAnswer(
          (_) async {},
        );
        final repository = createSubject();

        expect(
          repository.enableAnalyticsCollection(),
          completes,
        );

        verify(
          () => firebaseAnalytics.setAnalyticsCollectionEnabled(true),
        ).called(1);
      });

      test(
          'calls firebaseAnalytics.setAnalyticsCollectionEnabled(false) '
          'when debug is true', () async {
        when(
          () => firebaseAnalytics.setAnalyticsCollectionEnabled(false),
        ).thenAnswer(
          (_) async {},
        );
        final repository = createSubject(debug: true);

        expect(
          repository.enableAnalyticsCollection(),
          completes,
        );

        verify(
          () => firebaseAnalytics.setAnalyticsCollectionEnabled(false),
        ).called(1);
      });
    });

    group('send', () {
      test('completes when event.send succeeds', () {
        when(() => analyticsEvent.send(firebaseAnalytics)).thenAnswer(
          (_) async {},
        );
        final repository = createSubject();

        expect(
          repository.send(analyticsEvent),
          completes,
        );

        verify(() => analyticsEvent.send(firebaseAnalytics)).called(1);
      });

      test('throws SendAnalyticsEventFailure when event.send fails', () {
        final exception = Exception('oops');
        when(
          () => analyticsEvent.send(firebaseAnalytics),
        ).thenThrow(exception);
        final repository = createSubject();

        expect(
          repository.send(analyticsEvent),
          throwsA(
            SendAnalyticsEventFailure(
              analyticsEvent,
              exception,
            ),
          ),
        );

        verify(() => analyticsEvent.send(firebaseAnalytics)).called(1);
      });
    });
  });
}

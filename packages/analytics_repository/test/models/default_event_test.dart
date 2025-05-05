// ignore_for_file: prefer_const_constructors

import 'package:analytics_repository/analytics_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAnalytics extends Mock implements FirebaseAnalytics {}

class TestEvent {}

class TestEventWithNameThatIsWayWayWayWayTooLong {}

void main() {
  group('DefaultEvent', () {
    late FirebaseAnalytics firebaseAnalytics;

    setUp(() {
      firebaseAnalytics = MockFirebaseAnalytics();
    });

    final defaultEvent = DefaultEvent.from(TestEvent);

    group('from', () {
      test('throws AssertionError when name.length > 40', () {
        expect(
          () => DefaultEvent.from(
            TestEventWithNameThatIsWayWayWayWayTooLong,
          ),
          throwsAssertionError,
        );
      });

      test('returns DefaultEvent with snake case name', () {
        expect(
          defaultEvent.name,
          'test_event',
        );
      });
    });

    group('send', () {
      test('calls analytics.logEvent', () {
        when(
          () => firebaseAnalytics.logEvent(name: defaultEvent.name),
        ).thenAnswer((_) async {});

        expect(
          defaultEvent.send(firebaseAnalytics),
          completes,
        );

        verify(
          () => firebaseAnalytics.logEvent(name: defaultEvent.name),
        ).called(1);
      });
    });
  });
}

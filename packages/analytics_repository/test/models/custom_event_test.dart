// ignore_for_file: prefer_const_constructors

import 'package:analytics_repository/src/models/custom_event.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAnalytics extends Mock implements FirebaseAnalytics {}

void main() {
  group('CustomEvent', () {
    late FirebaseAnalytics firebaseAnalytics;

    setUp(() {
      firebaseAnalytics = MockFirebaseAnalytics();
    });

    const name = 'name';
    const parameters = {'key': 'value'};

    test('throws AssertionError when name.length > 40', () {
      expect(
        () => CustomEvent(
          'test_event_that_is_longer_than_40_characters',
        ),
        throwsAssertionError,
      );
    });

    group('send', () {
      test('calls analytics.logEvent', () {
        when(
          () => firebaseAnalytics.logEvent(
            name: name,
            parameters: parameters,
          ),
        ).thenAnswer((_) async {});

        final customEvent = CustomEvent(
          name,
          parameters: parameters,
        );

        expect(
          customEvent.send(firebaseAnalytics),
          completes,
        );

        verify(
          () => firebaseAnalytics.logEvent(
            name: name,
            parameters: parameters,
          ),
        ).called(1);
      });
    });
  });
}

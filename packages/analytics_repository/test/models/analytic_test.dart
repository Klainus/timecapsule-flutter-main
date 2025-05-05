// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:analytics_repository/analytics_repository.dart';
import 'package:flutter_test/flutter_test.dart';

class TestEvent with Analytic {}

class TestEventWithCustomEvent with Analytic {
  @override
  CustomEvent get event => CustomEvent('name');
}

void main() {
  group('Analytic', () {
    test('can be mixed in', () {
      final testEvent = TestEvent();

      expect(
        testEvent,
        isA<Analytic>(),
      );
    });

    group('event', () {
      test('returns null by default', () {
        final testEvent = TestEvent();

        expect(
          testEvent.event,
          null,
        );
      });

      test('returns CustomEvent when overriden', () {
        final testEventWithCustomEvent = TestEventWithCustomEvent();

        expect(
          testEventWithCustomEvent.event,
          CustomEvent('name'),
        );
      });
    });
  });
}

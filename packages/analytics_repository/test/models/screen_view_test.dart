// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:analytics_repository/src/models/screen_view.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAnalytics extends Mock implements FirebaseAnalytics {}

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TestPageWithNameThatIsWayWayWayWayTooLong extends StatelessWidget {
  const TestPageWithNameThatIsWayWayWayWayTooLong({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

void main() {
  group('ScreenView', () {
    late FirebaseAnalytics firebaseAnalytics;

    setUp(() {
      firebaseAnalytics = MockFirebaseAnalytics();
    });

    final screenView = ScreenView.from(TestPage);

    test('throws AssertionError when routeName.length > 40', () {
      expect(
        () => ScreenView.from(TestPageWithNameThatIsWayWayWayWayTooLong),
        throwsAssertionError,
      );
    });

    test('has correct eventName', () {
      expect(screenView.eventName, 'test_page_viewed');
    });

    group('send', () {
      test('calls analytics.logScreenView', () {
        when(
          () => firebaseAnalytics.logScreenView(
            screenName: screenView.screenName,
          ),
        ).thenAnswer((_) async {});

        expect(
          screenView.send(firebaseAnalytics),
          completes,
        );

        verify(
          () => firebaseAnalytics.logScreenView(
            screenName: screenView.screenName,
          ),
        ).called(1);
      });
    });
  });
}

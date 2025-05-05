// ignore_for_file: prefer_const_constructors

import 'package:analytics_repository/analytics_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAnalytics extends Mock implements FirebaseAnalytics {}

class TestEvent extends AnalyticsEvent {
  @override
  Future<void> send(FirebaseAnalytics analytics) async {}
}

void main() {
  group('AnalyticsEvent', () {
    late FirebaseAnalytics firebaseAnalytics;

    setUp(() {
      firebaseAnalytics = MockFirebaseAnalytics();
    });

    test('supports value equality', () {
      expect(
        TestEvent(),
        TestEvent(),
      );
    });

    group('SignupEvent', () {
      group('send', () {
        const signUpMethod = 'email';

        test('calls analytics.logSignUp', () {
          when(
            () => firebaseAnalytics.logSignUp(signUpMethod: signUpMethod),
          ).thenAnswer((_) async {});

          expect(
            SignUpEvent().send(firebaseAnalytics),
            completes,
          );

          verify(
            () => firebaseAnalytics.logSignUp(signUpMethod: signUpMethod),
          ).called(1);
        });
      });
    });

    group('LoginEvent', () {
      group('send', () {
        test('calls analytics.logLogin', () {
          when(firebaseAnalytics.logLogin).thenAnswer((_) async {});
          expect(
            LoginEvent().send(firebaseAnalytics),
            completes,
          );
          verify(firebaseAnalytics.logLogin).called(1);
        });
      });
    });

    group('TutorialBeginEvent', () {
      group('send', () {
        test('calls analytics.logTutorialBegin', () {
          when(firebaseAnalytics.logTutorialBegin).thenAnswer((_) async {});
          expect(
            TutorialBeginEvent().send(firebaseAnalytics),
            completes,
          );
          verify(firebaseAnalytics.logTutorialBegin).called(1);
        });
      });
    });

    group('TutorialCompleteEvent', () {
      group('send', () {
        test('calls analytics.logTutorialComplete', () {
          when(firebaseAnalytics.logTutorialComplete).thenAnswer((_) async {});
          expect(
            TutorialCompleteEvent().send(firebaseAnalytics),
            completes,
          );
          verify(firebaseAnalytics.logTutorialComplete).called(1);
        });
      });
    });

    group('UserIdChangedEvent', () {
      test('supports value equality', () {
        expect(
          UserIdChangedEvent('userId'),
          UserIdChangedEvent('userId'),
        );
      });

      group('send', () {
        test('calls analytics.setUserId with userId when userId is not empty',
            () {
          const userId = 'userId';
          when(
            () => firebaseAnalytics.setUserId(id: userId),
          ).thenAnswer((_) async {});

          expect(
            UserIdChangedEvent(userId).send(firebaseAnalytics),
            completes,
          );

          verify(
            () => firebaseAnalytics.setUserId(id: userId),
          ).called(1);
        });

        test('calls analytics.setUserId with null when userId is empty', () {
          const userId = '';
          when(
            () => firebaseAnalytics.setUserId(),
          ).thenAnswer((_) async {});

          expect(
            UserIdChangedEvent(userId).send(firebaseAnalytics),
            completes,
          );

          verify(
            () => firebaseAnalytics.setUserId(),
          ).called(1);
        });
      });
    });
  });
}

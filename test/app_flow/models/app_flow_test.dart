// ignore_for_file: prefer_const_constructors
// ignore_for_file: avoid_redundant_argument_values

import 'package:as_boilerplate_flutter/app_flow/app_flow.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_repository/user_repository.dart';

class MockUser extends Mock implements User {}

void main() {
  group('AppFlow', () {
    late User user;

    setUp(() {
      user = MockUser();
    });

    group('from', () {
      test('returns correct AppFlow when user isEmpty and flow is initial', () {
        when(() => user.isNotEmpty).thenReturn(false);
        final flow = AppFlow.from(AppFlow(), user);
        expect(flow, AppFlow());
      });

      test(
          'returns correct AppFlow when user isNotEmpty '
          'and isEnableAnalyticsCompleted', () {
        when(() => user.isNotEmpty).thenReturn(true);

        final flow = AppFlow.from(
          AppFlow(isEnableAnalyticsCompleted: true),
          user,
        );

        expect(
          flow,
          AppFlow(
            isLoggedIn: true,
            isEnableAnalyticsCompleted: true,
          ),
        );
      });
    });
  });

  group('status', () {
    test('returns [landing] when not logged in', () {
      final flow = AppFlow(isLoggedIn: false);
      expect(flow.status, AppFlowStatus.landing);
    });

    test(
        'returns [enableAnalytics] when logged in '
        'and enable analytics is not completed', () {
      final flow = AppFlow(
        isLoggedIn: true,
        isEnableAnalyticsCompleted: false,
      );
      expect(flow.status, AppFlowStatus.enableAnalytics);
    });

    test(
        'returns [home] when authenticated '
        'and enable analytics is completed', () {
      final flow = AppFlow(
        isLoggedIn: true,
        isEnableAnalyticsCompleted: true,
      );
      expect(flow.status, AppFlowStatus.home);
    });
  });
}

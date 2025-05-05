// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:analytics_repository/analytics_repository.dart';
import 'package:as_boilerplate_flutter/analytics/analytics.dart';
import 'package:as_boilerplate_flutter/authentication/authentication.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nested/nested.dart';
import 'package:user_repository/user_repository.dart';

import '../../helpers/pump_app.dart';

class MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

class MockAnalyticsBloc extends MockBloc<AnalyticsEvent, void>
    implements AnalyticsBloc {}

void main() {
  group('AnalyticsListenerGroup', () {
    late AuthenticationBloc authenticationBloc;
    late AnalyticsBloc analyticsBloc;

    setUp(() {
      authenticationBloc = MockAuthenticationBloc();
      analyticsBloc = MockAnalyticsBloc();
      when(() => authenticationBloc.state).thenReturn(
        AuthenticationState(
          status: AuthenticationStatus.authenticated,
          user: User.empty,
        ),
      );
    });

    testWidgets(
      'renders LoginEventListener',
      (tester) async {
        await tester.pumpApp(
          Nested(
            children: [
              AnalyticsListenerGroup(),
            ],
            child: Container(),
          ),
          analyticsBloc: analyticsBloc,
          authenticationBloc: authenticationBloc,
        );

        expect(find.byType(LoginEventListener), findsOneWidget);
      },
    );

    testWidgets(
      'renders UserIdChangedEventListener',
      (tester) async {
        await tester.pumpApp(
          Nested(
            children: [
              UserIdChangedEventListener(),
            ],
            child: Container(),
          ),
          analyticsBloc: analyticsBloc,
          authenticationBloc: authenticationBloc,
        );

        expect(find.byType(UserIdChangedEventListener), findsOneWidget);
      },
    );

    testWidgets(
      'renders TutorialBeginEventListener',
      (tester) async {
        await tester.pumpApp(
          Nested(
            children: [
              TutorialBeginEventListener(),
            ],
            child: Container(),
          ),
          analyticsBloc: analyticsBloc,
          authenticationBloc: authenticationBloc,
        );

        expect(find.byType(TutorialBeginEventListener), findsOneWidget);
      },
    );

    testWidgets(
      'renders TutorialCompleteEventListener',
      (tester) async {
        await tester.pumpApp(
          Nested(
            children: [
              TutorialCompleteEventListener(),
            ],
            child: Container(),
          ),
          analyticsBloc: analyticsBloc,
          authenticationBloc: authenticationBloc,
        );

        expect(find.byType(TutorialCompleteEventListener), findsOneWidget);
      },
    );
  });
}

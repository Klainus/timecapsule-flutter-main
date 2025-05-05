// ignore_for_file: prefer_const_constructors

import 'package:analytics_repository/analytics_repository.dart';
import 'package:as_boilerplate_flutter/analytics/analytics.dart';
import 'package:as_boilerplate_flutter/authentication/authentication.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_repository/user_repository.dart';

import '../../helpers/pump_app.dart';

class MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

class MockAnalyticsBloc extends MockBloc<AnalyticsEvent, void>
    implements AnalyticsBloc {}

void main() {
  group('LoginEventListener', () {
    late AuthenticationBloc authenticationBloc;
    late AnalyticsBloc analyticsBloc;

    setUp(() {
      authenticationBloc = MockAuthenticationBloc();
      analyticsBloc = MockAnalyticsBloc();
    });

    const status = AuthenticationStatus.authenticated;

    final user = User(
      id: 'id',
      email: 'email',
      firstName: null,
      lastName: null,
      isStaff: false,
    );

    testWidgets(
      'adds LoginEvent to analyticsBloc when user changes '
      'from empty to non-empty',
      (tester) async {
        when(() => authenticationBloc.state).thenReturn(
          AuthenticationState(
            status: status,
            user: User.empty,
          ),
        );
        whenListen(
          authenticationBloc,
          Stream.fromIterable([
            AuthenticationState(
              status: status,
              user: User.empty,
            ),
            AuthenticationState(
              status: status,
              user: user,
            ),
          ]),
        );

        await tester.pumpApp(
          Container(),
          analyticsBloc: analyticsBloc,
          authenticationBloc: authenticationBloc,
          listener: LoginEventListener(),
        );

        verify(
          () => analyticsBloc.add(LoginEvent()),
        ).called(1);
      },
    );
  });
}

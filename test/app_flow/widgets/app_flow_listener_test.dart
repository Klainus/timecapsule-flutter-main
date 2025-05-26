// ignore_for_file: prefer_const_constructors, avoid_redundant_argument_values

import 'dart:async';

import 'package:as_boilerplate_flutter/app_flow/app_flow.dart';
import 'package:as_boilerplate_flutter/app_flow/widgets/app_flow_listener.dart';
import 'package:as_boilerplate_flutter/counter/view/home_page.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class MockAppFlowBloc extends MockBloc<AppFlowEvent, AppFlowState>
    implements AppFlowBloc {}

class MockAppFlowState extends Mock implements AppFlowState {}

class MockAppFlow extends Mock implements AppFlow {}

class MockNavigatorKey extends Mock implements GlobalKey<NavigatorState> {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockRoute extends Mock implements Route<dynamic> {}

void main() {
  group('AppFlowListener', () {
    late MockNavigatorObserver navigatorObserver;
    late GlobalKey<NavigatorState> navigatorKey;
    late AppFlowBloc appFlowBloc;
    late AppFlow firstFlow;
    late AppFlow secondFlow;

    setUp(() {
      navigatorObserver = MockNavigatorObserver();
      navigatorKey = GlobalKey<NavigatorState>();
      appFlowBloc = MockAppFlowBloc();
      firstFlow = MockAppFlow();
      secondFlow = MockAppFlow();
      registerFallbackValue(MockRoute());
    });

    testWidgets(
      'clears root navigator and navigates to flow route '
      'when flow status changes',
      (tester) async {
        when(() => navigatorObserver.didRemove(any(), any()))
            .thenAnswer((_) async {
          return;
        });
        when(() => navigatorObserver.didPush(any(), any())).thenAnswer(
          (_) async {
            return;
          },
        );
        when(() => appFlowBloc.state).thenReturn(
          AppFlowState(
            flow: AppFlow(
              isLoggedIn: false,
            ),
          ),
        );
        when(() => firstFlow.status).thenReturn(AppFlowStatus.landing);
        when(() => secondFlow.status).thenReturn(AppFlowStatus.home);

        whenListen(
          appFlowBloc,
          Stream.fromIterable([
            AppFlowState(flow: firstFlow),
            AppFlowState(flow: secondFlow),
          ]),
        );

        final landingPage = Container();
        final loginPage = Container();

        await tester.pumpApp(
          Container(),
          navigatorKey: navigatorKey,
          navigatorObserver: navigatorObserver,
          appFlowBloc: appFlowBloc,
          onGenerateInitialRoutes: (_) => [
            MaterialPageRoute(
              builder: (_) => landingPage,
            ),
            MaterialPageRoute(
              builder: (_) => loginPage,
            ),
          ],
          listener: AppFlowListener(navigatorKey),
        );

        await tester.pumpAndSettle();
        expect(find.byType(HomePage), findsOneWidget);

        verify(
          () => navigatorObserver.didRemove(any(), any()),
        ).called(2);
        verify(
          () => navigatorObserver.didPush(any(), any()),
          // One push each for the two initial routes and one for TabRootPage.
        ).called(3);
      },
    );
  });
}

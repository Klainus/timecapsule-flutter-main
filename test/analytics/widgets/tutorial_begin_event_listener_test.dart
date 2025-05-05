// ignore_for_file: prefer_const_constructors

import 'package:analytics_repository/analytics_repository.dart';
import 'package:as_boilerplate_flutter/analytics/analytics.dart';
import 'package:as_boilerplate_flutter/app_flow/app_flow.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/pump_app.dart';

class MockAppFlowBloc extends MockBloc<AppFlowEvent, AppFlowState>
    implements AppFlowBloc {}

class MockAppFlowState extends Mock implements AppFlowState {}

class MockAppFlow extends Mock implements AppFlow {}

class MockAnalyticsBloc extends MockBloc<AnalyticsEvent, void>
    implements AnalyticsBloc {}

void main() {
  group('TutorialBeginEventListener', () {
    late AnalyticsBloc analyticsBloc;
    late AppFlowBloc appFlowBloc;
    late AppFlow firstFlow;
    late AppFlow secondFlow;

    setUp(() {
      analyticsBloc = MockAnalyticsBloc();
      appFlowBloc = MockAppFlowBloc();
      firstFlow = MockAppFlow();
      secondFlow = MockAppFlow();
    });

    testWidgets(
      'adds TutorialBeginEvent to analyticsBloc when flow status changes '
      'from [landing] to [enableAnalytics]',
      (tester) async {
        when(() => appFlowBloc.state).thenReturn(
          AppFlowState(
            flow: AppFlow(),
          ),
        );
        when(() => firstFlow.status).thenReturn(AppFlowStatus.landing);
        when(() => secondFlow.status).thenReturn(AppFlowStatus.enableAnalytics);

        whenListen(
          appFlowBloc,
          Stream.fromIterable([
            AppFlowState(flow: firstFlow),
            AppFlowState(flow: secondFlow),
          ]),
        );

        await tester.pumpApp(
          Container(),
          analyticsBloc: analyticsBloc,
          appFlowBloc: appFlowBloc,
          listener: TutorialBeginEventListener(),
        );

        verify(
          () => analyticsBloc.add(TutorialBeginEvent()),
        ).called(1);
      },
    );
  });
}

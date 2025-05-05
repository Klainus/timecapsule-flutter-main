// ignore_for_file: prefer_const_constructors
// ignore_for_file: avoid_redundant_argument_values

import 'package:app_ui/app_ui.dart';
import 'package:as_boilerplate_flutter/app_flow/app_flow.dart';
import 'package:as_boilerplate_flutter/enable_analytics/enable_analytics.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

import '../../helpers/helpers.dart';

class MockAppFlowBloc extends MockBloc<AppFlowEvent, AppFlowState>
    implements AppFlowBloc {}

class MockEnableAnalyticsBloc
    extends MockBloc<EnableAnalyticsEvent, EnableAnalyticsState>
    implements EnableAnalyticsBloc {}

void main() {
  group('EnableAnalyticsPage', () {
    late AppFlowBloc appFlowBloc;
    late EnableAnalyticsBloc enableAnalyticsBloc;

    setUp(() {
      appFlowBloc = MockAppFlowBloc();
      enableAnalyticsBloc = MockEnableAnalyticsBloc();
      when(() => enableAnalyticsBloc.state).thenReturn(
        EnableAnalyticsState(),
      );
    });

    Widget buildSubject() {
      return BlocProvider.value(
        value: enableAnalyticsBloc,
        child: EnableAnalyticsPage(),
      );
    }

    group('route', () {
      testWidgets('renders EnableAnalyticsPage', (tester) async {
        await tester.pumpRoute(
          EnableAnalyticsPage.route(),
        );
        expect(find.byType(EnableAnalyticsPage), findsOneWidget);
      });
    });

    testWidgets(
        'adds AppFlowEnableAnalyticsCompleted to AppFlowBloc '
        'when status changes to [success]', (tester) async {
      whenListen(
        enableAnalyticsBloc,
        Stream.fromIterable([
          EnableAnalyticsState(
            status: EnableAnalyticsStatus.loading,
          ),
          EnableAnalyticsState(
            status: EnableAnalyticsStatus.success,
          ),
        ]),
      );
      await tester.pumpApp(
        buildSubject(),
        appFlowBloc: appFlowBloc,
      );
      verify(
        () => appFlowBloc.add(
          AppFlowEnableAnalyticsCompleted(),
        ),
      ).called(1);
    });

    testWidgets(
        'adds AppFlowEnableAnalyticsCompleted to AppFlowBloc '
        'when status changes to [failure]', (tester) async {
      whenListen(
        enableAnalyticsBloc,
        Stream.fromIterable([
          EnableAnalyticsState(
            status: EnableAnalyticsStatus.initial,
          ),
          EnableAnalyticsState(
            status: EnableAnalyticsStatus.failure,
          ),
        ]),
      );
      await tester.pumpApp(
        buildSubject(),
        appFlowBloc: appFlowBloc,
      );
      verify(
        () => appFlowBloc.add(
          AppFlowEnableAnalyticsCompleted(),
        ),
      ).called(1);
    });

    testWidgets(
        'adds EnableAnalyticsPressed to EnableAnalyticsBloc '
        'when AppFilledButton is pressed', (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(AppFilledButton));
      verify(
        () => enableAnalyticsBloc.add(EnableAnalyticsPressed()),
      ).called(1);
    });

    testWidgets(
        'adds EnableAnalyticsSkipped to EnableAnalyticsBloc '
        'when AppOutlinedButton is pressed', (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(AppOutlinedButton));
      verify(
        () => enableAnalyticsBloc.add(EnableAnalyticsSkipped()),
      ).called(1);
    });
  });
}

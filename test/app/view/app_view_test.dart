// ignore_for_file: prefer_const_constructors

import 'package:as_boilerplate_flutter/analytics/analytics.dart';
import 'package:as_boilerplate_flutter/app/view/app_view.dart';
import 'package:as_boilerplate_flutter/app_flow/app_flow.dart';
import 'package:as_boilerplate_flutter/app_flow/widgets/app_flow_listener.dart';
import 'package:as_boilerplate_flutter/landing/view/landing_page.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class MockAppFlowBloc extends MockBloc<AppFlowEvent, AppFlowState>
    implements AppFlowBloc {}

class MockAppFlowState extends Mock implements AppFlowState {}

class MockAppFlow extends Mock implements AppFlow {}

void main() {
  group('AppView', () {
    late AppFlowBloc appFlowBloc;
    late AppFlowState appFlowState;
    late AppFlow appFlow;

    setUp(() {
      appFlowBloc = MockAppFlowBloc();
      appFlowState = MockAppFlowState();
      appFlow = MockAppFlow();
      when(() => appFlowBloc.state).thenReturn(appFlowState);
      when(() => appFlowState.flow).thenReturn(appFlow);
      when(() => appFlow.status).thenReturn(AppFlowStatus.landing);
    });

    Widget buildSubject() => AppView();

    testWidgets('renders initial flow route', (tester) async {
      await tester.pumpApp(
        buildSubject(),
        appFlowBloc: appFlowBloc,
      );
      expect(find.byType(LandingPage), findsOneWidget);
    });

    testWidgets('renders AppFlowListener', (tester) async {
      await tester.pumpApp(
        buildSubject(),
        appFlowBloc: appFlowBloc,
      );
      expect(find.byType(AppFlowListener), findsOneWidget);
    });

    testWidgets('renders AnalyticsListenerGroup', (tester) async {
      await tester.pumpApp(
        buildSubject(),
        appFlowBloc: appFlowBloc,
      );
      expect(find.byType(AnalyticsListenerGroup), findsOneWidget);
    });
  });
}

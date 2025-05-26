// ignore_for_file: prefer_const_constructors, avoid_redundant_argument_values

import 'package:as_boilerplate_flutter/app_tab/app_tab.dart';
import 'package:as_boilerplate_flutter/counter/view/home_page.dart';
import 'package:as_boilerplate_flutter/settings/view/settings_page.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

import '../../helpers/helpers.dart';

class MockappTabBloc extends MockBloc<AppTabEvent, AppTab>
    implements AppTabBloc {}

void main() {
  group('App', () {
    group('TabRootPage', () {
      late AppTabBloc appTabBloc;
      late MockNavigator navigator;

      setUp(() {
        appTabBloc = MockappTabBloc();
        when(() => appTabBloc.state).thenReturn(AppTab.initial);
        navigator = MockNavigator();
        when(() => navigator.canPop()).thenReturn(false);
      });

      Widget buildSubject() {
        return MockNavigatorProvider(
          navigator: navigator,
          child: BlocProvider.value(
            value: appTabBloc,
            child: const TabRootPage(),
          ),
        );
      }

      group('route', () {
        testWidgets('renders TabRootPage', (tester) async {
          await tester.pumpRoute(
            TabRootPage.route(),
          );
          expect(find.byType(TabRootPage), findsOneWidget);
        });
      });

      testWidgets('adds AppTabPressed when NavigationDestination is pressed',
          (tester) async {
        const tabIndex = 1;
        await tester.pumpApp(buildSubject());
        await tester.tap(
          find.byType(NavigationDestination).at(tabIndex),
        );
        verify(() => appTabBloc.add(AppTabPressed(tabIndex))).called(1);
      });

      testWidgets('renders CounterPage when AppTab.home is selected',
          (tester) async {
        when(() => appTabBloc.state).thenReturn(AppTab.home);
        await tester.pumpApp(buildSubject());
        expect(find.byType(HomePage), findsOneWidget);
      });

      testWidgets('renders SettingsTab when AppTab.settings is selected',
          (tester) async {
        when(() => appTabBloc.state).thenReturn(AppTab.settings);
        await tester.pumpApp(buildSubject());
        expect(find.byType(SettingsPage), findsOneWidget);
      });
    });
  });
}

// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

import '../helpers/helpers.dart';

void main() {
  group('BaseAppBar', () {
    late MockNavigator navigator;

    setUp(() {
      navigator = MockNavigator();
      when(navigator.canPop).thenReturn(true);
      when(navigator.maybePop).thenAnswer((_) async => true);
    });

    Widget buildSubject() {
      return MockNavigatorProvider(
        navigator: navigator,
        child: BaseAppBar(),
      );
    }

    testWidgets('renders AppBar', (tester) async {
      await tester.pumpApp(buildSubject());

      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('renders AppBackButton when parentRoute impliesAppBarDismissal',
        (tester) async {
      await tester.pumpApp(
        Navigator(
          onGenerateInitialRoutes: (_, __) => [
            MaterialPageRoute(
              builder: (_) => Container(),
            ),
            MaterialPageRoute(
              builder: (_) => buildSubject(),
            ),
          ],
        ),
      );
      expect(find.byType(AppBackButton), findsOneWidget);

      await tester.tap(find.byType(AppBackButton));

      verify(navigator.maybePop).called(1);
    });
  });
}

// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:as_boilerplate_flutter/landing/landing.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

import '../../helpers/helpers.dart';

void main() {
  group('LandingPage', () {
    late MockNavigator navigator;

    setUp(() {
      navigator = MockNavigator();
      when(navigator.canPop).thenReturn(true);
      when(() => navigator.push<void>(any())).thenAnswer((_) async {
        return;
      });
    });

    Widget buildSubject() {
      return MockNavigatorProvider(
        navigator: navigator,
        child: LandingPage(),
      );
    }

    group('route', () {
      testWidgets('renders LandingPage', (tester) async {
        await tester.pumpRoute(
          LandingPage.route(),
        );
        expect(find.byType(LandingPage), findsOneWidget);
      });
    });

    testWidgets('navigates when AppFilledButton is pressed', (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(AppFilledButton));
      await tester.pumpAndSettle();
      verify(() => navigator.push<void>(any())).called(1);
    });

    testWidgets('navigates when AppOutlinedButton is pressed', (tester) async {
      await tester.pumpApp(buildSubject());
      await tester.tap(find.byType(AppOutlinedButton));
      await tester.pumpAndSettle();
      verify(() => navigator.push<void>(any())).called(1);
    });
  });
}

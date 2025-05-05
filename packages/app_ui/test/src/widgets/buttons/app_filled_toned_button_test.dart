// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('AppFilledTonalButton', () {
    const text = 'text';

    group('shrink', () {
      AppFilledTonalButton buildSubject() {
        return AppFilledTonalButton.shrink(
          text: text,
          onPressed: () {},
        );
      }

      testWidgets('renders AppFilledTonalButton', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.byType(AppFilledTonalButton), findsOneWidget);
      });

      testWidgets('renders text', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.text(text), findsOneWidget);
      });

      testWidgets('renders correct size', (tester) async {
        await tester.pumpApp(buildSubject());
        final finder = find.byType(AppFilledTonalButton);
        final widget = tester.widget(finder) as AppFilledTonalButton;

        expect(
          widget.size,
          AppButtonSize.shrink,
        );
      });

      testWidgets('calls onPressed when tapped', (tester) async {
        var tapped = false;

        await tester.pumpApp(
          AppFilledTonalButton.shrink(
            text: text,
            onPressed: () => tapped = true,
          ),
        );

        await tester.tap(find.byType(AppFilledTonalButton));
        expect(tapped, true);
      });

      testWidgets('does not call onPressed when tapped when isLoading',
          (tester) async {
        var tapped = false;

        await tester.pumpApp(
          AppFilledTonalButton.shrink(
            text: text,
            isLoading: true,
            onPressed: () => tapped = true,
          ),
        );

        await tester.tap(find.byType(AppFilledTonalButton));
        expect(tapped, false);
      });

      testWidgets('renders ButtonSpinner when isLoading', (tester) async {
        await tester.pumpApp(
          AppFilledTonalButton.shrink(
            text: text,
            isLoading: true,
            onPressed: () {},
          ),
        );

        expect(find.byType(ButtonSpinner), findsNWidgets(1));
      });
    });

    group('expand', () {
      AppFilledTonalButton buildSubject() {
        return AppFilledTonalButton.expand(
          text: text,
          onPressed: () {},
        );
      }

      testWidgets('renders AppFilledTonalButton', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.byType(AppFilledTonalButton), findsOneWidget);
      });

      testWidgets('renders text', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.text(text), findsOneWidget);
      });

      testWidgets('renders correct size', (tester) async {
        await tester.pumpApp(buildSubject());
        final finder = find.byType(AppFilledTonalButton);
        final widget = tester.widget(finder) as AppFilledTonalButton;

        expect(
          widget.size,
          AppButtonSize.expand,
        );
      });

      testWidgets('calls onPressed when tapped', (tester) async {
        var tapped = false;

        await tester.pumpApp(
          AppFilledTonalButton.expand(
            text: text,
            onPressed: () => tapped = true,
          ),
        );

        await tester.tap(find.byType(AppFilledTonalButton));
        expect(tapped, true);
      });

      testWidgets('does not call onPressed when tapped when isLoading',
          (tester) async {
        var tapped = false;

        await tester.pumpApp(
          AppFilledTonalButton.expand(
            text: text,
            isLoading: true,
            onPressed: () => tapped = true,
          ),
        );

        await tester.tap(find.byType(AppFilledTonalButton));
        expect(tapped, false);
      });

      testWidgets('renders ButtonSpinner when isLoading', (tester) async {
        await tester.pumpApp(
          AppFilledTonalButton.expand(
            text: text,
            isLoading: true,
            onPressed: () {},
          ),
        );

        expect(find.byType(ButtonSpinner), findsNWidgets(1));
      });
    });
  });
}

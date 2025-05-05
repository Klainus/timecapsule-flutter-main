// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('AppFilledButton', () {
    const text = 'text';

    group('shrink', () {
      AppFilledButton buildSubject() {
        return AppFilledButton.shrink(
          text: text,
          onPressed: () {},
        );
      }

      testWidgets('renders AppFilledButton', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.byType(AppFilledButton), findsOneWidget);
      });

      testWidgets('renders text', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.text(text), findsOneWidget);
      });

      testWidgets('renders correct size', (tester) async {
        await tester.pumpApp(buildSubject());
        final finder = find.byType(AppFilledButton);
        final widget = tester.widget(finder) as AppFilledButton;

        expect(
          widget.size,
          AppButtonSize.shrink,
        );
      });

      testWidgets('calls onPressed when tapped', (tester) async {
        var tapped = false;

        await tester.pumpApp(
          AppFilledButton.shrink(
            text: text,
            onPressed: () => tapped = true,
          ),
        );

        await tester.tap(find.byType(AppFilledButton));
        expect(tapped, true);
      });

      testWidgets('does not call onPressed when tapped when isLoading',
          (tester) async {
        var tapped = false;

        await tester.pumpApp(
          AppFilledButton.shrink(
            text: text,
            isLoading: true,
            onPressed: () => tapped = true,
          ),
        );

        await tester.tap(find.byType(AppFilledButton));
        expect(tapped, false);
      });

      testWidgets('renders ButtonSpinner when isLoading', (tester) async {
        await tester.pumpApp(
          AppFilledButton.shrink(
            text: text,
            isLoading: true,
            onPressed: () {},
          ),
        );

        expect(find.byType(ButtonSpinner), findsNWidgets(1));
      });
    });

    group('expand', () {
      AppFilledButton buildSubject() {
        return AppFilledButton.expand(
          text: text,
          onPressed: () {},
        );
      }

      testWidgets('renders AppFilledButton', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.byType(AppFilledButton), findsOneWidget);
      });

      testWidgets('renders text', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.text(text), findsOneWidget);
      });

      testWidgets('renders correct size', (tester) async {
        await tester.pumpApp(buildSubject());
        final finder = find.byType(AppFilledButton);
        final widget = tester.widget(finder) as AppFilledButton;

        expect(
          widget.size,
          AppButtonSize.expand,
        );
      });

      testWidgets('calls onPressed when tapped', (tester) async {
        var tapped = false;

        await tester.pumpApp(
          AppFilledButton.expand(
            text: text,
            onPressed: () => tapped = true,
          ),
        );

        await tester.tap(find.byType(AppFilledButton));
        expect(tapped, true);
      });

      testWidgets('does not call onPressed when tapped when isLoading',
          (tester) async {
        var tapped = false;

        await tester.pumpApp(
          AppFilledButton.expand(
            text: text,
            isLoading: true,
            onPressed: () => tapped = true,
          ),
        );

        await tester.tap(find.byType(AppFilledButton));
        expect(tapped, false);
      });

      testWidgets('renders ButtonSpinner when isLoading', (tester) async {
        await tester.pumpApp(
          AppFilledButton.expand(
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

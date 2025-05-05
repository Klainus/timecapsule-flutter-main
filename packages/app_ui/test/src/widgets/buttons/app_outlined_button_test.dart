// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('AppOutlinedButton', () {
    const text = 'text';

    group('shrink', () {
      AppOutlinedButton buildSubject() {
        return AppOutlinedButton.shrink(
          text: text,
          onPressed: () {},
        );
      }

      testWidgets('renders AppOutlinedButton', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.byType(AppOutlinedButton), findsOneWidget);
      });

      testWidgets('renders text', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.text(text), findsOneWidget);
      });

      testWidgets('renders correct size', (tester) async {
        await tester.pumpApp(buildSubject());
        final finder = find.byType(AppOutlinedButton);
        final widget = tester.widget(finder) as AppOutlinedButton;

        expect(
          widget.size,
          AppButtonSize.shrink,
        );
      });

      testWidgets('calls onPressed when tapped', (tester) async {
        var tapped = false;

        await tester.pumpApp(
          AppOutlinedButton.shrink(
            text: text,
            onPressed: () => tapped = true,
          ),
        );

        await tester.tap(find.byType(AppOutlinedButton));
        expect(tapped, true);
      });

      testWidgets('does not call onPressed when tapped when isLoading',
          (tester) async {
        var tapped = false;

        await tester.pumpApp(
          AppOutlinedButton.shrink(
            text: text,
            isLoading: true,
            onPressed: () => tapped = true,
          ),
        );

        await tester.tap(find.byType(AppOutlinedButton));
        expect(tapped, false);
      });

      testWidgets('renders ButtonSpinner when isLoading', (tester) async {
        await tester.pumpApp(
          AppOutlinedButton.shrink(
            text: text,
            isLoading: true,
            onPressed: () {},
          ),
        );

        expect(find.byType(ButtonSpinner), findsNWidgets(1));
      });
    });

    group('expand', () {
      AppOutlinedButton buildSubject() {
        return AppOutlinedButton.expand(
          text: text,
          onPressed: () {},
        );
      }

      testWidgets('renders AppOutlinedButton', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.byType(AppOutlinedButton), findsOneWidget);
      });

      testWidgets('renders text', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.text(text), findsOneWidget);
      });

      testWidgets('renders correct size', (tester) async {
        await tester.pumpApp(buildSubject());
        final finder = find.byType(AppOutlinedButton);
        final widget = tester.widget(finder) as AppOutlinedButton;

        expect(
          widget.size,
          AppButtonSize.expand,
        );
      });

      testWidgets('calls onPressed when tapped', (tester) async {
        var tapped = false;

        await tester.pumpApp(
          AppOutlinedButton.expand(
            text: text,
            onPressed: () => tapped = true,
          ),
        );

        await tester.tap(find.byType(AppOutlinedButton));
        expect(tapped, true);
      });

      testWidgets('does not call onPressed when tapped when isLoading',
          (tester) async {
        var tapped = false;

        await tester.pumpApp(
          AppOutlinedButton.expand(
            text: text,
            isLoading: true,
            onPressed: () => tapped = true,
          ),
        );

        await tester.tap(find.byType(AppOutlinedButton));
        expect(tapped, false);
      });

      testWidgets('renders ButtonSpinner when isLoading', (tester) async {
        await tester.pumpApp(
          AppOutlinedButton.expand(
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

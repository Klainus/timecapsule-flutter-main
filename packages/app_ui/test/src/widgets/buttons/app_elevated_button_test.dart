// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('AppElevatedButton', () {
    const text = 'text';

    group('shrink', () {
      AppElevatedButton buildSubject() {
        return AppElevatedButton.shrink(
          text: text,
          onPressed: () {},
        );
      }

      testWidgets('renders AppElevatedButton', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.byType(AppElevatedButton), findsOneWidget);
      });

      testWidgets('renders text', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.text(text), findsOneWidget);
      });

      testWidgets('renders correct size', (tester) async {
        await tester.pumpApp(buildSubject());
        final finder = find.byType(AppElevatedButton);
        final widget = tester.widget(finder) as AppElevatedButton;

        expect(
          widget.size,
          AppButtonSize.shrink,
        );
      });

      testWidgets('calls onPressed when tapped', (tester) async {
        var tapped = false;

        await tester.pumpApp(
          AppElevatedButton.shrink(
            text: text,
            onPressed: () => tapped = true,
          ),
        );

        await tester.tap(find.byType(AppElevatedButton));
        expect(tapped, true);
      });

      testWidgets('does not call onPressed when tapped when isLoading',
          (tester) async {
        var tapped = false;

        await tester.pumpApp(
          AppElevatedButton.shrink(
            text: text,
            isLoading: true,
            onPressed: () => tapped = true,
          ),
        );

        await tester.tap(find.byType(AppElevatedButton));
        expect(tapped, false);
      });

      testWidgets('renders ButtonSpinner when isLoading', (tester) async {
        await tester.pumpApp(
          AppElevatedButton.shrink(
            text: text,
            isLoading: true,
            onPressed: () {},
          ),
        );

        expect(find.byType(ButtonSpinner), findsNWidgets(1));
      });
    });

    group('expand', () {
      AppElevatedButton buildSubject() {
        return AppElevatedButton.expand(
          text: text,
          onPressed: () {},
        );
      }

      testWidgets('renders AppElevatedButton', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.byType(AppElevatedButton), findsOneWidget);
      });

      testWidgets('renders text', (tester) async {
        await tester.pumpApp(buildSubject());
        expect(find.text(text), findsOneWidget);
      });

      testWidgets('renders correct size', (tester) async {
        await tester.pumpApp(buildSubject());
        final finder = find.byType(AppElevatedButton);
        final widget = tester.widget(finder) as AppElevatedButton;

        expect(
          widget.size,
          AppButtonSize.expand,
        );
      });

      testWidgets('calls onPressed when tapped', (tester) async {
        var tapped = false;

        await tester.pumpApp(
          AppElevatedButton.expand(
            text: text,
            onPressed: () => tapped = true,
          ),
        );

        await tester.tap(find.byType(AppElevatedButton));
        expect(tapped, true);
      });

      testWidgets('does not call onPressed when tapped when isLoading',
          (tester) async {
        var tapped = false;

        await tester.pumpApp(
          AppElevatedButton.expand(
            text: text,
            isLoading: true,
            onPressed: () => tapped = true,
          ),
        );

        await tester.tap(find.byType(AppElevatedButton));
        expect(tapped, false);
      });

      testWidgets('renders ButtonSpinner when isLoading', (tester) async {
        await tester.pumpApp(
          AppElevatedButton.expand(
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

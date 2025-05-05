import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('ButtonSpinner', () {
    testWidgets('renders ButtonSpinner', (tester) async {
      await tester.pumpApp(
        const ButtonSpinner(Colors.red),
      );
      expect(
        find.byType(ButtonSpinner),
        findsOneWidget,
      );
    });

    testWidgets('CircularProgressIndicator has correct color', (tester) async {
      const color = Colors.red;
      await tester.pumpApp(
        const ButtonSpinner(color),
      );
      final finder = find.byType(CircularProgressIndicator);
      final widget = tester.widget<CircularProgressIndicator>(finder);
      expect(widget.color, color);
    });
  });
}

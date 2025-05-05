// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('AppTextButton', () {
    const text = 'text';

    testWidgets('renders button', (tester) async {
      await tester.pumpApp(
        AppTextButton(
          text: text,
          onPressed: () {},
        ),
      );

      expect(find.byType(AppTextButton), findsOneWidget);
    });
  });
}

import 'package:app_ui/app_ui.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/helpers.dart';

void main() {
  group('ErrorText', () {
    testWidgets('renders ErrorText', (tester) async {
      await tester.pumpApp(
        const ErrorText(),
      );

      expect(find.byType(ErrorText), findsOneWidget);
    });
  });
}

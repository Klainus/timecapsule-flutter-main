import 'package:analytics_repository/analytics_repository.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';

import '../helpers/helpers.dart';

class MockAnalyticsRouteSettings extends Mock
    implements AnalyticRouteSettings {}

void main() {
  late MockAnalyticsRouteSettings routeSettings;

  setUp(() {
    routeSettings = MockAnalyticsRouteSettings();
  });

  group('showAppDialog', () {
    testWidgets('renders child widget', (tester) async {
      await tester.pumpAppWithContext(
        (context) => showAppDialog(
          context: context,
          builder: (context) => const Text('child'),
          routeSettings: routeSettings,
        ),
      );

      expect(find.text('child'), findsOneWidget);
    });
  });
}

import 'package:as_boilerplate_flutter/app_flow/app_flow.dart';
import 'package:as_boilerplate_flutter/landing/view/landing_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  group('AppFlowStatusExtension', () {
    group('route', () {
      testWidgets('[landing] returns LandingPage route', (tester) async {
        await tester.pumpRoute(AppFlowStatus.landing.route);
        expect(find.byType(LandingPage), findsOneWidget);
      });
    });
  });
}

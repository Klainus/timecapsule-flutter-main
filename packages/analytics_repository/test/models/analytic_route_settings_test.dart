import 'package:analytics_repository/analytics_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

void main() {
  group('AnalyticRouteSettings', () {
    test('can be instantiated', () {
      const analyticRouteSettings = AnalyticRouteSettings(TestPage);

      expect(
        analyticRouteSettings.routeType,
        TestPage,
      );
    });
  });
}

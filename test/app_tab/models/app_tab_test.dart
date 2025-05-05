import 'package:as_boilerplate_flutter/app_tab/app_tab.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppTab', () {
    test('initial tab is AppTab.home', () {
      expect(AppTab.initial, AppTab.home);
    });
  });
}

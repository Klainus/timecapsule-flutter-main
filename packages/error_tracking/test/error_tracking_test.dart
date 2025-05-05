import 'package:error_tracking/error_tracking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Error tracking', () {
    test('can be initiallized', () {
      expect(
        ErrorTracking.init(
          environment: 'test',
          appRunner: () => runApp(const MaterialApp()),
        ),
        completes,
      );
    });
  });
}

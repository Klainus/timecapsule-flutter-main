// ignore_for_file: prefer_const_constructors

import 'package:app_ui/src/widgets/invisible_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/helpers.dart';

void main() {
  group('InvisiblePlaceholder', () {
    testWidgets('renderers visible child when visible is true', (tester) async {
      await tester.pumpApp(
        InvisiblePlaceholder(
          visible: true,
          child: Text('text'),
        ),
      );

      expect(find.text('text').hitTestable(), findsOneWidget);
    });

    testWidgets('renderers invisible child when visible is false',
        (tester) async {
      await tester.pumpApp(
        InvisiblePlaceholder(
          visible: false,
          child: Text('text'),
        ),
      );

      expect(find.text('text').hitTestable(), findsNothing);
    });
  });
}

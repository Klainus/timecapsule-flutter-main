import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/helpers.dart';

void main() {
  group('ThemeExtension', () {
    group('theme', () {
      testWidgets('returns ThemeData', (tester) async {
        await tester.pumpApp(
          Builder(
            builder: (context) {
              expect(
                context.theme,
                isA<ThemeData>(),
              );

              return Container();
            },
          ),
        );
      });
    });

    group('textTheme', () {
      testWidgets('returns TextTheme', (tester) async {
        await tester.pumpApp(
          Builder(
            builder: (context) {
              expect(
                context.textTheme,
                isA<TextTheme>(),
              );

              return Container();
            },
          ),
        );
      });
    });

    group('spacing', () {
      testWidgets('returns Spacing', (tester) async {
        await tester.pumpApp(
          Builder(
            builder: (context) {
              expect(
                context.spacing,
                isA<Spacing>(),
              );

              return Container();
            },
          ),
        );
      });
    });
  });
}

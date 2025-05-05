// ignore_for_file: prefer_const_constructors

import 'package:app_ui/app_ui.dart';
import 'package:app_ui/src/colors/dark_app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppTheme', () {
    group('light', () {
      group('themeData', () {
        group('colorScheme', () {
          test('returns colors from LightAppColors', () {
            final colorScheme = const AppTheme.light().themeData.colorScheme;
            expect(colorScheme.brightness, Brightness.light);
            expect(colorScheme.primary, LightAppColors().primary);
            expect(colorScheme.secondary, LightAppColors().secondary);
            expect(colorScheme.surface, LightAppColors().surface);
            expect(colorScheme.surfaceBright, LightAppColors().surfaceBright);
          });
        });

        group('textButton', () {
          test('returns AppTextStyle.textButton if button is enabled', () {
            final style = const AppTheme.light()
                .themeData
                .textButtonTheme
                .style
                ?.textStyle;
            expect(
              style?.resolve({}),
              AppTextStyle.textButton,
            );
          });

          test('returns AppTextStyle.textButtonDisabled if button is disabled',
              () {
            final style = const AppTheme.light()
                .themeData
                .textButtonTheme
                .style
                ?.textStyle;
            expect(
              style?.resolve({WidgetState.disabled}),
              AppTextStyle.textButtonDisabled,
            );
          });
        });
      });
    });

    group('dark', () {
      group('themeData', () {
        group('colorScheme', () {
          test('returns colors from DarkAppColors', () {
            final colorScheme = const AppTheme.dark().themeData.colorScheme;
            expect(colorScheme.brightness, Brightness.dark);
            expect(colorScheme.primary, DarkAppColors().primary);
            expect(colorScheme.secondary, DarkAppColors().secondary);
            expect(colorScheme.surface, DarkAppColors().surface);
            expect(colorScheme.surfaceBright, DarkAppColors().surfaceBright);
          });
        });

        group('textButton', () {
          test('returns AppTextStyle.textButton if button is enabled', () {
            final style = const AppTheme.dark()
                .themeData
                .textButtonTheme
                .style
                ?.textStyle;
            expect(
              style?.resolve({}),
              AppTextStyle.textButton,
            );
          });

          test('returns AppTextStyle.textButtonDisabled if button is disabled',
              () {
            final style = const AppTheme.dark()
                .themeData
                .textButtonTheme
                .style
                ?.textStyle;
            expect(
              style?.resolve({WidgetState.disabled}),
              AppTextStyle.textButtonDisabled,
            );
          });
        });
      });
    });
  });
}

import 'package:app_ui/src/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppTextStyle', () {
    test('headlineLarge returns TextStyle', () {
      expect(AppTextStyle.headlineLarge, isA<TextStyle>());
    });

    test('titleLarge returns TextStyle', () {
      expect(AppTextStyle.titleLarge, isA<TextStyle>());
    });

    test('titleSmall returns TextStyle', () {
      expect(AppTextStyle.titleSmall, isA<TextStyle>());
    });

    test('bodyLarge returns TextStyle', () {
      expect(AppTextStyle.bodyLarge, isA<TextStyle>());
    });

    test('bodyMedium returns TextStyle', () {
      expect(AppTextStyle.bodyMedium, isA<TextStyle>());
    });

    test('labelLarge returns TextStyle', () {
      expect(AppTextStyle.labelLarge, isA<TextStyle>());
    });

    test('textField returns TextStyle', () {
      expect(AppTextStyle.textField, isA<TextStyle>());
    });

    test('textFieldHint returns TextStyle', () {
      expect(AppTextStyle.textFieldHint, isA<TextStyle>());
    });

    test('textFieldLabel returns TextStyle', () {
      expect(AppTextStyle.textFieldLabel, isA<TextStyle>());
    });

    test('textFieldError returns TextStyle', () {
      expect(AppTextStyle.textFieldError, isA<TextStyle>());
    });

    test('textButton returns TextStyle', () {
      expect(AppTextStyle.textButton, isA<TextStyle>());
    });

    test('textButtonDisabled returns TextStyle', () {
      expect(AppTextStyle.textButtonDisabled, isA<TextStyle>());
    });
  });
}

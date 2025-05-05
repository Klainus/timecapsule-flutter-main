import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static const _baseTextStyle = TextStyle(
    package: 'app_ui',
    fontWeight: AppFontWeight.w400,
    fontFamily: FontFamily.interTight,
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );

  static final headlineLarge = _baseTextStyle.copyWith(
    fontSize: 52,
    fontWeight: AppFontWeight.w700,
  );

  static final titleLarge = _baseTextStyle.copyWith(
    fontSize: 24,
    fontWeight: AppFontWeight.w600,
  );

  static final titleSmall = _baseTextStyle.copyWith(
    fontSize: 15,
    fontWeight: AppFontWeight.w600,
  );

  static final bodyLarge = _baseTextStyle.copyWith(
    fontSize: 15,
    fontWeight: AppFontWeight.w400,
  );

  static final bodyMedium = _baseTextStyle.copyWith(
    fontSize: 13,
    fontWeight: AppFontWeight.w400,
  );

  static final labelLarge = _baseTextStyle.copyWith(
    fontSize: 15,
    fontWeight: AppFontWeight.w600,
    height: 1,
  );

  static final textField = _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: AppFontWeight.w500,
  );

  static final textFieldHint = _baseTextStyle.copyWith(
    fontSize: 15,
    fontWeight: AppFontWeight.w400,
  );

  static final textFieldLabel = _baseTextStyle.copyWith(
    fontWeight: AppFontWeight.w400,
    fontSize: 16,
  );

  static final textFieldError = _baseTextStyle.copyWith(
    fontSize: 12,
  );

  static final textButton = _baseTextStyle.copyWith(
    decoration: TextDecoration.underline,
    fontSize: 15,
    fontWeight: AppFontWeight.w600,
  );

  static final textButtonDisabled = _baseTextStyle.copyWith(
    fontWeight: AppFontWeight.w600,
  );
}

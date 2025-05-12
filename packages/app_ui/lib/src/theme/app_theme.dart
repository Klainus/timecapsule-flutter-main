import 'package:app_ui/app_ui.dart';
import 'package:app_ui/src/colors/dark_app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  const AppTheme();

  const factory AppTheme.light() = _LightTheme;
  const factory AppTheme.dark() = _DarkTheme;

  AppColors get _colors;

  ColorScheme get _colorScheme {
    return ColorScheme(
      brightness: _colors.brightness,
      primary: _colors.primary,
      onPrimary: _colors.onPrimary,
      secondary: _colors.secondary,
      onSecondary: _colors.onSecondary,
      tertiary: _colors.tertiary,
      onTertiary: _colors.onTertiary,
      error: _colors.error,
      onError: _colors.onError,
      surface: _colors.surface,
      onSurface: _colors.onSurface,
      surfaceBright: _colors.surfaceBright,
      outline: _colors.outline,
      outlineVariant: _colors.outlineVariant,
      secondaryContainer: _colors.secondaryContainer,
      onSecondaryContainer: _colors.onSecondaryContainer,
    );
  }

  ThemeData get themeData {
    return ThemeData(
      splashFactory: NoSplash.splashFactory,
      colorScheme: _colorScheme,
      extensions: [_spacing],
      appBarTheme: _appBarTheme,
      dialogTheme: _dialogTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      filledButtonTheme: _filledButtonTheme,
      outlinedButtonTheme: _outlinedButtonTheme,
      inputDecorationTheme: _inputDecorationTheme,
      textSelectionTheme: _textSelectionTheme,
      textTheme: _textTheme,
      textButtonTheme: _textButtonTheme,
      dividerTheme: _dividerTheme,
    );
  }

  TextSelectionThemeData get _textSelectionTheme => TextSelectionThemeData(
        cursorColor: _colorScheme.primary,
      );

  static Spacing get _spacing => const Spacing();

  TextTheme get _textTheme => TextTheme(
        headlineLarge: AppTextStyle.headlineLarge,
        titleLarge: AppTextStyle.titleLarge,
        titleSmall: AppTextStyle.titleSmall,
        bodyLarge: AppTextStyle.bodyLarge,
        bodyMedium: AppTextStyle.bodyMedium,
        labelLarge: AppTextStyle.labelLarge,
      );

  static const _borderRadius = BorderRadius.all(
    Radius.circular(5),
  );

  DividerThemeData get _dividerTheme => DividerThemeData(
        color: _colorScheme.outlineVariant,
        space: 0,
        thickness: 1,
      );

  TextButtonThemeData get _textButtonTheme => TextButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return AppTextStyle.textButtonDisabled;
              }
              return AppTextStyle.textButton;
            },
          ),
        ),
      );

  DialogTheme get _dialogTheme => DialogTheme(
        elevation: 0,
        backgroundColor: _colorScheme.surfaceBright,
      );

  static const buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(100),
    ),
  );

  static const _buttonMaximumSize = Size.infinite;

  ElevatedButtonThemeData get _elevatedButtonTheme => ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(buttonShape),
          maximumSize: WidgetStateProperty.all(_buttonMaximumSize),
        ),
      );

  FilledButtonThemeData get _filledButtonTheme => FilledButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(buttonShape),
          maximumSize: WidgetStateProperty.all(_buttonMaximumSize),
          foregroundColor: WidgetStatePropertyAll(_colorScheme.onPrimary),
          backgroundColor: WidgetStatePropertyAll(_colorScheme.primary),
        ),
      );

  OutlinedButtonThemeData get _outlinedButtonTheme => OutlinedButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(buttonShape),
          maximumSize: WidgetStateProperty.all(_buttonMaximumSize),
        ),
      );

  InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
        filled: true,
        fillColor: Colors.transparent,
        errorMaxLines: 2,
        hintStyle: AppTextStyle.textFieldHint,
        errorStyle: AppTextStyle.textFieldError,
        labelStyle: AppTextStyle.textFieldLabel,
        border: const OutlineInputBorder(
          borderRadius: _borderRadius,
        ),
      );

  AppBarTheme get _appBarTheme => AppBarTheme(
        backgroundColor: _colorScheme.surface,
        elevation: 0,
      );
}

class _LightTheme extends AppTheme {
  const _LightTheme();

  @override
  LightAppColors get _colors => const LightAppColors();
}

class _DarkTheme extends AppTheme {
  const _DarkTheme();

  @override
  DarkAppColors get _colors => const DarkAppColors();
}

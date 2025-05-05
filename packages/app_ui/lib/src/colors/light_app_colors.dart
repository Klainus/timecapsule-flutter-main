import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class LightAppColors extends AppColors {
  const LightAppColors();

  static const _dark = Color(0xFF2B2B2B);

  @override
  Brightness get brightness => Brightness.light;

  @override
  Color get surface => const Color(0xFFF8F8F9);

  @override
  Color get onSurface => _dark;

  @override
  Color get surfaceBright => Colors.white;

  @override
  Color get primary => const Color(0xFF43474A);

  @override
  Color get onPrimary => Colors.white;

  @override
  Color get secondary => Colors.white;

  @override
  Color get onSecondary => _dark;

  @override
  Color get error => const Color(0xFFB00020);

  @override
  Color get onError => Colors.white;

  @override
  Color get outline => _dark;

  @override
  Color get outlineVariant => const Color(0xFFD5D5DE);

  @override
  Color get secondaryContainer => const Color(0xFF7F7F88);

  @override
  Color get onSecondaryContainer => Colors.white;
}

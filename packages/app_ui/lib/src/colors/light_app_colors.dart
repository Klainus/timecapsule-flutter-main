import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class LightAppColors extends AppColors {
  const LightAppColors();

  static const _dark = Color(0xFF212121);

  @override
  Brightness get brightness => Brightness.light;

  @override
  Color get surface => const Color(0xFFF5F5DC);

  @override
  Color get onSurface => _dark;

  @override
  Color get background => const Color(0xFFF5F5DC); // Beige

  @override
  Color get surfaceBright => const Color(0xFFF5F5F5);

  @override
  Color get primary => const Color(0xFF6B4226);

  @override
  Color get onPrimary => Colors.white;

  @override
  Color get secondary => const Color(0xFFB68D40);

  @override
  Color get onSecondary => _dark;

  @override
  Color get tertiary => const Color(0xFFB68D40);

  @override
  Color get onTertiary => Colors.black;

  @override
  Color get error => const Color(0xFFFF6060);

  @override
  Color get onError => Colors.white;

  @override
  Color get outline => _dark;

  @override
  Color get outlineVariant => const Color(0xFFD9D9D9); // Light Gray

  @override
  Color get secondaryContainer => const Color(0xFF3EFCA8); // Green

  @override
  Color get onSecondaryContainer => Colors.white;
}

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class DarkAppColors extends AppColors {
  const DarkAppColors();

  static const _light = Color(0xFFECECEC);

  @override
  Brightness get brightness => Brightness.dark;

  @override
  Color get surface => const Color(0xFF1E1E1E);

  @override
  Color get onSurface => _light;

  @override
  Color get background => const Color(0xFF121212); // Dark Gray

  @override
  Color get surfaceBright => const Color(0xFF0D1316);

  @override
  Color get primary => const Color(0xFF7B61FF); // Purple

  @override
  Color get onPrimary => Colors.black;

  @override
  Color get secondary => const Color(0xFFFF9E5E); // Orange

  @override
  Color get onSecondary => _light;

  @override
  Color get tertiary => const Color(0xFF1E1E1E);

  @override
  Color get onTertiary => Colors.black;

  @override
  Color get error => const Color(0xFFFF6060);

  @override
  Color get onError => Colors.white;

  @override
  Color get outline => _light;

  @override
  Color get outlineVariant => Colors.white70;

  @override
  Color get secondaryContainer => const Color(0xFF3EFCA8); // Green

  @override
  Color get onSecondaryContainer => Colors.black;
}

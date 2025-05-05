import 'package:flutter/material.dart';

abstract class AppColors {
  const AppColors();

  Brightness get brightness;
  Color get primary;
  Color get onPrimary;
  Color get secondary;
  Color get onSecondary;
  Color get error;
  Color get onError;
  Color get surface;
  Color get onSurface;
  Color get surfaceBright;
  Color get outline;
  Color get outlineVariant;
  Color get secondaryContainer;
  Color get onSecondaryContainer;
}

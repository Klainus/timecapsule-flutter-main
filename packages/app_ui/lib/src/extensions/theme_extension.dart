import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  Spacing get spacing => theme.extension<Spacing>()!;
}

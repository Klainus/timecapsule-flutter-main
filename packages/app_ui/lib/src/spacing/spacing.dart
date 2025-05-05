import 'dart:ui';

import 'package:flutter/material.dart';

class Spacing extends ThemeExtension<Spacing> {
  const Spacing({
    double? verticalScalingFactor,
    double? horizontalScalingFactor,
  })  : verticalScalingFactor = verticalScalingFactor ?? 16,
        horizontalScalingFactor = horizontalScalingFactor ?? 16;

  final double verticalScalingFactor;
  final double horizontalScalingFactor;

  double get quarterVerticalValue => verticalScalingFactor * 0.25;
  double get halfVerticalValue => verticalScalingFactor * 0.5;
  double get verticalValue => verticalScalingFactor;
  double get doubleVerticalValue => verticalScalingFactor * 2;
  double get tripleVerticalValue => verticalScalingFactor * 3;

  double get quarterHorizontalValue => horizontalScalingFactor * 0.25;
  double get halfHorizontalValue => horizontalScalingFactor * 0.5;
  double get horizontalValue => horizontalScalingFactor;
  double get doubleHorizontalValue => horizontalScalingFactor * 2;
  double get tripleHorizontalValue => horizontalScalingFactor * 3;

  double verticalValueTimes(double x) => verticalValue * x;
  double horizontalValueTimes(double x) => horizontalValue * x;

  Padding verticalTimes(double x) => Padding(
        padding: EdgeInsets.only(
          bottom: verticalValueTimes(x),
        ),
      );

  Padding get quarterVertical => Padding(
        padding: EdgeInsets.only(bottom: quarterVerticalValue),
      );

  Padding get halfVertical => Padding(
        padding: EdgeInsets.only(bottom: halfVerticalValue),
      );

  Padding get vertical => Padding(
        padding: EdgeInsets.only(bottom: verticalValue),
      );

  Padding get doubleVertical => Padding(
        padding: EdgeInsets.only(bottom: doubleVerticalValue),
      );

  Padding get tripleVertical => Padding(
        padding: EdgeInsets.only(bottom: tripleVerticalValue),
      );

  Padding horizontalTimes(double x) => Padding(
        padding: EdgeInsets.only(
          right: horizontalValueTimes(x),
        ),
      );

  Padding get quarterHorizontal => Padding(
        padding: EdgeInsets.only(right: quarterHorizontalValue),
      );

  Padding get halfHorizontal => Padding(
        padding: EdgeInsets.only(right: halfHorizontalValue),
      );

  Padding get horizontal => Padding(
        padding: EdgeInsets.only(right: horizontalValue),
      );

  Padding get doubleHorizontal => Padding(
        padding: EdgeInsets.only(right: doubleHorizontalValue),
      );

  Padding get tripleHorizontal => Padding(
        padding: EdgeInsets.only(right: tripleHorizontalValue),
      );

  @override
  Spacing copyWith({
    double? verticalScalingFactor,
    double? horizontalScalingFactor,
  }) {
    return Spacing(
      verticalScalingFactor: verticalScalingFactor,
      horizontalScalingFactor: horizontalScalingFactor,
    );
  }

  @override
  Spacing lerp(Spacing? other, double t) {
    if (other is! Spacing) return this;

    return Spacing(
      verticalScalingFactor: lerpDouble(
        verticalValue,
        other.verticalValue,
        t,
      ),
      horizontalScalingFactor: lerpDouble(
        horizontalValue,
        other.horizontalValue,
        t,
      ),
    );
  }
}

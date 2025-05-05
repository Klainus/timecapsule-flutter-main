import 'package:flutter/material.dart';

class AnalyticRouteSettings extends RouteSettings {
  const AnalyticRouteSettings(
    this.routeType, {
    super.name,
    super.arguments,
  });

  final Type routeType;
}

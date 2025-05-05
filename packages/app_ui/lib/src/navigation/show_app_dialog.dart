import 'package:analytics_repository/analytics_repository.dart';
import 'package:flutter/material.dart';

void showAppDialog({
  required BuildContext context,
  required Widget Function(BuildContext) builder,
  required AnalyticRouteSettings routeSettings,
}) {
  showGeneralDialog(
    context: context,
    routeSettings: routeSettings,
    pageBuilder: (context, __, ___) => builder(context),
  );
}

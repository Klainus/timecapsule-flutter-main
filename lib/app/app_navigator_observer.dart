import 'package:analytics_repository/analytics_repository.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

export 'package:analytics_repository/analytics_repository.dart'
    show AnalyticRouteSettings, ScreenView;

class AppNavigatorObserver extends NavigatorObserver {
  AppNavigatorObserver(
    this._logger,
    this._analyticsRepository,
  );

  final Logger _logger;
  final AnalyticsRepository _analyticsRepository;

  void _maybeSendScreenView(Route<dynamic>? route) {
    final settings = route?.settings;
    if (settings is! AnalyticRouteSettings) return;

    final screenView = ScreenView.from(settings.routeType);
    _analyticsRepository.send(screenView);

    _logger.fine(screenView.eventName);
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final isInitialRoute = route.isFirst && previousRoute == null;
    if (isInitialRoute) return;
    _maybeSendScreenView(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _maybeSendScreenView(previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    _maybeSendScreenView(newRoute);
  }
}

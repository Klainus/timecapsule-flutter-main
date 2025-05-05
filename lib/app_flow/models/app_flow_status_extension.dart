import 'package:as_boilerplate_flutter/app_flow/app_flow.dart';
import 'package:as_boilerplate_flutter/app_tab/app_tab.dart';
import 'package:as_boilerplate_flutter/enable_analytics/enable_analytics.dart';
import 'package:as_boilerplate_flutter/landing/view/landing_page.dart';
import 'package:flutter/widgets.dart';

extension AppFlowStatusExtension on AppFlowStatus {
  Route<dynamic> get route => switch (this) {
        AppFlowStatus.landing => LandingPage.route(),
        AppFlowStatus.enableAnalytics => EnableAnalyticsPage.route(),
        AppFlowStatus.home => TabRootPage.route(),
      };
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_repository/user_repository.dart';

part 'app_flow.freezed.dart';
part 'app_flow.g.dart';

enum AppFlowStatus {
  landing,
  enableAnalytics,
  home;
}

@freezed
abstract class AppFlow with _$AppFlow {
  const factory AppFlow({
    @Default(false) bool isLoggedIn,
    @Default(false) bool isEnableAnalyticsCompleted,
  }) = _AppFlow;

  const AppFlow._();

  factory AppFlow.fromJson(Map<String, dynamic> json) =>
      _$AppFlowFromJson(json);

  factory AppFlow.from(AppFlow flow, User user) {
    return AppFlow(
      isLoggedIn: user.isNotEmpty,
      isEnableAnalyticsCompleted: flow.isEnableAnalyticsCompleted,
    );
  }

  AppFlowStatus get status {
    if (!isLoggedIn) return AppFlowStatus.landing;
    if (!isEnableAnalyticsCompleted) return AppFlowStatus.enableAnalytics;
    return AppFlowStatus.home;
  }
}

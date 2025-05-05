part of 'app_flow_bloc.dart';

sealed class AppFlowEvent {
  const AppFlowEvent();
}

final class _AppFlowUserChanged extends AppFlowEvent {
  const _AppFlowUserChanged(this.user);

  final User user;
}

final class AppFlowEnableAnalyticsCompleted extends AppFlowEvent
    with EquatableMixin, Analytic {
  const AppFlowEnableAnalyticsCompleted();

  @override
  List<Object?> get props => [];
}

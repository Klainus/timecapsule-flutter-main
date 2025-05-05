part of 'enable_analytics_bloc.dart';

sealed class EnableAnalyticsEvent extends Equatable {
  const EnableAnalyticsEvent();

  @override
  List<Object?> get props => [];
}

final class EnableAnalyticsPressed extends EnableAnalyticsEvent with Analytic {
  const EnableAnalyticsPressed();
}

final class EnableAnalyticsSkipped extends EnableAnalyticsEvent with Analytic {
  const EnableAnalyticsSkipped();
}

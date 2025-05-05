import 'package:analytics_repository/analytics_repository.dart';
import 'package:as_boilerplate_flutter/analytics/bloc/analytics_bloc.dart';
import 'package:as_boilerplate_flutter/app_flow/app_flow.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TutorialCompleteEventListener
    extends BlocListener<AppFlowBloc, AppFlowState> {
  TutorialCompleteEventListener({super.key})
      : super(
          listenWhen: (previous, current) =>
              previous.flow.status == AppFlowStatus.enableAnalytics &&
              current.flow.status == AppFlowStatus.home,
          listener: (context, state) {
            context.read<AnalyticsBloc>().add(
                  const TutorialCompleteEvent(),
                );
          },
        );
}

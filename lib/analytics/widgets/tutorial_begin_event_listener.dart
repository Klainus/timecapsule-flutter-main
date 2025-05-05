import 'package:analytics_repository/analytics_repository.dart';
import 'package:as_boilerplate_flutter/analytics/bloc/analytics_bloc.dart';
import 'package:as_boilerplate_flutter/app_flow/app_flow.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TutorialBeginEventListener
    extends BlocListener<AppFlowBloc, AppFlowState> {
  TutorialBeginEventListener({super.key})
      : super(
          listenWhen: (previous, current) =>
              previous.flow.status == AppFlowStatus.landing &&
              current.flow.status == AppFlowStatus.enableAnalytics,
          listener: (context, state) {
            context.read<AnalyticsBloc>().add(
                  const TutorialBeginEvent(),
                );
          },
        );
}

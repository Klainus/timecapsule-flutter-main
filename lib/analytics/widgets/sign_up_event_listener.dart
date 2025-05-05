import 'package:analytics_repository/analytics_repository.dart';
import 'package:as_boilerplate_flutter/analytics/bloc/analytics_bloc.dart';
import 'package:as_boilerplate_flutter/app_flow/app_flow.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// TODO(User): Add this listener in the last step of the sign-up flow.
class SignUpEventListener extends StatelessWidget {
  const SignUpEventListener({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppFlowBloc, AppFlowState>(
      listenWhen: (previous, current) =>
          previous.flow.status == AppFlowStatus.landing &&
          current.flow.status != AppFlowStatus.landing,
      listener: (context, state) {
        context.read<AnalyticsBloc>().add(
              const SignUpEvent(),
            );
      },
      child: child,
    );
  }
}

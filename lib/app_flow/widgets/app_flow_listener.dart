import 'package:as_boilerplate_flutter/app_flow/app_flow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppFlowListener extends BlocListener<AppFlowBloc, AppFlowState> {
  AppFlowListener(
    GlobalKey<NavigatorState> navigatorKey, {
    super.key,
  }) : super(
          listenWhen: (previous, current) =>
              previous.flow.status != current.flow.status,
          listener: (context, state) {
            navigatorKey.currentState!.pushAndRemoveUntil(
              state.flow.status.route,
              (route) => false,
            );
          },
        );
}

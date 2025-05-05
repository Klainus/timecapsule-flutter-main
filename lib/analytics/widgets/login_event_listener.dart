import 'package:analytics_repository/analytics_repository.dart';
import 'package:as_boilerplate_flutter/analytics/bloc/analytics_bloc.dart';
import 'package:as_boilerplate_flutter/authentication/authentication.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginEventListener
    extends BlocListener<AuthenticationBloc, AuthenticationState> {
  LoginEventListener({super.key})
      : super(
          listenWhen: (previous, current) =>
              previous.user.isEmpty && current.user.isNotEmpty,
          listener: (context, state) {
            context.read<AnalyticsBloc>().add(
                  const LoginEvent(),
                );
          },
        );
}

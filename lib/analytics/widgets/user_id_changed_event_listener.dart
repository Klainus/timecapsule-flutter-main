import 'package:analytics_repository/analytics_repository.dart';
import 'package:as_boilerplate_flutter/analytics/bloc/analytics_bloc.dart';
import 'package:as_boilerplate_flutter/authentication/authentication.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserIdChangedEventListener
    extends BlocListener<AuthenticationBloc, AuthenticationState> {
  UserIdChangedEventListener({super.key})
      : super(
          listenWhen: (previous, current) =>
              previous.user.id != current.user.id,
          listener: (context, state) {
            context.read<AnalyticsBloc>().add(
                  UserIdChangedEvent(state.user.id),
                );
          },
        );
}

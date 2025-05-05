import 'package:analytics_repository/analytics_repository.dart';
import 'package:as_boilerplate_flutter/analytics/bloc/analytics_bloc.dart';
import 'package:as_boilerplate_flutter/app/view/app_view.dart';
import 'package:as_boilerplate_flutter/app_flow/app_flow.dart';
import 'package:as_boilerplate_flutter/authentication/authentication.dart';
import 'package:as_boilerplate_flutter/theme/theme.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:external_link_repository/external_link_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

class App extends StatelessWidget {
  const App({
    required AnalyticsRepository analyticsRepository,
    required AuthenticationRepository authenticationRepository,
    required ExternalLinkRepository externalLinkRepository,
    required UserRepository userRepository,
    super.key,
  })  : _analyticsRepository = analyticsRepository,
        _authenticationRepository = authenticationRepository,
        _externalLinkRepository = externalLinkRepository,
        _userRepository = userRepository;

  final AnalyticsRepository _analyticsRepository;
  final AuthenticationRepository _authenticationRepository;
  final ExternalLinkRepository _externalLinkRepository;
  final UserRepository _userRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _analyticsRepository),
        RepositoryProvider.value(value: _authenticationRepository),
        RepositoryProvider.value(value: _externalLinkRepository),
        RepositoryProvider.value(value: _userRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy: false,
            create: (_) => AnalyticsBloc(_analyticsRepository),
          ),
          BlocProvider(
            create: (_) => AppFlowBloc(
              userRepository: _userRepository,
            ),
          ),
          BlocProvider(
            lazy: false,
            create: (_) => AuthenticationBloc(
              authenticationRepository: _authenticationRepository,
              userRepository: _userRepository,
            )
              ..add(
                const AuthenticationStatusSubscriptionRequested(),
              )
              ..add(
                const AuthenticationUserSubscriptionRequested(),
              ),
          ),
          BlocProvider(
            create: (_) => ThemeBloc(),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

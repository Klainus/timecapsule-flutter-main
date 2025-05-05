import 'package:analytics_repository/analytics_repository.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:app_logging/app_logging.dart';
import 'package:app_ui/app_ui.dart';
import 'package:as_boilerplate_flutter/analytics/analytics.dart';
import 'package:as_boilerplate_flutter/app/app_navigator_observer.dart';
import 'package:as_boilerplate_flutter/app_flow/app_flow.dart';
import 'package:as_boilerplate_flutter/app_flow/widgets/app_flow_listener.dart';
import 'package:as_boilerplate_flutter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final themeMode = context.select(
      (ThemeBloc bloc) => bloc.state,
    );

    return MaterialApp(
      themeMode: themeMode,
      navigatorKey: _navigatorKey,
      theme: const AppTheme.light().themeData,
      darkTheme: const AppTheme.dark().themeData,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      navigatorObservers: [
        AppNavigatorObserver(
          AppLogging.logger,
          context.read<AnalyticsRepository>(),
        ),
      ],
      builder: (context, child) => Nested(
        children: [
          AppFlowListener(_navigatorKey),
          const AnalyticsListenerGroup(),
        ],
        child: child,
      ),
      onGenerateRoute: (_) {
        final route = context.read<AppFlowBloc>().state.flow.status.route;
        return route;
      },
    );
  }
}

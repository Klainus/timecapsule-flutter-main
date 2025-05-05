import 'package:analytics_repository/analytics_repository.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:as_boilerplate_flutter/app_flow/bloc/bloc.dart';
import 'package:as_boilerplate_flutter/enable_analytics/enable_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

class EnableAnalyticsPage extends StatelessWidget {
  const EnableAnalyticsPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => EnableAnalyticsBloc(
          context.read<AnalyticsRepository>(),
          context.read<UserRepository>(),
        ),
        child: const EnableAnalyticsPage(),
      ),
      settings: const AnalyticRouteSettings(EnableAnalyticsPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<EnableAnalyticsBloc, EnableAnalyticsState>(
          listenWhen: (previous, current) =>
              !previous.status.isSuccess && current.status.isSuccess,
          listener: (context, state) {
            context.read<AppFlowBloc>().add(
                  const AppFlowEnableAnalyticsCompleted(),
                );
          },
        ),
        BlocListener<EnableAnalyticsBloc, EnableAnalyticsState>(
          listenWhen: (previous, current) =>
              !previous.status.isFailure && current.status.isFailure,
          listener: (context, state) {
            context.read<AppFlowBloc>().add(
                  const AppFlowEnableAnalyticsCompleted(),
                );
          },
        ),
      ],
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        body: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: spacing.horizontalValueTimes(1.5),
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const _Title(),
                  spacing.vertical,
                  const _Subtitle(),
                  spacing.verticalTimes(2.5),
                  const Flexible(
                    child: FittedBox(
                      child: _Image(),
                    ),
                  ),
                ],
              ),
            ),
            const _EnableButton(),
            spacing.vertical,
            const _SkipButton(),
            spacing.verticalTimes(1.5),
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final l10n = context.l10n;

    return Text(
      l10n.enableAnalyticsTitle,
      style: textTheme.titleLarge,
      textAlign: TextAlign.center,
    );
  }
}

class _Subtitle extends StatelessWidget {
  const _Subtitle();

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final l10n = context.l10n;

    return Text(
      l10n.enableAnalyticsSubtitle,
      style: textTheme.bodyLarge,
      textAlign: TextAlign.center,
    );
  }
}

class _Image extends StatelessWidget {
  const _Image();

  @override
  Widget build(BuildContext context) {
    return Assets.images.appShackLogo.image(
      width: 200,
      height: 200,
    );
  }
}

class _EnableButton extends StatelessWidget {
  const _EnableButton();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppFilledButton.expand(
      text: l10n.enableAnalyticsAction,
      onPressed: () {
        context.read<EnableAnalyticsBloc>().add(
              const EnableAnalyticsPressed(),
            );
      },
    );
  }
}

class _SkipButton extends StatelessWidget {
  const _SkipButton();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppOutlinedButton.expand(
      text: l10n.skipAnalyticsAction,
      onPressed: () {
        context.read<EnableAnalyticsBloc>().add(
              const EnableAnalyticsSkipped(),
            );
      },
    );
  }
}

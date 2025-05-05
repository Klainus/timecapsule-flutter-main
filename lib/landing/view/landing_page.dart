import 'package:analytics_repository/analytics_repository.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:as_boilerplate_flutter/create_account/create_account.dart';
import 'package:as_boilerplate_flutter/login/view/login_page.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => const LandingPage(),
      settings: const AnalyticRouteSettings(LandingPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: spacing.horizontalValueTimes(1.5),
          ),
          child: Column(
            children: [
              spacing.tripleVertical,
              const _HeaderText(),
              const Spacer(),
              const _LoginButton(),
              spacing.verticalTimes(0.75),
              const _CreateAccountButton(),
              spacing.verticalTimes(1.5),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderText extends StatelessWidget {
  const _HeaderText();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = context.textTheme;

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.landingPageTitle,
              style: textTheme.headlineLarge,
            ),
          ],
        ),
      ],
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppFilledButton.expand(
      text: l10n.loginAction,
      onPressed: () {
        Navigator.of(context).push(
          LoginPage.route(),
        );
      },
    );
  }
}

class _CreateAccountButton extends StatelessWidget {
  const _CreateAccountButton();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppOutlinedButton.expand(
      text: l10n.createAccountAction,
      onPressed: () {
        Navigator.of(context).push(
          CreateAccountPage.route(),
        );
      },
    );
  }
}

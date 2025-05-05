import 'package:analytics_repository/analytics_repository.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:as_boilerplate_flutter/app_tab/view/tab_root_page.dart';
import 'package:as_boilerplate_flutter/login/login.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => LoginBloc(
          context.read<AuthenticationRepository>(),
        ),
        child: const LoginPage(),
      ),
      settings: const AnalyticRouteSettings(LoginPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: BaseAppBar(),
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: spacing.horizontalValueTimes(1.5),
          ),
          child: Column(
            children: [
              const _Title(),
              spacing.doubleVertical,
              const LoginEmailTextField(),
              spacing.doubleVertical,
              const LoginPasswordTextField(),
              spacing.doubleVertical,
              const _SubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = context.textTheme;

    return Text(
      l10n.loginPageTitle,
      style: textTheme.titleLarge,
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (LoginBloc bloc) => bloc.state.form.isLoading,
    );

    final l10n = context.l10n;

    return AppFilledButton.expand(
      isLoading: isLoading,
      text: l10n.loginFormCallToAction,
      onPressed: () {
        context.read<LoginBloc>().add(
              const LoginSubmitted(),
            );

        // TODO(User): Remove this navigation when connected to backend
        Navigator.of(context).pushAndRemoveUntil(
          TabRootPage.route(),
          (route) => false,
        );
      },
    );
  }
}

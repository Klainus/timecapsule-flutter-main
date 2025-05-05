import 'package:analytics_repository/analytics_repository.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:as_boilerplate_flutter/app_tab/view/tab_root_page.dart';
import 'package:as_boilerplate_flutter/create_account/create_account.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:external_link_repository/external_link_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => CreateAccountBloc(
          context.read<AuthenticationRepository>(),
          context.read<ExternalLinkRepository>(),
        ),
        child: const CreateAccountPage(),
      ),
      settings: const AnalyticRouteSettings(CreateAccountPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateAccountBloc, CreateAccountState>(
      listenWhen: (previous, current) =>
          !previous.form.status.isSuccess && current.form.status.isSuccess,
      listener: (context, state) {
        // TODO(User): Remove this navigation when connected to backend
        Navigator.of(context).pushAndRemoveUntil(
          TabRootPage.route(),
          (route) => false,
        );
      },
      child: const Scaffold(
        appBar: BaseAppBar(),
        body: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final spacing = context.spacing;
    final l10n = context.l10n;

    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: spacing.horizontalValueTimes(1.5),
          ),
          child: Column(
            children: [
              spacing.halfVertical,
              Text(
                l10n.createAccountPageTitle,
                style: textTheme.titleLarge,
              ),
              spacing.tripleVertical,
              const CreateAccountEmailTextField(),
              spacing.vertical,
              const CreateAccountPasswordTextField(),
              spacing.tripleVertical,
              const _SubmitButton(),
              spacing.vertical,
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: spacing.quarterHorizontalValue,
                ),
                child: const PolicyLinks(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (CreateAccountBloc bloc) => bloc.state.form.isLoading,
    );

    final l10n = context.l10n;

    return AppFilledButton.expand(
      isLoading: isLoading,
      text: l10n.createAccountButton,
      onPressed: () {
        context.read<CreateAccountBloc>().add(
              const CreateAccountSubmitted(),
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

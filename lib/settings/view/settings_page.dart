import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:as_boilerplate_flutter/authentication/authentication.dart';
import 'package:as_boilerplate_flutter/theme/widgets/theme_radio_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SettingsView();
  }
}

class SettingsView extends StatelessWidget {
  @visibleForTesting
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settingsPageTitle),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: spacing.horizontalValueTimes(1.5),
        vertical: spacing.verticalValueTimes(1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _Header(),
          spacing.vertical,
          const ThemeRadioGroup(),
          spacing.vertical,
          const _LogoutButton(),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final l10n = context.l10n;

    return Text(
      l10n.settingsThemeTitle,
      style: textTheme.titleMedium,
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppFilledButton.expand(
      text: l10n.logOutAction,
      onPressed: () {
        context.read<AuthenticationBloc>().add(
              const AuthenticationLogoutPressed(),
            );
      },
    );
  }
}

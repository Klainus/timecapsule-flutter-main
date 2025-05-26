import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:as_boilerplate_flutter/app_tab/bloc/app_tab_bloc.dart';
import 'package:as_boilerplate_flutter/app_tab/widgets/time_capsule_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.colorScheme;
    final selectedIndex = context.select(
      (AppTabBloc bloc) => bloc.state.index,
    );

    final l10n = context.l10n;

    return NavigationBar(
      backgroundColor: theme.surface,
      elevation: 8,
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        context.read<AppTabBloc>().add(
              AppTabPressed(index),
            );
      },
      destinations: [
        NavigationDestination(
          icon: const Icon(Icons.home_outlined),
          selectedIcon: const Icon(Icons.home),
          label: l10n.navigationHome,
        ),
        const NavigationDestination(
          icon: TimeCapsuleIcon(),
          label: 'Time Capsule',
        ),
        NavigationDestination(
          icon: const Icon(
            Icons.settings_outlined,
          ),
          label: l10n.navigationSettings,
        ),
      ],
    );
  }
}

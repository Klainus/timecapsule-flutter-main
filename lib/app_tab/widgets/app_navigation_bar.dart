import 'package:app_l10n/app_l10n.dart';
import 'package:as_boilerplate_flutter/app_tab/bloc/app_tab_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.select(
      (AppTabBloc bloc) => bloc.state.index,
    );

    final l10n = context.l10n;

    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        context.read<AppTabBloc>().add(
              AppTabPressed(index),
            );
      },
      destinations: [
        NavigationDestination(
          icon: const Icon(Icons.home_outlined),
          label: l10n.navigationHome,
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

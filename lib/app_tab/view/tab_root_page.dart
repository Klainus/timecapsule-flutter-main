import 'package:as_boilerplate_flutter/add_capsule/view/add_capsule_page.dart';
import 'package:as_boilerplate_flutter/app_tab/app_tab.dart';
import 'package:as_boilerplate_flutter/app_tab/widgets/app_navigation_bar.dart';
import 'package:as_boilerplate_flutter/counter/view/counter_page.dart';
import 'package:as_boilerplate_flutter/settings/view/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabRootPage extends StatelessWidget {
  const TabRootPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (_) => AppTabBloc(),
        child: const TabRootPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Body(),
      bottomNavigationBar: AppNavigationBar(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select(
      (AppTabBloc bloc) => bloc.state,
    );

    return IndexedStack(
      index: selectedTab.index,
      children: [
        for (final tab in AppTab.values)
          switch (tab) {
            AppTab.timecapsule =>
              const AddTimeCapsulePage(), // TODO: implement time capsule
            AppTab.home => const CounterPage(),
            AppTab.settings => const SettingsPage(),
          },
      ],
    );
  }
}

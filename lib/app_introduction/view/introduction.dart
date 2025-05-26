import 'package:as_boilerplate_flutter/app_introduction/view/introduction_segment.dart';
import 'package:as_boilerplate_flutter/app_tab/view/tab_root_page.dart';
import 'package:as_boilerplate_flutter/create_account/bloc/create_account_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => const IntroScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          const IntroPage(
            title: 'Welcome to Time Capsule',
            description:
                'Discover the basic features to capture your own thoughts.',
            background: 'assets/images/test_meteor.png',
          ),
          const IntroPage(
            title: 'What you can do',
            description:
                'Write down your thoughts and lock them behind a date.',
            background: 'assets/images/test_meteor.png',
          ),
          IntroPage(
            title: 'Get Started',
            description: 'Create your first capsule and explore the app now!',
            background: 'assets/images/test_meteor.png',
            showButton: true,
            onButtonPressed: () {
              Navigator.of(context)
                  .pushAndRemoveUntil(TabRootPage.route(), (route) => false);
              final bloc = context.read<CreateAccountBloc>()
                ..add(const CreateAccountShowIntroChanged(false));
            },
          ),
        ],
      ),
    );
  }
}

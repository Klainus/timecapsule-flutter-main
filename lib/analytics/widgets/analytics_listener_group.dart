import 'package:as_boilerplate_flutter/analytics/analytics.dart';
import 'package:flutter/widgets.dart';
import 'package:nested/nested.dart';

class AnalyticsListenerGroup extends SingleChildStatelessWidget {
  const AnalyticsListenerGroup({super.key});

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return Nested(
      children: [
        LoginEventListener(),
        UserIdChangedEventListener(),
        TutorialBeginEventListener(),
        TutorialCompleteEventListener(),
      ],
      child: child,
    );
  }
}

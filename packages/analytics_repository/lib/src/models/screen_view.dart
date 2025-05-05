import 'package:analytics_repository/analytics_repository.dart';
import 'package:recase/recase.dart';

class ScreenView extends AnalyticsEvent {
  const ScreenView._(this.screenName);

  factory ScreenView.from(Type type) {
    final routeName = ReCase(type.toString()).snakeCase;
    assert(
      routeName.length <= 40,
      'routeName must be less than or equal to 40 characters',
    );
    return ScreenView._(routeName);
  }

  final String screenName;

  String get eventName => '${screenName}_viewed';

  @override
  Future<void> send(FirebaseAnalytics analytics) async {
    await analytics.logScreenView(screenName: screenName);
  }
}

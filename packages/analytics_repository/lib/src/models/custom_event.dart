import 'package:analytics_repository/analytics_repository.dart';

class CustomEvent extends AnalyticsEvent {
  const CustomEvent(
    this.name, {
    this.parameters = const <String, Object>{},
  }) : assert(
          name.length <= 40,
          'name must be less than 40 characters',
        );

  final String name;
  final Map<String, Object> parameters;

  @override
  Future<void> send(FirebaseAnalytics analytics) async {
    await analytics.logEvent(
      name: name,
      parameters: parameters,
    );
  }

  @override
  List<Object?> get props => [name, parameters];
}
